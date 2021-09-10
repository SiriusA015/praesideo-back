package earth.praesideo.database.repositories.datasets;

import earth.praesideo.database.entities.datasets.DataSetClimateMechanismsInfluenceEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface DataSetClimateMechanismsInfluenceRepository extends JpaRepository<DataSetClimateMechanismsInfluenceEntity, Integer> {
    DataSetClimateMechanismsInfluenceEntity findFirstByCompanyCompanyId(Integer userId);
}
