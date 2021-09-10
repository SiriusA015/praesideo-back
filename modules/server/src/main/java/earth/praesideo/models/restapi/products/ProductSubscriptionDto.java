package earth.praesideo.models.restapi.products;

import lombok.Data;

import java.util.Date;

@Data
public class ProductSubscriptionDto {

    private Integer id;

    private Integer companyId;

    private Integer productVariantId;

    private String productVariantName;

    private Date startDate;

    private Date endDate;
}
