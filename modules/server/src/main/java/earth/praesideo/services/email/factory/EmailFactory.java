package earth.praesideo.services.email.factory;

import earth.praesideo.services.template.EmailTemplate;
import earth.praesideo.services.template.RestorePasswordTemplate;
import earth.praesideo.services.template.SupplierInvitationTemplate;
import org.springframework.stereotype.Component;

/**
 * @author Koshman Vadim
 */
@Component
public class EmailFactory {
    private static final String HTML_VERIFY_EMAIL_PAGE = "email/verify-email";
    private static final String HTML_PAGE_RESTORE_PWD = "email/reset-password";
    private static final String HTML_PAGE_SUPPLIER_INVITATION = "supplier/supplier-invitation";

    public EmailTemplate getAccountVerifiedTemplate() {
        return new EmailTemplate(HTML_VERIFY_EMAIL_PAGE);
    }

    public RestorePasswordTemplate getRestorePasswordTemplate(){
        return new RestorePasswordTemplate(HTML_PAGE_RESTORE_PWD);
    }

    public SupplierInvitationTemplate getInvitationSupplierTemplate(){
        return new SupplierInvitationTemplate(HTML_PAGE_SUPPLIER_INVITATION);
    }
}
