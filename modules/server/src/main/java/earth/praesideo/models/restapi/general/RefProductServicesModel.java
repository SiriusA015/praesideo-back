package earth.praesideo.models.restapi.general;

import earth.praesideo.models.restapi.BaseApiModel;
import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
public class RefProductServicesModel  extends BaseApiModel {
    private Integer id;
    private String prodServName;
}
