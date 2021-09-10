package earth.praesideo.exceptions;

public class ConcurrentChangeException extends Exception {
    
    public ConcurrentChangeException(String message) {
        super(message);
    }

    public ConcurrentChangeException(String message, Throwable cause) {
        super(message, cause);
    }
}
