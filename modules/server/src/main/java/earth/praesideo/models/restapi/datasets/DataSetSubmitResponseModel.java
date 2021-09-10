package earth.praesideo.models.restapi.datasets;

import earth.praesideo.models.restapi.BaseApiModel;
import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class DataSetSubmitResponseModel extends BaseApiModel {
    private Boolean isSubmitted;
    private String submissionMessage;
}
