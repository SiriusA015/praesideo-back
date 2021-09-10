package earth.praesideo.database.repositories.common;

import earth.praesideo.database.entities.common.EmissionsInventoryMethodEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface EmissionsAccountingMethodRepository extends JpaRepository<EmissionsInventoryMethodEntity, Integer> {
}
