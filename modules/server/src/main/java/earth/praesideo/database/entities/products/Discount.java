package earth.praesideo.database.entities.products;

import earth.praesideo.database.entities.common.BaseModifyListenedEntity;
import earth.praesideo.database.entities.users.CompanyEntity;
import lombok.Data;

import javax.persistence.*;
import java.math.BigDecimal;
import java.util.Date;

@Entity
@Table(name = "t_discounts", schema = "public")
@Data
public class Discount extends BaseModifyListenedEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @ManyToOne
    @JoinColumn(name = "product_variant_id", insertable = false, updatable = false)
    private ProductVariant productVariant;

    @ManyToOne
    @JoinColumn(name = "subscription_id", insertable = false, updatable = false)
    private ProductSubscription productSubscription;

    @ManyToOne
    @JoinColumn(name = "customer_id", insertable = false, updatable = false)
    private CompanyEntity company;

    @Column(name = "is_discount_on_product")
    private Boolean isDiscountOnProduct;

    @Column(name = "is_discount_on_subscription")
    private Boolean isDiscountOnSubscription;

    @Column(name = "is_discount_on_customer")
    private Boolean isDiscountOnCustomer;

    @Column(name = "is_discount_absolute")
    private Boolean isDiscountAbsolute;

    @Column(name = "is_discount_percentage")
    private Boolean isDiscountPercentage;

    @Column(name = "is_discount_on_supplier_usage")
    private Boolean isDiscountOnSupplierUsage;

    @Column(name = "is_discount_on_api_usage")
    private Boolean isDiscountOnApiUsage;

    @Column(name = "is_discount_on_total")
    private Boolean isDiscountOnTotal;

    @Column(name = "discount_on_product_absolute")
    private BigDecimal discountOnProductAbsolute;

    @Column(name = "discount_on_product_percentage")
    private BigDecimal discountOnProductPercentage;

    @Column(name = "discount_on_subscription_absolute")
    private BigDecimal discountOnSubscriptionAbsolute;

    @Column(name = "discount_on_subscription_percentage")
    private BigDecimal discountOnSubscriptionPercentage;

    @Column(name = "discount_on_customer_absolute")
    private BigDecimal discountOnCustomerAbsolute;

    @Column(name = "discount_on_customer_percentage")
    private BigDecimal discountOnCustomerPercentage;

    @Column(name = "discount_on_supplier_usage_absolute")
    private BigDecimal discountOnSupplierUsageAbsolute;

    @Column(name = "discount_on_supplier_usage_percentage")
    private BigDecimal discountOnSupplierUsagePercentage;

    @Column(name = "discount_on_api_usage_absolute")
    private BigDecimal discountOnApiUsageAbsolute;

    @Column(name = "discount_on_api_usage_percentage")
    private BigDecimal discountOnApiUsagePercentage;

    @Column(name = "discount_on_total_absolute")
    private BigDecimal discountOnTotalAbsolute;

    @Column(name = "discount_on_total_percentage")
    private BigDecimal discountOnTotalPercentage;

    @Column(name = "discount_start_date")
    private Date discountStartDate;

    @Column(name = "discount_end_date")
    private Date discountEndDate;

}
