package earth.praesideo.services.scheduled;

import earth.praesideo.services.BillingService;
import lombok.AllArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

@AllArgsConstructor
@Component
public class BillGenerationService {
    private static final Logger LOGGER = LoggerFactory.getLogger(BillGenerationService.class);

    private final BillingService billingService;

    @Scheduled(cron = "${billing.daily.cronjob}")
    public void scheduleDailyGenerateBills() {
        billingService.generateDailyBills();
    }

    @Scheduled(cron = "${billing.yearly.cronjob}")
    public void scheduleYearlyGenerateBills() {
        billingService.generateYearlyBills();
    }
}
