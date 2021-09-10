package earth.praesideo.database.repositories.products;

import earth.praesideo.database.entities.products.ProductVariant;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ProductVariantRepository extends JpaRepository<ProductVariant, Integer> {
    List<ProductVariant> findAllByProductId(Integer productId);
}
