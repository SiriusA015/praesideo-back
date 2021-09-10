package earth.praesideo.database.repositories.targetsscenario;

import earth.praesideo.database.entities.datasets.DataEmissionsReductionTargetsScenarioEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface DataEmissionsReductionTargetsScenarioRepository extends JpaRepository<DataEmissionsReductionTargetsScenarioEntity, Integer> {

    void deleteAllByEmissionsReductionEmissionsReductionId(Integer emissionsReductionId);
}
