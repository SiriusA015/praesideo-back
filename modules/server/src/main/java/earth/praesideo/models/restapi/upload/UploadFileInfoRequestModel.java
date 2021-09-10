package earth.praesideo.models.restapi.upload;

import lombok.Data;
import lombok.experimental.Accessors;

@Data
@Accessors(chain = true)
public class UploadFileInfoRequestModel {
    private Integer fileType;
    private String filename;
}
