package earth.praesideo.database.repositories.common;

import earth.praesideo.database.entities.common.ProductSelectionEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ProductSelectionRepository extends JpaRepository<ProductSelectionEntity, Integer> {

}
