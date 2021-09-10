package earth.praesideo.database.entities.products;

import earth.praesideo.database.entities.common.BaseCurrencyEntity;
import earth.praesideo.database.entities.common.BaseModifyListenedEntity;
import earth.praesideo.database.entities.common.RefListEntity;
import lombok.Data;

import javax.persistence.*;
import javax.validation.constraints.Size;
import java.math.BigDecimal;

@Entity
@Table(name = "t_payments", schema = "public")
@Data
public class Payment extends BaseModifyListenedEntity {
    @Id
    private Integer id;

    @ManyToOne
    @JoinColumn(name = "invoice_id", insertable = false, updatable = false)
    private Invoice invoice;

    @Column(name = "payment_amount")
    private BigDecimal paymentAmount;

    @OneToOne
    @JoinColumn(name = "payment_currency_id", insertable = false, updatable = false)
    private BaseCurrencyEntity paymentCurrency;

    @Column(name = "payment_reference")
    @Size(max = 500)
    private String paymentReference;

    @OneToOne
    @JoinColumn(name = "payment_method_id", insertable = false, updatable = false)
    private RefListEntity paymentMethod;

    @Column(name = "payment_info")
    @Size(max = 500)
    private String paymentInfo;

    @OneToOne
    @JoinColumn(name = "payment_status_id", insertable = false, updatable = false)
    private RefListEntity paymentStatus;

}
