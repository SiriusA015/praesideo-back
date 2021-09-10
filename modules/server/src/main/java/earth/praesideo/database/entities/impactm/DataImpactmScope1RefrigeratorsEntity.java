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
@Table(name = "t_data_impactm_scope1_refrigerators", schema = "impact")
@Getter
@Setter
@Accessors(chain = true)
public class DataImpactmScope1RefrigeratorsEntity extends BaseModifyListenedEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer Id;
    private Integer dataEmissionId;
    private Integer applianceTypeId;
    private BigDecimal annualTopupQuantity;
    private Integer topupUnitId;
    private String identificationNumber;
    private BigDecimal capacity;
    private Integer referigerantTypeId;
    private Integer emissionFactorId;
    private BigDecimal emissionFactorByUser;
    private Integer calcConfigEmissionsTypeId;
    private Integer calcConfigEmissionsUnitFactorId;
    private BigDecimal calcAnnualTopupQuantityConverted;
    private BigDecimal calcTco2;

    @JsonIgnore
    @ManyToOne
    @JoinColumn(name = "dataEmissionId", insertable = false, updatable = false)
    private DataImpactmEmissionEntity dataImpactmEmission;

    @OneToOne
    @JoinColumn(name = "applianceTypeId", insertable = false, updatable = false)
    private RefListEntity applianceType;

    @OneToOne
    @JoinColumn(name = "referigerantTypeId", insertable = false, updatable = false)
    private RefListEntity referigerantType;

    @OneToOne
    @JoinColumn(name = "topupUnitId", insertable = false, updatable = false)
    private RefListEntity topupUnit;

}
