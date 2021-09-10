package earth.praesideo.database.repositories.users;

import earth.praesideo.database.entities.users.CompanyFacilityEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CompanyFacilityRepository extends JpaRepository<CompanyFacilityEntity, Integer> {
    List<CompanyFacilityEntity> findCompanyFacilityEntitiesByCompanyId(Integer companyId);
}
