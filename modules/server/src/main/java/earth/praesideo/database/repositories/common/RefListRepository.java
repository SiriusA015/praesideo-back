package earth.praesideo.database.repositories.common;

import earth.praesideo.database.entities.common.RefListEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;
@Repository
public interface RefListRepository extends JpaRepository<RefListEntity, Integer> {
    List<RefListEntity> findByListKeyIgnoreCase(String listKey);
    List<RefListEntity> findByListValueIgnoreCase(String listValue);
    Optional<RefListEntity> findByListKeyAndListValueIgnoreCase (String listKey, String listValue);
}
