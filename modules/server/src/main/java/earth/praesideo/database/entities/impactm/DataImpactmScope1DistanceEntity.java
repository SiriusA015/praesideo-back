package earth.praesideo.database.entities.impactm;

import com.fasterxml.jackson.annotation.JsonIgnore;
import earth.praesideo.database.entities.common.BaseModifyListenedEntity;
import earth.praesideo.database.entities.common.RefConfigEmissionsFactorEntity;
import earth.praesideo.database.entities.common.RefListEntity;
import lombok.Getter;
import lombok.Setter;
import lombok.experimental.Accessors;

import javax.persistence.*;
import java.math.BigDecimal;
import java.util.Date;

@Entity
@Table(name = "t_data_impactm_scope1_distance", schema = "impact")
@Getter
@Setter
@Accessors(chain = true)
public class DataImpactmScope1DistanceEntity extends BaseModifyListenedEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer Id;
    private Integer dataEmissionId;
    private Integer vehicleCategoryId;
    private Integer vehicleTypeId;
    private BigDecimal distanceAmountRaw;
    private Integer distanceUnitId;
    private Integer emissionFactorId;
    private BigDecimal emissionFactorByUser;
    private Integer calcConfigEmissionsTypeId;
    private Integer calcConfigEmissionsUnitFactorId;
    private BigDecimal calcDistanceAmountConverted;
    private BigDecimal calcTco2;

    @JsonIgnore
    @ManyToOne
    @JoinColumn(name = "dataEmissionId", insertable = false, updatable = false)
    private DataImpactmEmissionEntity dataImpactmEmission;

    @OneToOne
    @JoinColumn(name = "vehicleCategoryId", insertable = false, updatable = false)
    private RefListEntity vehicleCategory;

    @OneToOne
    @JoinColumn(name = "vehicleTypeId", insertable = false, updatable = false)
    private RefListEntity vehicleType;

    @OneToOne
    @JoinColumn(name = "distanceUnitId", insertable = false, updatable = false)
    private RefListEntity distanceUnit;

}
