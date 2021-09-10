package earth.praesideo.models.restapi.datasets;

import earth.praesideo.database.entities.datasets.DataSetGhgInventoryMethodEntity;
import earth.praesideo.models.restapi.BaseApiModel;
import lombok.Data;

@Data
public class DataSetGhgInventoryMethodModel extends BaseApiModel {
    private DataSetGhgInventoryMethodEntity dataSetGhgInventoryMethod;
}
