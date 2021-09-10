package earth.praesideo.database.repositories.datasets;

import earth.praesideo.database.entities.datasets.DataSetGhgInventoryMethodOperationalBoundaryEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface DataSetGhgInventoryMethodOperationalBoundaryRepository extends JpaRepository<DataSetGhgInventoryMethodOperationalBoundaryEntity, Integer> {
    Optional<DataSetGhgInventoryMethodOperationalBoundaryEntity> findByGhgInventoryMethodEntityIdAndOperationalBoundaryId
            (Integer param1, Integer param2);
}
