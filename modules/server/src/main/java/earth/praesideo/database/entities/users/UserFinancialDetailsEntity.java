package earth.praesideo.database.entities.users;

import earth.praesideo.database.entities.common.BaseCurrencyEntity;
import earth.praesideo.database.entities.common.BaseModifyListenedEntity;
import earth.praesideo.database.entities.common.YearRepresentationEntity;
import lombok.Data;

import javax.persistence.*;
import java.math.BigDecimal;

@Entity
@Table(name = "t_data_financials", schema = "impact")
@Data
public class UserFinancialDetailsEntity extends BaseModifyListenedEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer userFinancialDetailId;
    private Integer yearRepresentationId;
    private Boolean isFinancialYear;
    private Integer startMonth;
    private Integer baseCurrencyId;
    private BigDecimal revenue;
    private BigDecimal netProfit;

    private Integer companyId;

    @Version
    private int version;

    @OneToOne
    @JoinColumn(name = "baseCurrencyId", insertable = false, updatable = false)
    private BaseCurrencyEntity baseCurrency;

    @OneToOne
    @JoinColumn(name = "yearRepresentationId", insertable = false, updatable = false)
    private YearRepresentationEntity yearRepresentation;

    @OneToOne
    @JoinColumn(name = "companyId", updatable = false, insertable = false)
    private CompanyEntity company;
}
