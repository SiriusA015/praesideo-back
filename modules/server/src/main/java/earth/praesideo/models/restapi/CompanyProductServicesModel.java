package earth.praesideo.models.restapi;

import earth.praesideo.database.entities.common.RefProductServicesEntity;
import lombok.Data;

import java.math.BigDecimal;
import java.util.List;

@Data
public class CompanyProductServicesModel extends BaseApiModel{
    private Integer id;
    private Integer companyId;
    private Integer refProdServId;
    private String prodServName;
    private Boolean isQuantPerFacility;
    private BigDecimal totalQuantity;
    private Integer totalQuantityUnitId;
    private String totalQuantityUnitText;
    private List<CompanyFacilityDataModel> companyFacilityData;
}
