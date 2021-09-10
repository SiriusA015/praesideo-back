package earth.praesideo.models.restapi.general;

import earth.praesideo.models.restapi.BaseApiModel;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class DefaultSuccessApiModel extends BaseApiModel {
    private String message;

    public DefaultSuccessApiModel(String message) {
        this.message = message;
    }
}
