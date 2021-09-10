package earth.praesideo.models.restapi.impactm;

import lombok.Data;

import java.util.List;

@Data
public class EmissionChartBySourceModel {
    private List<EmissionChartItemModel> scope1;
    private List<EmissionChartItemModel> scope2;
    private List<EmissionChartItemModel> scope3;
}
