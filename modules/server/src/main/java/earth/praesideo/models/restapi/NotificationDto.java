package earth.praesideo.models.restapi;

import lombok.*;

/**
 * @author Koshman Vadim
 */

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class NotificationDto {

    private String text;
    private String username;

    @AllArgsConstructor
    public enum Message {
        RESET_PWD_EMAIL_MSG("Please, check your email and follow the link to reset your password."),
        SUCCESS_RESET_PWD_MSG("Your password has been successfully reset.");
        @Getter
        String value;
    }
}
