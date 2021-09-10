package earth.praesideo.database.repositories.common;

import earth.praesideo.database.entities.common.RefVATEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface RefVATRepository extends JpaRepository<RefVATEntity, Integer> {
    Optional<RefVATEntity> findByCountryId(Integer countryId);
}
