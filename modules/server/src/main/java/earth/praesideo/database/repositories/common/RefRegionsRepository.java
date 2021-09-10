package earth.praesideo.database.repositories.common;

import earth.praesideo.database.entities.common.RefRegionEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface RefRegionsRepository extends JpaRepository<RefRegionEntity, Integer> {
}
