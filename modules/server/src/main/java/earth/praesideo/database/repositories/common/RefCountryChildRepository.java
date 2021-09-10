package earth.praesideo.database.repositories.common;

import earth.praesideo.database.entities.common.RefCountryChildEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface RefCountryChildRepository extends JpaRepository<RefCountryChildEntity, Integer> {
    Optional<RefCountryChildEntity> findByChildCountryId(Integer childCountryId);
}
