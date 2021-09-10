package earth.praesideo.models.restapi;

import lombok.Data;

@Data
public class CompanySecondaryIndustryModel {
    private Integer id;
    private String city;
    private Integer countryId;
    private Integer industrySectorId;
    private Integer industrySubsectorId;
}
