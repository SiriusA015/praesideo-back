package earth.praesideo.models.restapi.impactm;

import earth.praesideo.database.entities.common.RefConfigEmissionsFactorEntity;
import earth.praesideo.models.restapi.BaseApiModel;
import earth.praesideo.models.restapi.general.RefConfigEmissionsFactorModel;
import earth.praesideo.models.restapi.general.RefListModel;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;

import java.math.BigDecimal;
import java.util.List;

@Data
public class DataImpactmScope1FuelCombustionModel extends BaseApiModel {
    private Integer Id;
    private Integer dataEmissionId;
    private Integer fuelTypeId;
    private BigDecimal fuelAmountRaw;
    private Integer fuelUnitId;
    private Integer emissionFactorId;
    private BigDecimal emissionFactorByUser;
    private Integer calcEmissionTypeId;
    private BigDecimal calcFuelAmountConverted;
    private Integer calcConfigEmissionsTypeId;
    private BigDecimal calcTco2;
    private List<RefListModel> emissionFactorsList;
}
