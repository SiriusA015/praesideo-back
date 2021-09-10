package earth.praesideo.controllers.exception;

import earth.praesideo.database.entities.users.UserEntity;
import earth.praesideo.error.ApiError;
import earth.praesideo.exceptions.ApiException;
import earth.praesideo.exceptions.EmailException;
import earth.praesideo.exceptions.ExceptionContent;
import earth.praesideo.models.security.CustomUserDetailsModel;
import earth.praesideo.services.UsersService;
import earth.praesideo.services.tech.AppLogService;
import lombok.extern.slf4j.Slf4j;
import org.apache.tomcat.util.http.fileupload.impl.FileSizeLimitExceededException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

import java.time.LocalDateTime;
import java.util.UUID;

/**
 * @author Koshman Vadim
 */
@Slf4j
@ControllerAdvice
public class ExceptionHandlerRestController {

    private final UsersService usersService;
    private final AppLogService appLogService;

    @Autowired
    public ExceptionHandlerRestController(UsersService usersService, AppLogService appLogService) {
        this.usersService = usersService;
        this.appLogService = appLogService;
    }

    @ExceptionHandler(ApiException.class)
    public ResponseEntity<ApiError> handleApiException(ApiException e) {
        ApiError error = this.buildApiError(e.getHttpStatus(), e.getMessage());
        error.setType(e.getType());
        return new ResponseEntity<>(error, e.getHttpStatus());
    }

    @ExceptionHandler(EmailException.class)
    public ResponseEntity<ApiError> handleEmailException(EmailException ex) {
        return new ResponseEntity<>(this.buildApiError(HttpStatus.INTERNAL_SERVER_ERROR, ExceptionContent.MESSAGE_CANNOT_SENT.getText()), HttpStatus.INTERNAL_SERVER_ERROR);
    }

    @ExceptionHandler(FileSizeLimitExceededException.class)
    public ResponseEntity<ApiError> handleFileSizeLimitExceeded(FileSizeLimitExceededException e) {
        CustomUserDetailsModel userDetails = (CustomUserDetailsModel) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        UserEntity userEntity = usersService.getUserFromDatabase(userDetails.getUserId());

        appLogService.addFailedFileUpload(e.getMessage(), userEntity.getEmail(), e.getFileName());

        ApiError error = this.buildApiError(HttpStatus.BAD_REQUEST, e.getMessage());
        return new ResponseEntity<>(error, HttpStatus.BAD_REQUEST);
    }

    private ApiError buildApiError(HttpStatus httpStatus, String explanation) {
        ApiError apiError = ApiError.builder()
                .uuid(UUID.randomUUID().toString())
                .errorCode(httpStatus.value())
                .errorStatus(httpStatus.getReasonPhrase())
                .explanation(explanation)
                .timestamp(LocalDateTime.now())
                .build();
        log.error(apiError.toString());
        return apiError;
    }
}
