package earth.praesideo.models.restapi.impactm;

import lombok.Data;

import java.util.List;

@Data
public class EmissionChartByActivityModel {
    private List<EmissionChartItemModel> itemList;
}
