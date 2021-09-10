package earth.praesideo.database.repositories.common;

import earth.praesideo.database.entities.common.CarbonPriceCoverageTypeEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CarbonPriceCoverageTypeRepository extends JpaRepository<CarbonPriceCoverageTypeEntity, Integer> {
    List<CarbonPriceCoverageTypeEntity> findByCarbonPriceCoverage_CarbonPriceCoverageId(Integer carbonPriceCoverageId);
}
