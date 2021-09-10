package earth.praesideo.exceptions;

public class DataSetInReviewException extends RuntimeException {

	public DataSetInReviewException() {
		this("Data set is in review!");
	}

	public DataSetInReviewException(String message) {
		super(message);
	}

	public DataSetInReviewException(String message, Throwable cause) {
		super(message, cause);
	}

}
