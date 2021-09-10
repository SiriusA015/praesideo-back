package earth.praesideo.database.repositories.common;

import earth.praesideo.database.entities.common.AuditingValidationEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface AuditingValidationRepository extends JpaRepository<AuditingValidationEntity, Integer> {

}
