package earth.praesideo.models.restapi.suppliers;

import lombok.Data;

@Data
public class AddSupplyChainDto {
    private Integer supplierId;
    private String  companyName;
    private String  supplierContactEmail;
    private Boolean isFinancialYear;
    private Integer startMonth;
    private Integer yearRepresentationId;
}
