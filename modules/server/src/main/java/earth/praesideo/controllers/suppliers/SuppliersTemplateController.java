package earth.praesideo.controllers.suppliers;

import earth.praesideo.models.restapi.BaseApiModel;
import earth.praesideo.models.restapi.general.DefaultErrorApiModel;
import earth.praesideo.models.restapi.upload.UploadFileInfoRequestModel;
import earth.praesideo.services.S3AwsService;
import io.swagger.annotations.ApiOperation;
import lombok.AllArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

@AllArgsConstructor
@RestController
@RequestMapping("/api/private")
public class SuppliersTemplateController {

    private static final String TEMPLATE_FiLE_NAME = "/trace/8_upload_suppliers.csv";

    private final S3AwsService s3AwsService;

    @ApiOperation(value = "Get Template csv from AWS S3")
    @GetMapping("/template")
    public ResponseEntity<BaseApiModel> getTemplateFileUrl() {
        try {
            return ResponseEntity.ok(s3AwsService.getFileInfo(TEMPLATE_FiLE_NAME));
        } catch (Exception ex) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(new DefaultErrorApiModel(ex.getMessage()));
        }
    }

    @ApiOperation(value = "Save Template csv to AWS S3")
    @PostMapping(value = "/template",
            produces = MediaType.APPLICATION_JSON_VALUE,
            consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public ResponseEntity<BaseApiModel> uploadTemplateFileUrl(
            @RequestPart(value = "file") final MultipartFile multipartFile) {
        try {
            return ResponseEntity.ok(s3AwsService.uploadFile(
                    multipartFile,
                    new UploadFileInfoRequestModel().setFilename(TEMPLATE_FiLE_NAME)
            ));
        } catch (Exception ex) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(new DefaultErrorApiModel(ex.getMessage()));
        }
    }
}
