package earth.praesideo.error;

import com.fasterxml.jackson.annotation.JsonFormat;
import earth.praesideo.exceptions.ExceptionContent;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

/**
 * @author Koshman Vadim
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ApiError {
    private String uuid;
    private int errorCode;
    private String errorStatus;
    private String explanation;
    private ExceptionContent type;
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "dd-MM-yyyy hh:mm:ss")
    private LocalDateTime timestamp;
}
