package earth.praesideo.database.repositories.datasets;

import earth.praesideo.database.entities.datasets.DataSetClimateMechanismsInfluenceMetricEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface DataSetClimateMechanismsInfluenceMetricRepository extends JpaRepository<DataSetClimateMechanismsInfluenceMetricEntity, Integer> {

    void deleteByClimateMechanismInfluenceId(Integer ClimateMechanismInfluenceId);

}
