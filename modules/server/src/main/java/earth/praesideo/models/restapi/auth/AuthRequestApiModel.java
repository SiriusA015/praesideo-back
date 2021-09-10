package earth.praesideo.models.restapi.auth;

import lombok.Data;

@Data
public class AuthRequestApiModel {
    private String username;
    private String password;
}
