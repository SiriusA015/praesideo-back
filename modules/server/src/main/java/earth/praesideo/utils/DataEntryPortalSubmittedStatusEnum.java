package earth.praesideo.utils;

public enum DataEntryPortalSubmittedStatusEnum {
    NOT_SUBMITTED(1),
    SUBMITTED_REVIEW(2),
    NOT_ACCEPTED(3),
    ACCEPTED(4);

    private final Integer status;

    DataEntryPortalSubmittedStatusEnum(Integer status) {
        this.status = status;
    }

    public Integer getStatus() {
        return status;
    }
}
