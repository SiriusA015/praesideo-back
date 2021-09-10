package earth.praesideo.exceptions;

import lombok.Data;
import lombok.EqualsAndHashCode;
import org.springframework.data.util.Pair;
import org.springframework.validation.BindingResult;

import java.util.Map;

/**
 * @author Koshman Vadim
 */

@EqualsAndHashCode(callSuper = true)
@Data
public class BindingProcessErrorException extends BindingHasErrorsException {
    private Map<String, Pair<String, String>> fieldErrors;
    private Map<String, String> objectErrors;

    public BindingProcessErrorException(BindingResult bindingResult, String message, String viewName,
                                        Map<String, Pair<String, String>> fieldErrors, Map<String, String> objectErrors) {
        super(bindingResult, message, viewName);
        this.fieldErrors = fieldErrors;
        this.objectErrors = objectErrors;
    }
}
