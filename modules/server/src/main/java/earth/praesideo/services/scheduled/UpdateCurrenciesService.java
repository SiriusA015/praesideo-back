package earth.praesideo.services.scheduled;

import earth.praesideo.database.entities.common.BaseCurrencyEntity;
import earth.praesideo.database.entities.common.RefFx;
import earth.praesideo.database.entities.tech.AppLogType;
import earth.praesideo.database.repositories.common.BaseCurrencyRepository;
import earth.praesideo.database.repositories.common.RefFxRepository;
import earth.praesideo.services.httpclients.yahoo.YahooFinanceFeignClient;
import earth.praesideo.services.tech.AppLogService;
import earth.praesideo.utils.StringUtils;
import feign.FeignException;
import lombok.RequiredArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.stream.Collectors;

@RequiredArgsConstructor
@Service
public class UpdateCurrenciesService {
    private static final Logger LOGGER = LoggerFactory.getLogger(UpdateCurrenciesService.class);

    private final AppLogService           appLogService;
    private final RefFxRepository         refFxRepository;
    private final BaseCurrencyRepository  baseCurrencyRepository;
    private final YahooFinanceFeignClient yahooClient;

    @Value("${yahoo.finance.base_currency}")
    private String baseCurrency;

    @Scheduled(cron = "${yahoo.finance.cronjob}")
    public void scheduleUpdateCurrencies() {
        updateCurrencies();
    }

    public void updateCurrencies() {
        final AtomicInteger counter = new AtomicInteger();
        final var currencies = baseCurrencyRepository.findAllByOrderByCodeAsc();
        final var symbols = currencies.stream()
                .map(BaseCurrencyEntity::getCode)
                .distinct()
                .filter(c -> !c.equalsIgnoreCase(baseCurrency))
                .map(c -> c.trim() + baseCurrency + "=X")
                .collect(Collectors.groupingBy(it -> counter.getAndIncrement() / 10))
                .values();

        final var currenciesMap = currencies.stream()
                .collect(Collectors.groupingBy(c -> c.getCode().trim()));
        symbols.forEach(pair -> {
            var params = String.join(",", pair);
            LOGGER.info("Currencies partition: {}", params);
            try {
                final var response = yahooClient.getCurrencies(params);
                final var date = new Date();
                if (response != null && response.getQuoteResponse() != null &&
                        response.getQuoteResponse().getResult() != null) {
                    response.getQuoteResponse().getResult().forEach(result -> {
                        var currencyCode = result.getSymbol().replace(baseCurrency + "=X", "");
                        final var currencyEntities = currenciesMap.get(currencyCode);
                        if (currencyEntities != null) {
                            currencyEntities.forEach(entity -> {
                                LOGGER.info("Set conversion rate {} {} {}", entity.getBaseCurrencyId(), currencyCode, result.getBid());
                                entity.setConversionRate(result.getBid());
                                var refFx = new RefFx()
                                        .setBaseCurrencyEntity(entity)
                                        .setRate(result.getBid())
                                        .setDate(date);
                                refFxRepository.save(refFx);
                            });
                            baseCurrencyRepository.saveAllAndFlush(currencyEntities);
                        }
                    });
                }
            } catch (FeignException ex) {
                LOGGER.error("Download FX rates failed: {}", ex.getMessage());
                appLogService.addFailedRequestLog(AppLogType.DOWNLOAD_FX_RATES, StringUtils.exceptionToString(ex));
            } catch (Exception ex) {
                LOGGER.error("Update FX rates failed: {}", StringUtils.exceptionToString(ex));
                appLogService.addFailedRequestLog(AppLogType.DOWNLOAD_FX_RATES, StringUtils.exceptionToString(ex));
            }
        });
    }
}
