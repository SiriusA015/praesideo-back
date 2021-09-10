package earth.praesideo.models.restapi.impactm;

import lombok.Data;

import java.math.BigDecimal;

@Data
public class EmissionBySource {
    private BigDecimal scope1StationaryFuel;
    private BigDecimal scope1MobileFuel;
    private BigDecimal scope1Refrigerators;
    private BigDecimal scope2PurchasedElectricity;
    private BigDecimal scope3;
}
