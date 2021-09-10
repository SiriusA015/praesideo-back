package earth.praesideo.database.entities.products;

import earth.praesideo.database.entities.common.BaseCurrencyEntity;
import earth.praesideo.database.entities.common.BaseModifyListenedEntity;
import earth.praesideo.database.entities.common.RefListEntity;
import earth.praesideo.database.entities.impactm.DataImpactmScope2ElectricityEntity;
import lombok.Data;

import javax.persistence.*;
import javax.validation.constraints.Size;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "t_invoice", schema = "public")
@Data
public class Invoice extends BaseModifyListenedEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @ManyToOne
    @JoinColumn(name = "subscription_id")
    private ProductSubscription productSubscription;

    @OneToOne
    @JoinColumn(name = "invoice_type_id")
    private RefListEntity invoiceType;

    @OneToOne
    @JoinColumn(name = "invoice_status_id")
    private RefListEntity invoiceStatus;

    @OneToOne
    @JoinColumn(name = "invoice_currency_id")
    private BaseCurrencyEntity invoiceCurrency;

    @Column(name = "invoice_date")
    private Date invoiceDate;

    @Column(name = "invoice_due_date")
    private Date invoiceDueDate;

    @Column(name = "invoice_amount")
    private BigDecimal invoiceAmount;

    @Column(name = "invoice_reference")
    @Size(max = 200)
    private String invoiceReference;

    @OneToMany(mappedBy = "invoice")
    private List<InvoiceItem> invoiceItems;

    @OneToMany(mappedBy = "invoice")
    private List<Payment> paymentList;
}
