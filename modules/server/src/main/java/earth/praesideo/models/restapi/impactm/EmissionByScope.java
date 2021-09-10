package earth.praesideo.models.restapi.impactm;

import lombok.Data;

import java.math.BigDecimal;

@Data
public class EmissionByScope {
    private BigDecimal scope1tCo2;
    private BigDecimal scope2tCo2;
    private BigDecimal scope3tCo2;
    private BigDecimal total;
    private BigDecimal scope1Percentage;
    private BigDecimal scope2Percentage;
    private BigDecimal scope3Percentage;
}
