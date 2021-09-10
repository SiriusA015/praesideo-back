package earth.praesideo.database.entities.products;

import earth.praesideo.database.entities.common.BaseCurrencyEntity;
import earth.praesideo.database.entities.common.BaseModifyListenedEntity;
import earth.praesideo.database.entities.common.RefListEntity;
import lombok.Data;

import javax.persistence.*;
import javax.validation.constraints.Size;
import java.math.BigDecimal;

@Entity
@Table(name = "t_invoice_items", schema = "public")
@Data
public class InvoiceItem extends BaseModifyListenedEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @ManyToOne
    @JoinColumn(name = "invoice_id")
    private Invoice invoice;

    @Column(name = "invoice_item_text")
    @Size(max = 500)
    private String invoiceItemText;

    @OneToOne
    @JoinColumn(name = "invoice_item_currency_id")
    private BaseCurrencyEntity invoiceItemCurrency;

    @Column(name = "invoice_item_amount")
    private BigDecimal invoiceItemAmount;

    @OneToOne
    @JoinColumn(name = "invoice_item_type_id")
    private RefListEntity invoiceItemType;

    @Column(name = "invoice_item_sequence")
    private Integer invoiceItemSequence;

    @ManyToOne
    @JoinColumn(name = "discount_id")
    private Discount discount;

}
