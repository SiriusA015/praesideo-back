package earth.praesideo.models.restapi.auth;

import lombok.Data;

@Data
public class RefreshTokenRequestApiModel {
    private String refreshToken;
}
