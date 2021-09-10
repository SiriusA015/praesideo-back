package earth.praesideo.database.repositories.datasets;

import earth.praesideo.database.entities.datasets.DataSetEmissionsReductionEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface DataSetEmissionsReductionRepository extends JpaRepository<DataSetEmissionsReductionEntity, Integer> {
    DataSetEmissionsReductionEntity findFirstByCompanyCompanyId(Integer companyId);
}
