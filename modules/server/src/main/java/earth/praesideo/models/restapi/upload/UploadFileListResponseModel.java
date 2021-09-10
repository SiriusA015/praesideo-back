package earth.praesideo.models.restapi.upload;

import earth.praesideo.models.restapi.BaseApiModel;
import lombok.Data;

import java.util.List;

@Data
public class UploadFileListResponseModel extends BaseApiModel {
    private List<UploadFileInfoResponseModel> files;
}
