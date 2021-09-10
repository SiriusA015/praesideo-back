package earth.praesideo.database.repositories.tech;

import earth.praesideo.database.entities.tech.AppLogEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface AppLogRepository extends JpaRepository<AppLogEntity, Integer> {
}
