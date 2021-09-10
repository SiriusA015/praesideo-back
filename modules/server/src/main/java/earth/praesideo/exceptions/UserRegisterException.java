package earth.praesideo.exceptions;

public class UserRegisterException extends Exception {

    public UserRegisterException(String message) {
        super(message);
    }

    public UserRegisterException(String message, Throwable cause) {
        super(message, cause);
    }
}
