package earth.praesideo.models.restapi.impactm;

import lombok.Data;

import java.math.BigDecimal;

@Data
public class EmissionCalculationScope {
    private Boolean isMeasurement;
    private BigDecimal scope3BusinessTravel;
    private BigDecimal scope3EmployeeCommute;
    private BigDecimal scope3Total;
}
