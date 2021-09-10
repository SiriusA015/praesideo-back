package earth.praesideo.database.repositories.users;
import earth.praesideo.database.entities.users.CompanySecondaryIndustryEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CompanySecondaryIndustryRepository extends JpaRepository<CompanySecondaryIndustryEntity, Integer> {
    List<CompanySecondaryIndustryEntity> findByCompanyCompanyId (Integer companyId);
}
