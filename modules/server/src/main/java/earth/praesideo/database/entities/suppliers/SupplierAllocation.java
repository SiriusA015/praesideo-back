package earth.praesideo.database.entities.suppliers;

import earth.praesideo.database.entities.common.BaseModifyListenedEntity;
import earth.praesideo.database.entities.common.BaseRemoveListenedEntity;
import lombok.Data;

import javax.persistence.*;

@Entity
@Table(name = "t_supplier_allocation", schema = "trace")
@Data
public class SupplierAllocation extends BaseRemoveListenedEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer supplierAllocationId;
    private Integer supplierCategoryId;
    private Integer supplierTypeId;
    private Double supplierAmount;
    private Integer supplierCurrencyId;

    @ManyToOne
    @JoinColumn(name = "supplyChainId", updatable = false)
    private SupplyChain supplyChain;
}
