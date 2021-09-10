package earth.praesideo.models.email;

import lombok.Data;

import java.util.ArrayList;
import java.util.List;

@Data
public class EmailModel {
    private String subject;
    private String body;
    private List<String> to;
    private List<String> cc;
    private List<String> bcc;
    private String from;
    private String replyTo;
    private Boolean hasIcsCalendar;
    private String googleCalendarLink;
    private Boolean isHtml;

    public EmailModel() {
        to = new ArrayList<>();
        cc = new ArrayList<>();
        bcc = new ArrayList<>();
        isHtml = true;
        hasIcsCalendar = false;
    }
}
