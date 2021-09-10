package earth.praesideo.models.restapi.general;

import earth.praesideo.models.restapi.BaseApiModel;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class AppDataTextApiModel extends BaseApiModel {
    private Integer id;
    private String textkey;
    private String textvalue;
    private String culture;
}
