package earth.praesideo.utils;

import lombok.Getter;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

/**
 * @author Koshman Vadim
 */
@Component
@Getter
public class UrlGenerator {
    @Value("${email.create.account.confirmation.from.email}")
    private String hostEmail;
    @Value("${email.reply.to}")
    private String emailReplyTo;
    @Value("${email.create.account.confirmation.from.email}")
    private String emailCreateAccountConfirmationFromEmail;
    @Value("${email.confirmation.base.url}")
    private String baseUrl;
    @Value("${datatrans.base.url}")
    private String datatransBaseUrl;
    @Value("${email.invitation.mail.cc}")
    private String emailPraesideo;
}
