package earth.praesideo.database.repositories.impactm;

import earth.praesideo.database.entities.impactm.DataImpactmScope1DistanceEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface DataImpactmScope1DistanceRepository
        extends JpaRepository<DataImpactmScope1DistanceEntity, Integer> {
}
