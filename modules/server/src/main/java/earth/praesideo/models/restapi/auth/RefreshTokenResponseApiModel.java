package earth.praesideo.models.restapi.auth;

import earth.praesideo.models.restapi.BaseApiModel;
import lombok.Data;

@Data
public class RefreshTokenResponseApiModel extends BaseApiModel {
    private String authToken;
    private String refreshToken;
    private String tokenType;
}
