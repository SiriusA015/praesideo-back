package earth.praesideo.models.restapi.impactm;

import earth.praesideo.models.restapi.BaseApiModel;
import earth.praesideo.models.restapi.general.RefListModel;
import lombok.Data;

import java.math.BigDecimal;
import java.util.List;

@Data
public class DataImpactmScope1DistanceModel extends BaseApiModel {
    private Integer Id;
    private Integer dataEmissionId;
    private Integer vehicleCategoryId;
    private Integer vehicleTypeId;
    private BigDecimal distanceAmountRaw;
    private Integer distanceUnitId;
    private Integer emissionFactorId;
    private BigDecimal emissionFactorByUser;
    private Integer calcConfigEmissionsTypeId;
    private Integer calcConfigEmissionsUnitFactorId;
    private BigDecimal calcDistanceAmountConverted;
    private BigDecimal calcTco2;

    private List<RefListModel> emissionFactorsList;
}
