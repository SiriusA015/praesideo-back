package earth.praesideo.database.repositories.common;

import org.springframework.data.jpa.repository.JpaRepository;
import earth.praesideo.database.entities.common.RefProductServicesEntity;
import org.springframework.stereotype.Repository;

import java.util.Optional;
@Repository
public interface RefProductServicesRepository extends JpaRepository<RefProductServicesEntity, Integer> {
    Optional<RefProductServicesEntity> findRefProductServicesEntityByProdServNameIgnoreCase (String prodServName);
}
