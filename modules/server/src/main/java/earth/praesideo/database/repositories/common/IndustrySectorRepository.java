package earth.praesideo.database.repositories.common;

import earth.praesideo.database.entities.common.IndustrySectorEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface IndustrySectorRepository extends JpaRepository<IndustrySectorEntity, Integer> {
}
