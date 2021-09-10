package earth.praesideo.models.restapi;

import lombok.Data;

import java.math.BigDecimal;

@Data
public class CompanyFacilityDataModel extends BaseApiModel{
    private Integer id;
    private Integer compProdServId;
    private Integer facilityId;
    private BigDecimal quantity;
    private Integer quantityUnitId;
    private String quantityUnitText;
    private BigDecimal quantityInPercentage;
}
