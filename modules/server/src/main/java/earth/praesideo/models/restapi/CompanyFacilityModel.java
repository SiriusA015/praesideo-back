package earth.praesideo.models.restapi;

import lombok.Data;

@Data
public class CompanyFacilityModel {
    private Integer facilityId;
    private Integer companyId;
    private String facilityName;
    private String facilityCity;
    private Integer facilityStateId;
    private Integer facilityCountryId;
    private String facilityAddress;
    private Integer facilityOwnerCompanyId;
    private Integer facilityOperationCompanyId;
}
