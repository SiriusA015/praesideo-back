package earth.praesideo.database.repositories.suppliers;

import earth.praesideo.database.entities.suppliers.SupplierAllocation;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface SupplierAllocationRepository extends JpaRepository<SupplierAllocation, Integer> {

    List<SupplierAllocation> findAllBySupplyChainSupplyChainIdAndDateRemovedIsNull(Integer supplyChainId);
}
