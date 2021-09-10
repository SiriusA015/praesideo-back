package earth.praesideo.database.repositories.common;

import earth.praesideo.database.entities.common.OperationalBoundaryScopeEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface OperationalBoundaryScopeRepository extends JpaRepository<OperationalBoundaryScopeEntity, Integer> {
}
