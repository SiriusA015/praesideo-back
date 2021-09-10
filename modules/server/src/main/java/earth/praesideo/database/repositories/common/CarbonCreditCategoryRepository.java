package earth.praesideo.database.repositories.common;

import earth.praesideo.database.entities.common.CarbonCreditCategoryEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CarbonCreditCategoryRepository extends JpaRepository<CarbonCreditCategoryEntity, Integer> {

}
