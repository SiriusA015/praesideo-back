package earth.praesideo.database.repositories.suppliers;

import earth.praesideo.database.entities.suppliers.SupplierInvitationStatus;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface SupplierInvitationStatusRepository extends JpaRepository<SupplierInvitationStatus, Integer> {
    SupplierInvitationStatus findByValue(String status);
}
