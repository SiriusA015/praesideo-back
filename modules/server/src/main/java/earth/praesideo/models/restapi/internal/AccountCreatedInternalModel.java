package earth.praesideo.models.restapi.internal;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.context.ApplicationEvent;

@Getter
@Setter
@ToString
public class AccountCreatedInternalModel extends ApplicationEvent {
    private String email;
    private String activationString;

    public AccountCreatedInternalModel(Object source, String email, String activationString) {
        super(source);
        this.email = email;
        this.activationString = activationString;
    }
}
