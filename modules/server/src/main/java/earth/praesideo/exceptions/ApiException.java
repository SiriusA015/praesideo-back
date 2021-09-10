package earth.praesideo.exceptions;

import lombok.Data;
import lombok.EqualsAndHashCode;
import org.springframework.http.HttpStatus;

/**
 * @author Koshman Vadim
 */

@EqualsAndHashCode(callSuper = true)
@Data
public class ApiException extends RuntimeException {


    private final HttpStatus httpStatus;
    private final String message;
    private final ExceptionContent type;

    public ApiException(final ExceptionContent type, final HttpStatus status) {
        super(type.getText());
        this.message = type.getText();
        this.httpStatus = status;
        this.type = type;
    }

    public ApiException(final ExceptionContent type, final HttpStatus status, final String message) {
        super(message);
        this.message = message;
        this.httpStatus = status;
        this.type = type;
    }
}
