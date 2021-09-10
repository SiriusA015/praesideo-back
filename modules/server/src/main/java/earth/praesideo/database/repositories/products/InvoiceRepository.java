package earth.praesideo.database.repositories.products;

import earth.praesideo.database.entities.products.Invoice;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface InvoiceRepository extends JpaRepository<Invoice, Integer> {

    Optional<Invoice> findFirstByProductSubscriptionId(Integer productSubscriptionId);
    List<Invoice> findAllByProductSubscriptionId(Integer productSubscriptionId);
}
