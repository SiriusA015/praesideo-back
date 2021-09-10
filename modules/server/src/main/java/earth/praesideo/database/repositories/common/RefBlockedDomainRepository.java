package earth.praesideo.database.repositories.common;

import earth.praesideo.database.entities.common.RefBlockedDomainEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface RefBlockedDomainRepository extends JpaRepository<RefBlockedDomainEntity, Integer> {
    Optional<RefBlockedDomainEntity> findByDomainIgnoreCase(String domain);
}
