package earth.praesideo.models.restapi.datasets;

import earth.praesideo.database.entities.datasets.DataSetRecentYearEmissionsEntity;
import earth.praesideo.models.restapi.BaseApiModel;
import lombok.Data;

@Data
public class DataSetRecentYearEmissionsModel extends BaseApiModel {
    private DataSetRecentYearEmissionsEntity recentYearEmissions;
}
