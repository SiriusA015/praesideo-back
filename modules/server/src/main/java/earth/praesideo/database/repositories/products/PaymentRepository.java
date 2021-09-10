package earth.praesideo.database.repositories.products;

import earth.praesideo.database.entities.products.Payment;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface PaymentRepository extends JpaRepository<Payment, Integer> {

    boolean existsByInvoiceId(Integer invoiceId);
}
