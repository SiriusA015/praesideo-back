package earth.praesideo.models.restapi.impactm;

import earth.praesideo.models.restapi.BaseApiModel;
import earth.praesideo.models.restapi.general.RefListModel;
import lombok.Data;

import java.math.BigDecimal;
import java.util.List;

@Data
public class DataImpactmScope1ExtinguishersModel extends BaseApiModel {
    private Integer Id;
    private Integer dataEmissionId;
    private Integer applianceTypeId;
    private BigDecimal annualTopupQuantity;
    private Integer topupUnitId;
    private String identificationNumber;
    private Integer emissionFactorId;
    private BigDecimal emissionFactorByUser;
    private Integer calcConfigEmissionsTypeId;
    private Integer calcConfigEmissionsUnitFactorId;
    private BigDecimal calcAnnualTopupQuantityConverted;
    private BigDecimal calcTco2;
    private List<RefListModel> emissionFactorsList;
}
