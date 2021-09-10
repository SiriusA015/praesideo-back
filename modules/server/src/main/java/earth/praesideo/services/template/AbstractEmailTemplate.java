package earth.praesideo.services.template;

import lombok.Getter;
import org.thymeleaf.context.Context;

/**
 * @author Koshman Vadim
 */
@Getter
public abstract class AbstractEmailTemplate {
    private final String htmlForm;

    protected final Context context = new Context();

    AbstractEmailTemplate(String htmlForm) {
        this.htmlForm = htmlForm;
    }
}
