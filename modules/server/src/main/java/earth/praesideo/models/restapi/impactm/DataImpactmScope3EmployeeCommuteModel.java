package earth.praesideo.models.restapi.impactm;

import earth.praesideo.models.restapi.BaseApiModel;
import earth.praesideo.models.restapi.general.RefListModel;
import lombok.Data;

import java.math.BigDecimal;
import java.util.List;

@Data
public class DataImpactmScope3EmployeeCommuteModel extends BaseApiModel {
    private Integer Id;
    private Integer dataEmissionId;
    private Integer facilityId;
    private String employeeId;
    private BigDecimal employeePercentage;
    private Integer transportationModeId;
    private BigDecimal distanceTravelledDaily;
    private BigDecimal distanceTravelledYearly;
    private Integer distanceUnitId;
    private Integer emissionFactorId;
    private BigDecimal emissionFactorByUser;
    private Integer calcConfigEmissionsTypeId;
    private Integer calcConfigEmissionsUnitFactorId;
    private BigDecimal calcTotalDistanceConverted;
    private BigDecimal calcTco2;
    private List<RefListModel> emissionFactorsList;
}
