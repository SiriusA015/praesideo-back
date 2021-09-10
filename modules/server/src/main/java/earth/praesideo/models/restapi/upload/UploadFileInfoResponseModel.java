package earth.praesideo.models.restapi.upload;

import earth.praesideo.models.restapi.BaseApiModel;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UploadFileInfoResponseModel extends BaseApiModel {
    private String filename;
    private String url;
    private Integer fileType;
}
