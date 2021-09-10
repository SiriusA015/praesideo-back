package earth.praesideo.database.repositories.datasets;

import earth.praesideo.database.entities.datasets.DataSetEmissionsReductionTargetsEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface DataSetEmissionsReductionTargetsRepository extends JpaRepository<DataSetEmissionsReductionTargetsEntity, Integer> {

    void deleteAllByEmissionsReductionId(Integer emissionsReductionId);
}
