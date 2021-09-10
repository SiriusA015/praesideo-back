package earth.praesideo.models.restapi.impactm;

import lombok.Data;

import java.math.BigDecimal;

@Data
public class EmissionByActivity {
    private BigDecimal stationaryFuel;
    private BigDecimal mobileFuel;
    private BigDecimal travel;
    private BigDecimal refrigerators;
    private BigDecimal purchasedElectricity;
}
