package earth.praesideo.models.restapi.general;

import earth.praesideo.models.restapi.BaseApiModel;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class RefContinentModel extends BaseApiModel {
    private Integer Id;
    private String continent;
}
