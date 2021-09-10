package earth.praesideo.database.entities.suppliers;

/**
 * @author Koshman Vadim
 */
public enum InvitationStatus {
    PENDING,
    INVITE_ME,
    INVITED;

    public int getValue() {
        return ordinal() + 1;
    }
}
