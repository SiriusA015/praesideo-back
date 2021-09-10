package earth.praesideo.database.repositories.users;

import earth.praesideo.database.entities.users.CompanyStructureEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CompanyStructureRepository extends JpaRepository<CompanyStructureEntity, Integer> {
    List<CompanyStructureEntity> findCompanyStructureEntitiesByCompanyId(Integer companyId);
}
