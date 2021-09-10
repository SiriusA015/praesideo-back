package earth.praesideo.utils;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import org.springframework.stereotype.Component;

import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

/**
 * @author Koshman Vadim
 */
@Component
@Getter
public class NotificationUtil {

    private final Map<MessageType, Map<Locale,Message>> message;

    public NotificationUtil() {
        this.message = new HashMap<>();

        Map<Locale, Message> temp = new HashMap<>();
        temp.put(Locale.ENGLISH, new Message("New account register", ""));
        message.put(MessageType.VERIFY_EMAIL, temp);

        temp = new HashMap<>();
        temp.put(Locale.ENGLISH,new Message("Restore password",""));
        message.put(MessageType.RESTORE_PASSWORD, temp);

        temp = new HashMap<>();
        temp.put(Locale.ENGLISH,new Message("Invitation",""));
        message.put(MessageType.SUPPLIER_INVITATION, temp);
    }

    public Map<Locale, Message> getByType(MessageType type){
        return message.get(type);
    }

    @NoArgsConstructor
    @AllArgsConstructor
    @Getter
    public static class Message{
        private String title;
        private String body;
    }
}
