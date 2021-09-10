package earth.praesideo.exceptions;

import lombok.*;
import org.springframework.validation.BindingResult;

/**
 * @author Koshman Vadim
 */

@EqualsAndHashCode(callSuper = true)
@NoArgsConstructor
@Data
public class BindingHasErrorsException extends MvcException {

    private BindingResult bindingResult;

    public BindingHasErrorsException(BindingResult bindingResult, String message, String viewName) {
        super(message, viewName);
        this.bindingResult = bindingResult;
    }

    @AllArgsConstructor
    public enum Message {
        BINDING_ERR_MSG_TEXT("Binding errors occurred.");

        @Getter
        String text;
    }
}
