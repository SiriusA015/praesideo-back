package earth.praesideo.database.repositories.datasets;

import earth.praesideo.database.entities.datasets.DataSetGhgInventoryMethodEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface DataSetGhgInventoryMethodRepository extends JpaRepository<DataSetGhgInventoryMethodEntity, Integer> {
    DataSetGhgInventoryMethodEntity findFirstByCompanyCompanyId(Integer companyId);
}
