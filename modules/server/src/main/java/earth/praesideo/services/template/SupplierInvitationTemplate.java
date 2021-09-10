package earth.praesideo.services.template;

/**
 * @author Koshman Vadim
 */
public class SupplierInvitationTemplate extends AbstractEmailTemplate {
    public SupplierInvitationTemplate(String htmlForm) {
        super(htmlForm);
    }

    public void setSupplierInvitationMessage(String message) {
        context.setVariable("invitationMessage", message);
    }
}
