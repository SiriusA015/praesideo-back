package earth.praesideo.models.restapi.impactm;

import earth.praesideo.models.restapi.BaseApiModel;
import lombok.Data;

import java.util.ArrayList;

@Data
public class DataImpactmRefModel extends BaseApiModel {
    public Integer listId;
    public String listValue;
    public ArrayList<DataImpactmRefModel> childList;
}
