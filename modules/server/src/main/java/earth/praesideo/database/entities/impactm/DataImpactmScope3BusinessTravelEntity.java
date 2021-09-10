package earth.praesideo.database.entities.impactm;

import com.fasterxml.jackson.annotation.JsonIgnore;
import earth.praesideo.database.entities.common.BaseModifyListenedEntity;
import earth.praesideo.database.entities.common.RefListEntity;
import lombok.Getter;
import lombok.Setter;
import lombok.experimental.Accessors;

import javax.persistence.*;
import java.math.BigDecimal;

@Entity
@Table(name = "t_data_impactm_scope3_business_travel", schema = "impact")
@Getter
@Setter
@Accessors(chain = true)
public class DataImpactmScope3BusinessTravelEntity extends BaseModifyListenedEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer Id;
    private Integer dataEmissionId;
    private Integer facilityId;
    private String employeeId;
    private Integer transportationModeId;
    private BigDecimal distanceTravelledDaily;
    private BigDecimal distanceTravelledYearly;
    private Integer distanceUnitId;
    private Integer emissionFactorId;
    private BigDecimal emissionFactorByUser;
    private Integer calcConfigEmissionsTypeId;
    private Integer calcConfigEmissionsUnitFactorId;
    private BigDecimal calcTotalDistanceConverted;
    private BigDecimal calcTco2;

    @JsonIgnore
    @ManyToOne
    @JoinColumn(name = "dataEmissionId", insertable = false, updatable = false)
    private DataImpactmEmissionEntity dataImpactmEmission;

    @OneToOne
    @JoinColumn(name = "distanceUnitId", insertable = false, updatable = false)
    private RefListEntity distanceUnit;

    @OneToOne
    @JoinColumn(name = "transportationModeId", insertable = false, updatable = false)
    private RefListEntity transportationMode;
}
