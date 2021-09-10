package earth.praesideo.database.repositories.products;

import earth.praesideo.database.entities.products.Discount;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;

@Repository
public interface DiscountRepository extends JpaRepository<Discount, Integer> {

    List<Discount> findAllByProductVariantId(Integer productVariantId);
    List<Discount> findAllByProductVariantIdAndDiscountEndDateIsNullOrDiscountEndDateIsAfter(Integer productVariantId, Date date);
}
