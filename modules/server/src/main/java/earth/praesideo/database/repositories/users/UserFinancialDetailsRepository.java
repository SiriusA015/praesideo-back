package earth.praesideo.database.repositories.users;

import earth.praesideo.database.entities.users.UserFinancialDetailsEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UserFinancialDetailsRepository extends JpaRepository<UserFinancialDetailsEntity, Integer> {
    UserFinancialDetailsEntity findByCompany_CompanyId(Integer companyId);
}
