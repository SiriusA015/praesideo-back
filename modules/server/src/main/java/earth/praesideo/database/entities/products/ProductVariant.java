package earth.praesideo.database.entities.products;

import earth.praesideo.database.entities.common.BaseCurrencyEntity;
import earth.praesideo.database.entities.common.BaseModifyListenedEntity;
import lombok.Data;

import javax.persistence.*;
import java.math.BigDecimal;

@Entity
@Table(name = "t_product_variant", schema = "public")
@Data
public class ProductVariant extends BaseModifyListenedEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "product_variant_id")
    private Integer id;

    @ManyToOne
    @JoinColumn(name = "product_id")
    private Product product;

    @Column(name = "product_variant_name")
    private String name;

    @Column(name = "product_variant_description")
    private String description;

    @ManyToOne
    @JoinColumn(name = "product_subscription_currency_id", insertable = false, updatable = false)
    private BaseCurrencyEntity productSubscriptionCurrency;

    @Column(name = "product_subscription_annual_cost")
    private BigDecimal productSubscriptionAnnualCost;

    @Column(name = "product_subscription_tier_cost_per_supplier")
    private BigDecimal productSubscriptionTierCostPerSupplier;
}
