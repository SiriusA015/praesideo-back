package earth.praesideo.database.repositories.impactm;

import earth.praesideo.database.entities.impactm.DataImpactmScope1FuelCombustionEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface DataImpactmScope1FuelCombustionRepository
        extends JpaRepository<DataImpactmScope1FuelCombustionEntity, Integer> {
    List<DataImpactmScope1FuelCombustionEntity> findByDataEmissionIdAndCalcEmissionTypeId(Integer dataEmissionId, Integer emissionTypeId );
}
