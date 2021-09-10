package earth.praesideo.utils;

import earth.praesideo.database.entities.products.ProductSubscription;
import earth.praesideo.database.repositories.users.UserPropertiesRepository;
import earth.praesideo.services.ProductService;
import lombok.Getter;
import org.springframework.stereotype.Component;

import java.time.LocalDate;
import java.time.ZoneId;
import java.util.Date;
import java.util.Optional;

import static java.time.temporal.ChronoUnit.DAYS;

/**
 * @author Koshman Vadim
 */
@Component
@Getter
public class SubscriptionUtil {
    private final String FREE_PERIOD_SUBSCRIPTION_DAYS_KEY = "FREE_PERIOD_SUBSCRIPTION_DAYS";
    private final String FREE_PERIOD_SUBSCRIPTION_DAYS_DEFAULT = "30";

    private final ProductService productService;
    private final UserPropertiesRepository propertiesRepository;

    public SubscriptionUtil(ProductService productService, UserPropertiesRepository propertiesRepository) {
        this.productService = productService;
        this.propertiesRepository = propertiesRepository;
    }

    @Getter
    public class SubscriptionContent {
        private final Optional<ProductSubscription> currentSubscription;
        private final Integer freePeriodDays;

        public SubscriptionContent(Integer companyId) {
            var freePeriod = propertiesRepository.findFirstByKey(FREE_PERIOD_SUBSCRIPTION_DAYS_KEY);
            this.currentSubscription =  productService.getProductSubscriptionByCompanyId(companyId);
            this.freePeriodDays = Integer.parseInt(freePeriod.isPresent() ? freePeriod.get().getValue() : FREE_PERIOD_SUBSCRIPTION_DAYS_DEFAULT);
        }
    }

    public boolean ifSubscriptionFreePeriodExpired(Integer companyId){
        SubscriptionContent subscriptionContent = new SubscriptionContent(companyId);
        if (subscriptionContent.getCurrentSubscription().isPresent()){
            ProductSubscription productSubscription = subscriptionContent.getCurrentSubscription().get();
            LocalDate startSubscriptionDate = convertToLocalDateViaInstant(productSubscription.getStartDate());
            LocalDate currentDate = LocalDate.now();
            return startSubscriptionDate.plusDays(subscriptionContent.freePeriodDays).isBefore(currentDate);
        }
        return false;
    }

    public boolean ifSubscriptionFreePeriodExpired(final ProductSubscription productSubscription) {
        LocalDate startSubscriptionDate = convertToLocalDateViaInstant(productSubscription.getStartDate());
        LocalDate currentDate = LocalDate.now();
        return startSubscriptionDate.plusDays(Integer.parseInt(FREE_PERIOD_SUBSCRIPTION_DAYS_DEFAULT)).isBefore(currentDate);
    }

    public boolean iYearPassed(final ProductSubscription productSubscription) {
        LocalDate startSubscriptionDate = convertToLocalDateViaInstant(productSubscription.getStartDate());
        LocalDate currentDate = LocalDate.now();
        return startSubscriptionDate.withYear(currentDate.getYear()).isBefore(currentDate.minusYears(1));
    }

    public LocalDate convertToLocalDateViaInstant(Date dateToConvert) {
        return dateToConvert.toInstant()
                .atZone(ZoneId.systemDefault())
                .toLocalDate();
    }

    public long daysBetween(final Date date1, final Date date2) {
        LocalDate startDate = convertToLocalDateViaInstant(date1);
        LocalDate endDate = convertToLocalDateViaInstant(date2);
        return DAYS.between(startDate, endDate);
    }
}
