package earth.praesideo.database.entities.users;

import com.fasterxml.jackson.annotation.JsonIgnore;
import earth.praesideo.database.entities.common.BaseModifyListenedEntity;
import lombok.Getter;
import lombok.Setter;
import lombok.experimental.Accessors;

import java.math.BigDecimal;
import java.util.Date;

import javax.persistence.*;

@Entity
@Table(name = "t_company_structure")
@Getter
@Setter
@Accessors(chain = true)
public class CompanyStructureEntity extends BaseModifyListenedEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private Integer companyId;
    private Integer relCompanyId;
    private Integer relCompanyCategoryId;
    private BigDecimal economicInterestPercentage;
    private Boolean isOperatingPoliciesControl;
    private Boolean isFinancialAccounting;

    @JsonIgnore
    @ManyToOne
    @JoinColumn(name = "companyId", insertable = false, updatable = false)
    private CompanyEntity company;

    @JsonIgnore
    @OneToOne
    @JoinColumn(name = "relCompanyId", insertable = false, updatable = false)
    private CompanyEntity relCompany;

    @OneToOne
    @JoinColumn(name = "relCompanyCategoryId", insertable = false, updatable = false)
    private CompanyCategoryEntity relCompanyCategory;

}
