package earth.praesideo.models.restapi;

import earth.praesideo.models.restapi.general.RefCountryModel;
import earth.praesideo.models.restapi.general.RefCountryStateModel;
import lombok.Data;

import java.util.List;

@Data
public class CompanyGeneralBackgroundModel extends BaseApiModel {
    private Integer companyId;
    private String companyName;
    private String companyDescription;
    private String city;
    private Integer countryId;
    private Integer stateId;
    private Boolean homeStockExchangeListed;
    private Integer homeStockExchangeId;
    private Integer industrySectorId;
    private Integer industrySubsectorId;
    private Boolean isParentcompany;
    private Boolean isSubsidiary;
    private Boolean isJointventure;
    private Boolean isStandalone;
    private Integer yearRepresentationId;
    private Integer startMonth;
    private Boolean isFinancialYear;
    private Integer productVariantId;

    private List<CompanySecondaryIndustryModel> companySecondaryIndustrylist;
    private List<CompanyStructureModel> companyStructureList;
    private List<CompanyFacilityModel> companyFacilityList;
    private List<CompanyProductServicesModel> companyProductServicesList;
}