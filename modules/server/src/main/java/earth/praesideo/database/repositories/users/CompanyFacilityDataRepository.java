package earth.praesideo.database.repositories.users;

import earth.praesideo.database.entities.users.CompanyFacilityDataEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface CompanyFacilityDataRepository extends JpaRepository<CompanyFacilityDataEntity, Integer> {
    List<CompanyFacilityDataEntity> findCompanyFacilityDataEntitiesByCompProdServId(Integer compProdServId);
}
