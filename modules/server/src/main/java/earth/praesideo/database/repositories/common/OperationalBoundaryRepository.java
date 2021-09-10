package earth.praesideo.database.repositories.common;

import earth.praesideo.database.entities.common.OperationalBoundaryEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface OperationalBoundaryRepository extends JpaRepository<OperationalBoundaryEntity, Integer> {
    List<OperationalBoundaryEntity> findByOperationalBoundaryScope_OperationalBoundaryScopeId(Integer operationalBoundaryScopeId);
    OperationalBoundaryEntity findByName(String name);
}
