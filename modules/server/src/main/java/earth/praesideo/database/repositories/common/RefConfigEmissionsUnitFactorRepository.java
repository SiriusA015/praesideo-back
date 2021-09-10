package earth.praesideo.database.repositories.common;

import earth.praesideo.database.entities.common.RefConfigEmissionsUnitFactorEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface RefConfigEmissionsUnitFactorRepository
        extends JpaRepository<RefConfigEmissionsUnitFactorEntity, Integer> {
    RefConfigEmissionsUnitFactorEntity findByConfigEmissionTypeIdAndEtypeUnitId1
            (Integer configEmissionTypeId, Integer etypeUnit1Id);
}
