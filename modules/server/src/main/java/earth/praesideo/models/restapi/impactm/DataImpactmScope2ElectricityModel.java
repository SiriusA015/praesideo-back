package earth.praesideo.models.restapi.impactm;

import earth.praesideo.models.restapi.BaseApiModel;
import earth.praesideo.models.restapi.general.RefListModel;
import lombok.Data;

import java.math.BigDecimal;
import java.util.List;

@Data
public class DataImpactmScope2ElectricityModel extends BaseApiModel {
    private Integer Id;
    private Integer dataEmissionId;
    private Integer facilityId;
    private BigDecimal totalElectricityAmountRaw;
    private Integer totalElectricityUnitId;
    private BigDecimal totalRenewableAmountRaw;
    private Integer totalRenewableUnitId;
    private Integer emissionFactorId;
    private BigDecimal emissionFactorByUser;
    private Integer calcConfigEmissionsTypeId;
    private Integer calcConfigEmissionsUnitFactorId;
    private BigDecimal calcTotalElectricityAmountConverted;
    private BigDecimal calcTco2;
    private List<RefListModel> emissionFactorsList;
}
