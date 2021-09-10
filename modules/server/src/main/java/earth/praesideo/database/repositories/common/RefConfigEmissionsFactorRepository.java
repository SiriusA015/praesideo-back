package earth.praesideo.database.repositories.common;

import earth.praesideo.database.entities.common.RefConfigEmissionsFactorEntity;
import earth.praesideo.models.restapi.traceperformance.AvailableSuppliers;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface RefConfigEmissionsFactorRepository
        extends JpaRepository<RefConfigEmissionsFactorEntity, Integer> {
    Optional<RefConfigEmissionsFactorEntity> findById(Integer Id);

    List<RefConfigEmissionsFactorEntity> findByContinentId(Integer continentId);

}
