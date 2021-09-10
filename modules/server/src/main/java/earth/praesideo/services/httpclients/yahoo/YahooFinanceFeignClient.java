package earth.praesideo.services.httpclients.yahoo;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@FeignClient(name = "yahooFeignClient", configuration =  YahooFeignClientConfig.class, url = "${yahoo.base.url}")
public interface YahooFinanceFeignClient {

    @GetMapping(value = "/v6/finance/quote", produces = "application/json")
    YahooResponseDto getCurrencies(@RequestParam("symbols") String symbols);
}
