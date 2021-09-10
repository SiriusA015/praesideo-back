package earth.praesideo.models.restapi.suppliers;

import earth.praesideo.models.restapi.BaseApiModel;
import lombok.Data;

import java.util.List;

@Data
public class SupplierInvitationDto extends BaseApiModel {
    private List<Integer> suppliersCompanyIds;
    private String senderEmail;
    private String subject;
    private String message;
}
