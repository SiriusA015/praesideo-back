package earth.praesideo.database.repositories.common;

import earth.praesideo.database.entities.common.PurchaseCreditCategoryTypeEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface PurchaseCreditCategoryTypeRepository extends JpaRepository<PurchaseCreditCategoryTypeEntity, Integer> {
}
