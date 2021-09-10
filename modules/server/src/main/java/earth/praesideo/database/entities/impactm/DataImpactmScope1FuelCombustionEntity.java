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
@Table(name = "t_data_impactm_scope1_fuel_combustion", schema = "impact")
@Getter
@Setter
@Accessors(chain = true)
public class DataImpactmScope1FuelCombustionEntity extends BaseModifyListenedEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer Id;
    private Integer dataEmissionId;
    private Integer fuelTypeId;
    private BigDecimal fuelAmountRaw;
    private Integer fuelUnitId;
    private Integer emissionFactorId;
    private BigDecimal emissionFactorByUser;
    private Integer calcEmissionTypeId;
    private Integer calcConfigEmissionsTypeId;
    private Integer calcConfigEmissionsUnitFactorId;
    private BigDecimal calcFuelAmountConverted;
    private BigDecimal calcTco2;

    @JsonIgnore
    @ManyToOne
    @JoinColumn(name = "dataEmissionId", insertable = false, updatable = false)
    private DataImpactmEmissionEntity dataImpactmEmission;

    @OneToOne
    @JoinColumn(name = "fuelTypeId", insertable = false, updatable = false)
    private RefListEntity fuelType;

    @OneToOne
    @JoinColumn(name = "fuelUnitId", insertable = false, updatable = false)
    private RefListEntity fuelUnit;
}
