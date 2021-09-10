package earth.praesideo.models.restapi;

import lombok.Data;

import java.math.BigDecimal;

@Data
public class CompanyStructureModel {
    private Integer id;
    private Integer companyId;
    private Integer relCompanyId;
    private String relCompanyIdCompanyName;
    private String relCompanyName;
    private Integer relCompanyCategoryId;
    private BigDecimal economicInterestPercentage;
    private Boolean isOperatingPoliciesControl;
    private Boolean isFinancialAccounting;
}
