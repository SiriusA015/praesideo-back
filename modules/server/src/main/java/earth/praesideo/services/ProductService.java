package earth.praesideo.services;

import earth.praesideo.database.entities.products.Product;
import earth.praesideo.database.entities.products.ProductSubscription;
import earth.praesideo.database.entities.products.ProductVariant;
import earth.praesideo.database.repositories.products.ProductRepository;
import earth.praesideo.database.repositories.products.ProductSubscriptionRepository;
import earth.praesideo.database.repositories.products.ProductVariantRepository;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.Date;
import java.util.List;
import java.util.Optional;

@AllArgsConstructor
@Service
public class ProductService {

    private static final Integer IMPACT_PERFORMANCE_ONLY_PRODUCT_VARIANT_ID = 1;
    private static final Integer IMPACT_PERFORMANCE_AND_MEASUREMENT_PRODUCT_VARIANT_ID = 2;
    private static final Integer IMPACT_MEASUREMENT_ONLY_PRODUCT_VARIANT_ID = 3;
    private static final Integer PRODUCT_ID_TRACE=2;

    private final ProductRepository             productRepository;
    private final ProductVariantRepository      productVariantRepository;
    private final ProductSubscriptionRepository productSubscriptionRepository;
    private final CompanyService                companyService;

    public List<Product> getProducts() {
        return productRepository.findAll();
    }

    public List<ProductVariant> getProductVariantByProductId(final Integer productId) {
        return productVariantRepository.findAllByProductId(productId);
    }

    public Optional<ProductSubscription> getProductSubscriptionByCompanyId(final Integer companyId) {
        return productSubscriptionRepository.findByCompanyCompanyIdAndEndDateIsNull(companyId);
    }

    public boolean isImpactMeasurementOnlySubscription(final Integer companyId) {
        return productSubscriptionRepository.existsByCompanyCompanyIdAndProductVariantIdAndEndDateIsNull
                (companyId, IMPACT_MEASUREMENT_ONLY_PRODUCT_VARIANT_ID);
    }
    public boolean isImpactPerformanceOnlySubscription(final Integer companyId) {
        return productSubscriptionRepository.existsByCompanyCompanyIdAndProductVariantIdAndEndDateIsNull
                (companyId, IMPACT_PERFORMANCE_ONLY_PRODUCT_VARIANT_ID);
    }
    public boolean isImpactPerformanceAndMeasurementSubscription(final Integer companyId) {
        return productSubscriptionRepository.existsByCompanyCompanyIdAndProductVariantIdAndEndDateIsNull
                (companyId, IMPACT_PERFORMANCE_AND_MEASUREMENT_PRODUCT_VARIANT_ID);
    }
    public boolean isTraceSubscription(final Integer companyId) {
        var subs= productSubscriptionRepository.findByCompanyCompanyIdAndEndDateIsNull(companyId);
        if (subs.isPresent()) {
            if (subs.get().getProductVariant().getProduct().getId()==PRODUCT_ID_TRACE) {
                return true;
            }
        }
        return false;
    }

    @Transactional
    public ProductSubscription subscribe(final Integer productVariantId, final Integer companyId) {
        final var currentSubscription = productSubscriptionRepository
                .findByCompanyCompanyIdAndEndDateIsNull(companyId);
        if (currentSubscription.isPresent()) {
            var cs = currentSubscription.get();
            cs.setEndDate(new Date());
            productSubscriptionRepository.save(cs);
        }
        var company = companyService.getCompanyEntityById(companyId);
        var variant = productVariantRepository.getById(productVariantId);
        var newSubscription = new ProductSubscription();
        newSubscription.setProductVariant(variant);
        newSubscription.setCompany(company);
        newSubscription.setStartDate(new Date());
        return productSubscriptionRepository.save(newSubscription);
    }
}
