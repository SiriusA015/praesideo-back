package earth.praesideo.exceptions;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import org.springframework.http.HttpStatus;

/**
 * @author Koshman Vadim
 */

@Setter
@Getter
@AllArgsConstructor
public class EmailException extends RuntimeException {
    private String message;
    private HttpStatus httpStatus;
}
