package earth.praesideo.database.repositories.suppliers;

import earth.praesideo.database.entities.suppliers.SupplierType;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface SupplierTypeRepository extends JpaRepository<SupplierType, Integer> {

}
