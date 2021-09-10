package earth.praesideo.models.restapi.general;

import earth.praesideo.models.restapi.BaseApiModel;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Data
public class RefConfigEmissionsTypeModel extends BaseApiModel {
    private Integer Id;
    private Integer etypeId;
    private Integer etypeattrId1;
    private Integer etypeattrId2;
    private Integer etypeattrId3;
    private Integer etypeattrId4;
    private Integer etypeUnitId1;
    private Integer etypeUnitId2;
    private List<RefConfigEmissionsUnitFactorModel> refConfigEmissionsUnitFactor;
}
