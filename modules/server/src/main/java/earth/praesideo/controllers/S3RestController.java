package earth.praesideo.controllers;

import earth.praesideo.models.restapi.BaseApiModel;
import earth.praesideo.models.restapi.general.DefaultErrorApiModel;
import earth.praesideo.models.restapi.upload.UploadFileInfoRequestModel;
import earth.praesideo.models.restapi.upload.UploadFileInfoResponseModel;
import earth.praesideo.models.restapi.upload.UploadFileListResponseModel;
import earth.praesideo.models.security.CustomUserDetailsModel;
import earth.praesideo.services.S3AwsService;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiResponse;
import io.swagger.annotations.ApiResponses;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.Optional;

@RestController
@RequestMapping("/api/private")
public class S3RestController extends BaseController {
    private static final Logger LOGGER = LoggerFactory.getLogger(S3RestController.class);

    private final S3AwsService s3AwsService;

    @Autowired
    public S3RestController(S3AwsService s3AwsService) {
        LOGGER.info(this.getClass().getSimpleName() + " created.");
        this.s3AwsService = s3AwsService;
    }

    @ApiOperation(value = "Upload a file to S3")
    @ApiResponses(
            value = {
                    @ApiResponse(code = 200, response = UploadFileInfoResponseModel.class, message = ""),
                    @ApiResponse(code = 400, message = "User not found")
            }
    )
    @RequestMapping(value = "/support-documents/upload",
            method = RequestMethod.POST,
            produces = MediaType.APPLICATION_JSON_VALUE,
            consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public ResponseEntity<BaseApiModel> uploadFile(
            @RequestPart(value = "info") UploadFileInfoRequestModel info,
            @RequestPart(value = "file") final MultipartFile multipartFile) {
        try {
            Optional<CustomUserDetailsModel> user = getLoggedInUser();
            if (user.isPresent()) {
                return ResponseEntity.ok(s3AwsService.uploadFile(multipartFile, user.get(), info));
            }
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(new DefaultErrorApiModel("User not found"));
        } catch (Exception ex) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(new DefaultErrorApiModel(ex.getMessage()));
        }
    }

    @PostMapping("/support-documents/remove")
    public ResponseEntity<BaseApiModel> removeFile(@RequestBody UploadFileInfoRequestModel info) {
        try {
            Optional<CustomUserDetailsModel> user = getLoggedInUser();
            return user.map(customUserDetailsModel -> ResponseEntity.ok(s3AwsService.removeFile(customUserDetailsModel, info)))
                    .orElseGet(() -> ResponseEntity.status(HttpStatus.BAD_REQUEST).body(new DefaultErrorApiModel("User not found")));
        } catch (Exception ex) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(new DefaultErrorApiModel(ex.getMessage()));
        }
    }

    @GetMapping("/support-documents/list")
    public ResponseEntity<UploadFileListResponseModel> getFiles() {
        try {
            Optional<CustomUserDetailsModel> user = getLoggedInUser();
            return user.map(customUserDetailsModel -> ResponseEntity.ok(s3AwsService.getFiles(customUserDetailsModel)))
                    .orElseGet(() -> ResponseEntity.status(HttpStatus.BAD_REQUEST).body(null));
        } catch (Exception ex) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(null);
        }
    }
}
