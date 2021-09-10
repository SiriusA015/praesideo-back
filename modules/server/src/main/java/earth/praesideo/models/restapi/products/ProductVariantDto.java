package earth.praesideo.models.restapi.products;

import earth.praesideo.database.entities.common.BaseCurrencyEntity;
import lombok.Data;

@Data
public class ProductVariantDto {

    private Integer id;

    private String name;

    private String description;

    private Double productSubscriptionAnnualCost;

    private Double productSubscriptionTierCostPerSupplier;

    private BaseCurrencyEntity productSubscriptionCurrency;
}
