package earth.praesideo.models.restapi.auth;

import earth.praesideo.models.restapi.BaseApiModel;
import lombok.Data;

import java.util.List;

@Data
public class AuthResponseApiModel extends BaseApiModel {
    private String username;
    private Boolean accountConfirmed;
    private Boolean freePeriodExpired;
    private String authToken;
    private String refreshToken;
    private String tokenType;
    private Integer companyId;
    private List<String> roles;
    private String industrySector;
    private String industrySubsector;
}
