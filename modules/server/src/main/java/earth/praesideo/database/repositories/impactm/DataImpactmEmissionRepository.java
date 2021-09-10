package earth.praesideo.database.repositories.impactm;

import earth.praesideo.database.entities.impactm.DataImpactmEmissionEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;
@Repository
public interface DataImpactmEmissionRepository extends JpaRepository<DataImpactmEmissionEntity, Integer> {
    Optional<DataImpactmEmissionEntity> findByCompanyIdAndYearRepresentationId
            (Integer companyId,Integer yearRepresentationId);
}
