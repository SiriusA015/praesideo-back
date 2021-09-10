package earth.praesideo.database.repositories.datasets;

import earth.praesideo.database.entities.users.CompanyStatusEntity;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * @author Koshman Vadim
 */
public interface CompanyStatusRepository extends JpaRepository<CompanyStatusEntity, Integer> {
    CompanyStatusEntity findByStatusId(Integer statusId);
}
