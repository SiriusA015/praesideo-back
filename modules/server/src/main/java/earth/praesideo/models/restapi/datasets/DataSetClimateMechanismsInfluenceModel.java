package earth.praesideo.models.restapi.datasets;

import earth.praesideo.database.entities.datasets.DataSetClimateMechanismsInfluenceEntity;
import earth.praesideo.models.restapi.BaseApiModel;
import lombok.Data;

@Data
public class DataSetClimateMechanismsInfluenceModel extends BaseApiModel {
    private DataSetClimateMechanismsInfluenceEntity climateMechanismsInfluence;
}
