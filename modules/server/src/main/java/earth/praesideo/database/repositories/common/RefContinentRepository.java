package earth.praesideo.database.repositories.common;

import earth.praesideo.database.entities.common.RefContinentEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface RefContinentRepository extends JpaRepository<RefContinentEntity, Integer> {
}
