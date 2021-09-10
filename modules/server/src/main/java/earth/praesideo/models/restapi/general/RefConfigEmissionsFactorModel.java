package earth.praesideo.models.restapi.general;

import earth.praesideo.models.restapi.BaseApiModel;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;

import java.math.BigDecimal;
import java.util.Date;

@Data
public class RefConfigEmissionsFactorModel extends BaseApiModel {
    private Integer Id;
    private Integer continentId;
    private Integer regionId;
    private Integer countryId;
    private Integer stateId;
    private Integer industrySectorId;
    private Integer industrySubsectorId;
    private Integer configEtypeId;
    private BigDecimal emissionFactor;
    private Integer emissionSourceId;
    private Date startDate;
    private Date endDate;
}
