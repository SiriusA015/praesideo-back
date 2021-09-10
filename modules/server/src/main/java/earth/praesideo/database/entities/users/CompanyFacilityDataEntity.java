package earth.praesideo.database.entities.users;

import earth.praesideo.database.entities.common.BaseModifyListenedEntity;
import earth.praesideo.database.entities.common.RefListEntity;
import earth.praesideo.database.entities.common.RefProductServicesEntity;
import lombok.Getter;
import lombok.Setter;
import lombok.experimental.Accessors;

import javax.persistence.*;
import java.math.BigDecimal;
import java.util.Date;

@Entity
@Table(name = "t_company_facilities_data")
@Getter
@Setter
@Accessors(chain = true)
public class CompanyFacilityDataEntity extends BaseModifyListenedEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private Integer compProdServId;
    private Integer facilityId;
    private BigDecimal quantity;
    private Integer quantityUnitId;
    private BigDecimal quantityInPercentage;

    @ManyToOne
    @JoinColumn(name = "compProdServId", insertable = false, updatable = false)
    private CompanyProductServicesEntity companyProductServices;

    @OneToOne
    @JoinColumn(name = "facilityId", insertable = false, updatable = false)
    private CompanyFacilityEntity companyFacility;

    @OneToOne
    @JoinColumn(name = "quantityUnitId", insertable = false, updatable = false)
    private RefListEntity quantityUnit;
}
