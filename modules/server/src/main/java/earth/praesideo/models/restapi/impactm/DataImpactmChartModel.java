package earth.praesideo.models.restapi.impactm;

import earth.praesideo.models.restapi.BaseApiModel;
import lombok.Data;

@Data
public class DataImpactmChartModel extends BaseApiModel {

    private EmissionChartBySourceModel emissionChartBySourceModel=new EmissionChartBySourceModel();
    private EmissionChartByScopeModel emissionChartByScopeModel=new EmissionChartByScopeModel();
    private EmissionChartByActivityModel emissionChartByActivityModel = new EmissionChartByActivityModel();

}
