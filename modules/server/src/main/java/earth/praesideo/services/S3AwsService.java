package earth.praesideo.services;

import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3Client;
import com.amazonaws.services.s3.model.DeleteObjectRequest;
import com.amazonaws.services.s3.model.PutObjectRequest;
import earth.praesideo.database.entities.datasets.UserFilesEntity;
import earth.praesideo.database.entities.users.UserEntity;
import earth.praesideo.exceptions.DataSetInReviewException;
import earth.praesideo.exceptions.FileAlreadyExistsException;
import earth.praesideo.models.restapi.BaseApiModel;
import earth.praesideo.models.restapi.upload.UploadFileInfoRequestModel;
import earth.praesideo.models.restapi.upload.UploadFileInfoResponseModel;
import earth.praesideo.models.restapi.upload.UploadFileListResponseModel;
import earth.praesideo.models.security.CustomUserDetailsModel;
import earth.praesideo.services.tech.AppLogService;
import earth.praesideo.utils.DateUtils;
import earth.praesideo.utils.StringUtils;

import java.util.Objects;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class S3AwsService {

    private static final Logger LOGGER = LoggerFactory.getLogger(S3AwsService.class);

    private final AmazonS3 amazonS3;
    private final UsersService usersService;
    private final CompanyService companyService;
    private final AppLogService appLogService;

    @Value("${amazon.aws.upload.files.bucket.name}")
    private String uploadBucketName;

    @Autowired
    public S3AwsService(AmazonS3 amazonS3, UsersService usersService, CompanyService companyService, AppLogService appLogService) {
        LOGGER.info(this.getClass().getSimpleName() + " created.");
        this.amazonS3 = amazonS3;
        this.usersService = usersService;
        this.companyService = companyService;
        this.appLogService = appLogService;
    }

    public UploadFileInfoResponseModel getFileInfo(final String filename) {
        UploadFileInfoResponseModel response = new UploadFileInfoResponseModel();
        String url = ((AmazonS3Client) amazonS3).getResourceUrl(uploadBucketName, filename);
        response.setFilename(filename);
        response.setUrl(url);
        return response;
    }

    public BaseApiModel uploadFile(final MultipartFile multipartFile, final UploadFileInfoRequestModel info) throws IOException, DataSetInReviewException {
        try {
            LOGGER.debug("Upload file to S3 bucket '{}'" + uploadBucketName);
            final File file = new File(System.getProperty("java.io.tmpdir") +
                    System.getProperty("file.separator") + Objects.requireNonNull(multipartFile.getOriginalFilename()));
            final FileOutputStream outputStream = new FileOutputStream(file);
            outputStream.write(multipartFile.getBytes());
            final PutObjectRequest putObjectRequest = new PutObjectRequest(uploadBucketName, info.getFilename(), file);
            amazonS3.putObject(putObjectRequest);
            UploadFileInfoResponseModel fileAwsInfo = getFileInfo(info.getFilename());
            // remove local file after upload
            file.delete();
            LOGGER.debug("Finish uploading file '{}' to S3 bucket '{}' with url {}", info.getFilename(), uploadBucketName, fileAwsInfo.getUrl());
            return fileAwsInfo;
        } catch (Exception e) {
            appLogService.addFailedFileUpload(e.getMessage(), "", multipartFile.getOriginalFilename());
            throw e;
        }
    }

    public BaseApiModel uploadFile(final MultipartFile multipartFile, CustomUserDetailsModel customUserDetailsModel, UploadFileInfoRequestModel info) throws FileAlreadyExistsException, IOException, DataSetInReviewException {
        LOGGER.debug("Upload file to S3 bucket '{}'" + uploadBucketName);
        companyService.verifyCompanyStatusOrApplyNew(customUserDetailsModel, null);
        UserEntity userEntity = usersService.getUserFromDatabase(customUserDetailsModel.getUserId());

        try {
            String filename = StringUtils.getUUIDNoDashes()
                    + "-"
                    + customUserDetailsModel.getCompanyId()
                    + "-"
                    + userEntity.getUserId()
                    + "-"
                    + DateUtils.getExportFileDateFormatted(new Date())
                    + "_"
                    + multipartFile.getOriginalFilename();
            final File file = new File(System.getProperty("java.io.tmpdir") +
                    System.getProperty("file.separator") + Objects.requireNonNull(multipartFile.getOriginalFilename()));
            final FileOutputStream outputStream = new FileOutputStream(file);
            outputStream.write(multipartFile.getBytes());
            final PutObjectRequest putObjectRequest = new PutObjectRequest(uploadBucketName, filename, file);
            amazonS3.putObject(putObjectRequest);
            UploadFileInfoResponseModel fileAwsInfo = getFileInfo(filename);
            usersService.addSubmittedFile(userEntity, filename, fileAwsInfo.getUrl(), info);
            // remove local file after upload
            file.delete();
            LOGGER.debug("Finish uploading file '{}' to S3 bucket '{}' with url {}", filename, uploadBucketName, fileAwsInfo.getUrl());
            return fileAwsInfo;
        } catch (Exception e) {
            appLogService.addFailedFileUpload(e.getMessage(), userEntity.getEmail(), multipartFile.getOriginalFilename());
            throw e;
        }
    }

    public BaseApiModel removeFile(CustomUserDetailsModel customUserDetailsModel, UploadFileInfoRequestModel info) {
        LOGGER.debug("Delete file '{}' from S3 bucket '{}'", info.getFilename(), uploadBucketName);
        UploadFileInfoResponseModel response = new UploadFileInfoResponseModel();
        UserEntity userEntity = usersService.getUserFromDatabase(customUserDetailsModel.getUserId());

        final DeleteObjectRequest deleteObjectRequest = new DeleteObjectRequest(uploadBucketName, info.getFilename());
        amazonS3.deleteObject(deleteObjectRequest);

        usersService.removeSubmittedFile(userEntity, info);
        response.setFilename(info.getFilename());
        return response;
    }

    public UploadFileListResponseModel getFiles(CustomUserDetailsModel customUserDetailsModel) {
        UploadFileListResponseModel response = new UploadFileListResponseModel();
        UserEntity userEntity = usersService.getUserFromDatabase(customUserDetailsModel.getUserId());
        List<UserFilesEntity> files = usersService.getSubmittedFiles(userEntity);

        if (null != files && !files.isEmpty()) {
            response.setFiles(files.stream()
                    .map(f -> new UploadFileInfoResponseModel(f.getFilename(), f.getUrl(), f.getFileType()))
                    .collect(Collectors.toList()));
        }

        return response;
    }
}
