package earth.praesideo.models.restapi.auth;

import lombok.Data;

import java.util.List;
@Data
public class ContentAuthApiModel {
    public List<ContentAuthApiModelItem> authApiModelItemList;
}
