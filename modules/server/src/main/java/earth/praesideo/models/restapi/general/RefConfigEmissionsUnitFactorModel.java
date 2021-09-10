package earth.praesideo.models.restapi.general;

import earth.praesideo.models.restapi.BaseApiModel;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;

import java.math.BigDecimal;

@Data
public class RefConfigEmissionsUnitFactorModel extends BaseApiModel {
    private Integer Id;
    private Integer configEmissionTypeId;
    private Integer etypeUnitId1;
    private Integer etypeUnitId2;
    private BigDecimal etypeUnitFactor1;
    private BigDecimal etypeUnitFactor2;
}
