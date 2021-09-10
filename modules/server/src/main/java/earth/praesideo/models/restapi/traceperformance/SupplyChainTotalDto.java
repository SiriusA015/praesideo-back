package earth.praesideo.models.restapi.traceperformance;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import java.math.BigDecimal;

/**
 * @author Koshman Vadim
 */
@Getter
@Setter
@Builder
public class SupplyChainTotalDto {
    private BigDecimal TCO2Total;

    private String carbonRatingTotal;

    private BigDecimal temperatureAlignmentTotal;

    private String temperatureAlignmentValueType;

    private BigDecimal probability_1_5Total;

    private String probability_1_5ValueType;

    private BigDecimal probability_2Total;

    private String probability_2ValueType;

    private String totalSupplyChaneEmissionValueType;
}
