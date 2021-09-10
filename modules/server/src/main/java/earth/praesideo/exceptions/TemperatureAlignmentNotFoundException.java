package earth.praesideo.exceptions;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

@ResponseStatus(value = HttpStatus.NO_CONTENT)
public class TemperatureAlignmentNotFoundException extends Exception {

    public TemperatureAlignmentNotFoundException() {
        super("Impact Data is currently reviewing by Praesideo Team");
    }

    public TemperatureAlignmentNotFoundException(final String message) {
        super(message);
    }

    public TemperatureAlignmentNotFoundException(final String message, final Throwable cause) {
        super(message, cause);
    }
}
