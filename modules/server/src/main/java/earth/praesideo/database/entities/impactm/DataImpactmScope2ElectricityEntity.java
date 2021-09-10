package earth.praesideo.database.entities.impactm;

import com.fasterxml.jackson.annotation.JsonIgnore;
import earth.praesideo.database.entities.common.BaseModifyListenedEntity;
import earth.praesideo.database.entities.common.RefListEntity;
import lombok.Getter;
import lombok.Setter;
import lombok.experimental.Accessors;

import javax.persistence.*;
import java.math.BigDecimal;
import java.util.Date;

@Entity
@Table(name = "t_data_impactm_scope2_electricity", schema = "impact")
@Getter
@Setter
@Accessors(chain = true)
public class DataImpactmScope2ElectricityEntity extends BaseModifyListenedEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer Id;
    private Integer dataEmissionId;
    private Integer facilityId;
    private BigDecimal totalElectricityAmountRaw;
    private Integer totalElectricityUnitId;
    private BigDecimal totalRenewableAmountRaw;
    private Integer totalRenewableUnitId;
    private Integer emissionFactorId;
    private BigDecimal emissionFactorByUser;
    private Integer calcConfigEmissionsTypeId;
    private Integer calcConfigEmissionsUnitFactorId;
    private BigDecimal calcTotalElectricityAmountConverted;
    private BigDecimal calcTco2;

    @JsonIgnore
    @ManyToOne
    @JoinColumn(name = "dataEmissionId", insertable = false, updatable = false)
    private DataImpactmEmissionEntity dataImpactmEmission;

    @OneToOne
    @JoinColumn(name = "facilityId", insertable = false, updatable = false)
    private RefListEntity facility;

    @OneToOne
    @JoinColumn(name = "totalElectricityUnitId", insertable = false, updatable = false)
    private RefListEntity totalElectricityUnit;

    @OneToOne
    @JoinColumn(name = "totalRenewableUnitId", insertable = false, updatable = false)
    private RefListEntity totalRenewableUnit;

}
