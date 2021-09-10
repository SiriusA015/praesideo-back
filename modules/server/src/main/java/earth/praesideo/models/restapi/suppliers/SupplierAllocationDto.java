package earth.praesideo.models.restapi.suppliers;

import earth.praesideo.models.restapi.BaseApiModel;
import lombok.Data;

@Data
public class SupplierAllocationDto extends BaseApiModel {
    private Integer supplierAllocationId;
    private Integer supplierCategoryId;
    private Integer supplierTypeId;
    private Double  supplierAmount;
    private Integer supplierCurrencyId;
}
