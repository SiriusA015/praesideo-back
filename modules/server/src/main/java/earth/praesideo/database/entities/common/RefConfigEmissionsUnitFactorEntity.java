package earth.praesideo.database.entities.common;

import lombok.Getter;
import lombok.Setter;
import lombok.experimental.Accessors;

import javax.persistence.*;
import java.math.BigDecimal;
import java.util.Date;

@Entity
@Table(name = "t_ref_config_emissions_unit_factor", schema = "static")
@Getter
@Setter
@Accessors(chain = true)
public class RefConfigEmissionsUnitFactorEntity extends BaseModifyListenedEntity{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer Id;
    private Integer configEmissionTypeId;
    private Integer etypeUnitId1;
    private Integer etypeUnitId2;
    private BigDecimal etypeUnitFactor1;
    private BigDecimal etypeUnitFactor2;

    @ManyToOne
    @JoinColumn(name = "configEmissionTypeId", insertable = false, updatable = false)
    private RefConfigEmissionsTypeEntity configEmissionType;

    @OneToOne
    @JoinColumn(name = "etypeUnitId1", insertable = false, updatable = false)
    private RefListEntity etypeUnit1;

    @OneToOne
    @JoinColumn(name = "etypeUnitId2", insertable = false, updatable = false)
    private RefListEntity etypeUnit2;

}
