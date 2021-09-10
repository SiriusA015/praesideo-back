package earth.praesideo.models.restapi.traceperformance;

import earth.praesideo.models.restapi.impactperformance.PerformancePillar;
import lombok.Getter;
import lombok.Setter;

import java.math.BigDecimal;
import java.math.RoundingMode;


/**
 * @author Koshman Vadim
 */
@Getter
@Setter
public class AvailableSupplierDto {
    private Integer companyId;

    private String supplierName;

    private BigDecimal temperatureAlignment;

    private String temperatureAlignmentValueType = PerformancePillar.OVERALL_SCORE.getValueType();

    private BigDecimal probability_1_5;

    private String probability_1_5ValueType = PerformancePillar.PROBABILITY_1_5.getValueType();

    private BigDecimal probability_2;

    private String probability_2ValueType = PerformancePillar.PROBABILITY_2_0.getValueType();

    private BigDecimal TCO2;

    private BigDecimal totalSupplyEmission;

    private String totalSupplyEmissionValueType = PerformancePillar.TOTAL_EMISSION.getValueType();

    public void setTemperatureAlignment(BigDecimal temperatureAlignment) {
        this.temperatureAlignment = temperatureAlignment.setScale(2, RoundingMode.DOWN);
    }

    public void setProbability_1_5(BigDecimal probability_1_5) {
        this.probability_1_5 = probability_1_5.setScale(2, RoundingMode.DOWN);
    }

    public void setProbability_2(BigDecimal probability_2) {
        this.probability_2 = probability_2.setScale(2, RoundingMode.DOWN);
    }

    public void setTCO2(BigDecimal TCO2) {
        this.TCO2 = TCO2.setScale(2, RoundingMode.DOWN);
    }
}
