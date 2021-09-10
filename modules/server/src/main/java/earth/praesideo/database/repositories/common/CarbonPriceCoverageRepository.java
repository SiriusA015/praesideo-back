package earth.praesideo.database.repositories.common;

import earth.praesideo.database.entities.common.CarbonPriceCoverageEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CarbonPriceCoverageRepository extends JpaRepository<CarbonPriceCoverageEntity, Integer> {

}
