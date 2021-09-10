package earth.praesideo.exceptions;

public class DataSetNotFoundException extends RuntimeException {

    public DataSetNotFoundException(String message) {
        super(message);
    }

    public DataSetNotFoundException(String message, Throwable cause) {
        super(message, cause);
    }
}
