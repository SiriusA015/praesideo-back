package earth.praesideo.models.restapi.auth;

import earth.praesideo.models.restapi.BaseApiModel;
import lombok.Data;

import java.math.BigDecimal;

@Data
public class FinancialInfoApiModel extends BaseApiModel {
    private Integer userFinancialDetailId;
    private Boolean isFinancialYear;
    //base-one start month
    //if zero then it's reporting year
    //if different than zero is financial year and the value is the month number
    private Integer startMonth;
    private Integer baseCurrencyId;
    private Integer representationYearId;
    private BigDecimal revenue;
    private BigDecimal netProfit;
    private Integer companyId;
}
