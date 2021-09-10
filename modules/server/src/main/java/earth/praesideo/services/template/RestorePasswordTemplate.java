package earth.praesideo.services.template;

/**
 * @author Koshman Vadim
 */
public class RestorePasswordTemplate extends AbstractEmailTemplate{

    public RestorePasswordTemplate(String htmlForm) {
        super(htmlForm);
    }

    public void setRestorePasswordHyperlink(String url) {
        context.setVariable("resetLink", url);
    }
}
