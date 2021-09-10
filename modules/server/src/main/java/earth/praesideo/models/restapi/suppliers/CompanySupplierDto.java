package earth.praesideo.models.restapi.suppliers;

import earth.praesideo.models.restapi.BaseApiModel;
import lombok.Data;

@Data
public class CompanySupplierDto extends BaseApiModel {
    private Integer companyId;
    private String  companyName;
    private String  companyDescription;
    private String  city;
    private String  country;
    private String  status;
    private Boolean homeStockExchangeListed;
    private Integer homeStockExchangeId;
    private Integer industrySectorId;
    private Integer industrySubsectorId;
}
