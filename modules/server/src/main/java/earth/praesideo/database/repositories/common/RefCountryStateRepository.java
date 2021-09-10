package earth.praesideo.database.repositories.common;

import earth.praesideo.database.entities.common.RefCountryStateEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface RefCountryStateRepository extends JpaRepository<RefCountryStateEntity, Integer> {
    List<RefCountryStateEntity> findRefCountryStateEntityByCountryId(Integer countryId);
}
