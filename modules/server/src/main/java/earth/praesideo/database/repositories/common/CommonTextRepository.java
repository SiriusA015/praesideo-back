package earth.praesideo.database.repositories.common;

import earth.praesideo.database.entities.common.CommonTextEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface CommonTextRepository extends JpaRepository<CommonTextEntity, Integer> {
    Optional<CommonTextEntity> findById(Integer Id);

    List<CommonTextEntity> findByTextKey(String textKey);
    CommonTextEntity findFirstByTextKey(String textKey);
    CommonTextEntity findOneByTextKey(String textKey);

    List<CommonTextEntity> findAll();
}

