package earth.praesideo.database.repositories.datasets;

import earth.praesideo.database.entities.datasets.DataSetRecentYearEmissionsCarbonCreditsCategoryEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface DataSetRecentYearEmissionsCarbonCreditsCategoryRepository extends JpaRepository<DataSetRecentYearEmissionsCarbonCreditsCategoryEntity, Integer> {

}
