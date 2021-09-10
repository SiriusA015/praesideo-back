package earth.praesideo.models.restapi.general;

import earth.praesideo.models.restapi.BaseApiModel;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class DefaultErrorApiModel extends BaseApiModel {
    private String message;

    public DefaultErrorApiModel(String message) {
        this.message = message;
    }
}