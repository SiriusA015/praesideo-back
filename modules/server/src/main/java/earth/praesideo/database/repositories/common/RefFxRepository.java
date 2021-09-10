package earth.praesideo.database.repositories.common;

import earth.praesideo.database.entities.common.RefFx;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface RefFxRepository extends JpaRepository<RefFx, Integer> {

}
