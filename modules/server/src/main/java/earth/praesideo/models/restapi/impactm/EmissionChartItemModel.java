package earth.praesideo.models.restapi.impactm;

import lombok.Data;

import java.math.BigDecimal;

@Data
public class EmissionChartItemModel {
    private String itemText;
    private BigDecimal itemValue;
    private BigDecimal itemPercentage;
}
