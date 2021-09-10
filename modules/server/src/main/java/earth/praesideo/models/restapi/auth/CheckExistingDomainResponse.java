package earth.praesideo.models.restapi.auth;

import earth.praesideo.models.restapi.BaseApiModel;
import lombok.Data;

@Data
public class CheckExistingDomainResponse extends BaseApiModel {
    private Integer companyId;
    private String companyName;
    private String companyDescription;
    private Integer productSelectionId;
    private String productSelectionName;
}
