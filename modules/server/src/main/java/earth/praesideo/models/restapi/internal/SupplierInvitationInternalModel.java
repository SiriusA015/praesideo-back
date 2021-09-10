package earth.praesideo.models.restapi.internal;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.context.ApplicationEvent;

/**
 * @author Koshman Vadim
 */

@Getter
@Setter
@ToString
public class SupplierInvitationInternalModel extends ApplicationEvent {
    private String[] email;
    private String[] cc;
    private String subject;
    private String message;

    public SupplierInvitationInternalModel(Object source, String[] email, String[] cc, String subject, String message) {
        super(source);
        this.email = email;
        this.cc = cc;
        this.subject = subject;
        this.message = message;
    }
}
