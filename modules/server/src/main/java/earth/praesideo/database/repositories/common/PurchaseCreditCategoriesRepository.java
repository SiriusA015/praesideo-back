package earth.praesideo.database.repositories.common;

import earth.praesideo.database.entities.common.PurchaseCreditCategoriesEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface PurchaseCreditCategoriesRepository extends JpaRepository<PurchaseCreditCategoriesEntity, Integer> {
}
