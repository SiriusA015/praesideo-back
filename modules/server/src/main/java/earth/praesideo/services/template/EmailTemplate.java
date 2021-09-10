package earth.praesideo.services.template;

import lombok.Getter;

/**
 * @author Koshman Vadim
 */
@Getter
public class EmailTemplate extends AbstractEmailTemplate{

    public EmailTemplate(String htmlForm) {
        super(htmlForm);
    }

    public void setLink(String link) {
        context.setVariable("link", link);
    }
}
