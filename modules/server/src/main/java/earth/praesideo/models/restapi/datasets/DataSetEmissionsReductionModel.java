package earth.praesideo.models.restapi.datasets;

import earth.praesideo.database.entities.datasets.DataSetEmissionsReductionEntity;
import earth.praesideo.models.restapi.BaseApiModel;
import lombok.Data;

@Data
public class DataSetEmissionsReductionModel extends BaseApiModel {
    private DataSetEmissionsReductionEntity emissionsReduction;
}
