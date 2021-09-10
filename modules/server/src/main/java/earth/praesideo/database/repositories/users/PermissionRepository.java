package earth.praesideo.database.repositories.users;

import earth.praesideo.database.entities.users.PermissionEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.Optional;

/**
 * @author Koshman Vadim
 */
@Repository
public interface PermissionRepository extends JpaRepository<PermissionEntity, Integer> {
    boolean existsByCompanyId(Integer companyId);

    boolean existsByCompanyIdAndUsernameIgnoreCase(Integer companyId, String userName);

    Optional<PermissionEntity> findByUsernameIgnoreCase(String userName);

    @Transactional
    void deleteByUsernameIgnoreCase(String userName);

    @Transactional
    void deleteByCompanyId(Integer companyId);
}
