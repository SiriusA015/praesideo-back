package earth.praesideo.exceptions;

import lombok.*;

/**
 * @author Koshman Vadim
 */

@EqualsAndHashCode(callSuper = true)
@Data
@NoArgsConstructor
@Builder
public class MvcException extends RuntimeException {

    private String message;
    private String viewName;

    public MvcException(String message, String viewName) {
        super(message);
        this.message = message;
        this.viewName = viewName;
    }

}
