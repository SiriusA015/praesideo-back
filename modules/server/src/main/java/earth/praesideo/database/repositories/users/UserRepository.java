package earth.praesideo.database.repositories.users;

import earth.praesideo.database.entities.users.UserEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRepository extends JpaRepository<UserEntity, Integer> {

    UserEntity findByUsernameIgnoreCase(String username);

    UserEntity findByUserId(Integer userId);

    UserEntity findByEmailIgnoreCase(String email);

    UserEntity findByActivationString(String activationString);
}
