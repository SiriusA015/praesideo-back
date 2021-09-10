package earth.praesideo.database.entities.suppliers;

import earth.praesideo.database.entities.common.BaseRemoveListenedEntity;
import earth.praesideo.database.entities.users.CompanyEntity;
import lombok.Data;

import javax.persistence.*;
import javax.validation.constraints.Size;
import java.util.Date;

@Entity
@Table(name = "t_supply_chain", schema = "trace")
@Data
public class SupplyChain extends BaseRemoveListenedEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer supplyChainId;

    @ManyToOne
    @JoinColumn(name = "customerId")
    private CompanyEntity customer;

    @ManyToOne
    @JoinColumn(name = "supplierId")
    private CompanyEntity supplier;

    @ManyToOne
    @JoinColumn(name = "supplierInvitationStatusId")
    private SupplierInvitationStatus supplierInvitationStatus;

    private Date supplierInvitationDate;

    @Size(max = 500)
    private String supplierContactEmail;

    private Integer yearRepresentationId;

    private Boolean isFinancialYear;

    //base-one start month
    //if zero then it's reporting year
    //if different than zero is financial year and the value is the month number
    @Column(name = "financial_year_start_month")
    private Integer startMonth;
}
