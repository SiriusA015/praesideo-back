package earth.praesideo.database.repositories.datasets;

import earth.praesideo.database.entities.datasets.DataSetRecentYearEmissionsEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface DataSetRecentYearEmissionsRepository extends JpaRepository<DataSetRecentYearEmissionsEntity, Integer> {
    Optional<DataSetRecentYearEmissionsEntity>  findFirstByCompanyCompanyIdAndYearRepresentationYearRepresentationId(Integer companyId, Integer yearRepresentationId);

}
