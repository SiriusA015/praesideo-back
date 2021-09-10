package earth.praesideo.models.restapi.impactm;

import lombok.Data;

import java.math.BigDecimal;
import java.util.List;

@Data
public class EmissionChartByScopeModel {
    private BigDecimal totalTco2;
    private List<EmissionChartItemModel> itemList;

}
