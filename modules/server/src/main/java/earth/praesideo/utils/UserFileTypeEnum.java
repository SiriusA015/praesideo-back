package earth.praesideo.utils;

public enum UserFileTypeEnum {
    SUSTAINABILITY_REPORT(1),
    GHG_INVENTORY_DISCLOSURE_REPORT(2),
    FINANCIAL_REPORT(3),
    TCFD_REPORT(4),
    CLIMATE_STRATEGY(5),
    OFFSET_STRATEGY(6),
    OTHER(100);
    private Integer userFileTypeId;

    UserFileTypeEnum(Integer userFileTypeId) {
        this.userFileTypeId = userFileTypeId;
    }

    public Integer getUserFileTypeId() {
        return userFileTypeId;
    }
}
