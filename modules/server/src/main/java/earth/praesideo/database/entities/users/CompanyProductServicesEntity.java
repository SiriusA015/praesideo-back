package earth.praesideo.database.entities.users;

import com.fasterxml.jackson.annotation.JsonIgnore;
import earth.praesideo.database.entities.common.BaseModifyListenedEntity;
import earth.praesideo.database.entities.common.RefListEntity;
import earth.praesideo.database.entities.common.RefProductServicesEntity;
import lombok.Getter;
import lombok.Setter;
import lombok.experimental.Accessors;

import javax.persistence.*;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "t_company_product_services")
@Getter
@Setter
@Accessors(chain = true)
public class CompanyProductServicesEntity extends BaseModifyListenedEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private Integer companyId;
    private Integer refProdServId;
    private Boolean isQuantPerFacility;
    private BigDecimal totalQuantity;
    private Integer totalQuantityUnitId;

    @OneToOne
    @JoinColumn(name = "refProdServId", insertable = false, updatable = false)
    private RefProductServicesEntity refProductServices;

    @OneToOne
    @JoinColumn(name = "totalQuantityUnitId", insertable = false, updatable = false)
    private RefListEntity totalQuantityUnit;

    @JsonIgnore
    @ManyToOne
    @JoinColumn(name = "companyId", insertable = false, updatable = false)
    private CompanyEntity company;

    @OneToMany(mappedBy = "companyProductServices")
    private List<CompanyFacilityDataEntity> companyFacilityData;
}
