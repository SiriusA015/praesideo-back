package earth.praesideo.database.repositories.users;


import earth.praesideo.database.entities.users.UserPropertiesEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface UserPropertiesRepository extends JpaRepository<UserPropertiesEntity, Integer> {
    Optional<UserPropertiesEntity> findFirstByKey(String key);
}
