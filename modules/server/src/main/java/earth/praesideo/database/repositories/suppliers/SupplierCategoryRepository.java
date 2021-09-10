package earth.praesideo.database.repositories.suppliers;

import earth.praesideo.database.entities.suppliers.SupplierCategory;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface SupplierCategoryRepository extends JpaRepository<SupplierCategory, Integer> {

}
