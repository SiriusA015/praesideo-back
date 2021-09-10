package earth.praesideo.database.repositories.datasets;

import earth.praesideo.database.entities.datasets.DataSetEmissionsReductionShortTermEntity;
import earth.praesideo.database.entities.datasets.DataSetEmissionsReductionShortTermId;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface DataSetEmissionsReductionShortTermRepository extends JpaRepository<DataSetEmissionsReductionShortTermEntity, DataSetEmissionsReductionShortTermId> {

	void deleteAllByEmissionsReductionId(Integer emissionsReductionId);
}
