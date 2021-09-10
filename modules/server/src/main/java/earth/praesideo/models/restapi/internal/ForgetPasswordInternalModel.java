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
public class ForgetPasswordInternalModel extends ApplicationEvent {
    private String email;
    private String restoreLink;
    private String verificationKey;

    public ForgetPasswordInternalModel(Object source, String email, String restoreLink, String verificationKey) {
        super(source);
        this.email = email;
        this.restoreLink = restoreLink;
        this.verificationKey = verificationKey;
    }
}
