package earth.praesideo.database.repositories.datasets;

import earth.praesideo.database.entities.datasets.DataSetRecentYearEmissionsCarbonCreditsCategoryTypeEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface DataSetRecentYearEmissionsCarbonCreditsCategoryTypeRepository extends JpaRepository<DataSetRecentYearEmissionsCarbonCreditsCategoryTypeEntity, Integer> {

}
