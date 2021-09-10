package earth.praesideo.database.repositories.products;

import earth.praesideo.database.entities.products.ProductSubscription;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;
import java.util.Optional;

@Repository
public interface ProductSubscriptionRepository extends JpaRepository<ProductSubscription, Integer> {
    List<ProductSubscription> findByEndDateIsNull();
    List<ProductSubscription> findByEndDateIsNotNullAndEndDateAfter(Date endDate);
    @Query(nativeQuery = true, value = "SELECT * FROM public.t_product_subscription WHERE date_part('year', end_date) = date_part('year', CURRENT_DATE) or end_date is null")
    List<ProductSubscription> findByYear();

    Optional<ProductSubscription> findByCompanyCompanyIdAndEndDateIsNull(Integer companyId);
    Optional<ProductSubscription> findByCompanyCompanyIdAndEndDateIsNotNullAndEndDateAfter(Integer companyId, Date endDate);
    boolean existsByCompanyCompanyIdAndProductVariantIdAndEndDateIsNull(Integer companyId, Integer productVariantId);
    List<ProductSubscription> findByCompanyCompanyId(Integer companyId);
}
