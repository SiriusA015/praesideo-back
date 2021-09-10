package earth.praesideo.database.repositories.users;

import earth.praesideo.database.entities.users.CompanyProductServicesEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface CompanyProductServicesRepository extends JpaRepository<CompanyProductServicesEntity, Integer> {
    List<CompanyProductServicesEntity> findCompanyProductServicesEntityByCompanyId(Integer companyId);
}
