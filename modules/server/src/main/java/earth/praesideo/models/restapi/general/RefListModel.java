package earth.praesideo.models.restapi.general;

import earth.praesideo.models.restapi.BaseApiModel;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class RefListModel extends BaseApiModel {
    private Integer listId;
    private String listKey;
    private String listValue;
    private String listValue2;
}
