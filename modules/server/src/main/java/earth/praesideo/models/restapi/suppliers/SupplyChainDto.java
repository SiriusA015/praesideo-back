package earth.praesideo.models.restapi.suppliers;

import earth.praesideo.models.restapi.BaseApiModel;
import lombok.Data;

import java.util.Date;

@Data
public class SupplyChainDto extends BaseApiModel {
    private Integer supplyChainId;
    private String supplierContactEmail;
    private CompanySupplierDto supplier;
    private InvitationStatusDto supplierInvitationStatus;
    private Date supplierInvitationDate;
    private double amount;
    private String currency;
}
