package earth.praesideo.database.entities.common;

import lombok.Getter;
import lombok.Setter;
import lombok.experimental.Accessors;

import javax.persistence.*;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "t_ref_config_emissions_type", schema = "static")
@Getter
@Setter
@Accessors(chain = true)
public class RefConfigEmissionsTypeEntity extends BaseModifyListenedEntity{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private Integer etypeId;
    private Integer etypeattrId1;
    private Integer etypeattrId2;
    private Integer etypeattrId3;
    private Integer etypeattrId4;
    private Integer etypeUnitId1;
    private Integer etypeUnitId2;

    @OneToOne
    @JoinColumn(name = "etypeId", insertable = false, updatable = false)
    private RefListEntity eType;

    @OneToOne
    @JoinColumn(name = "etypeattrId1", insertable = false, updatable = false)
    private RefListEntity etypeattr1;

    @OneToOne
    @JoinColumn(name = "etypeattrId2", insertable = false, updatable = false)
    private RefListEntity etypeattr2;

    @OneToOne
    @JoinColumn(name = "etypeattrId3", insertable = false, updatable = false)
    private RefListEntity etypeattr3;

    @OneToOne
    @JoinColumn(name = "etypeattrId4", insertable = false, updatable = false)
    private RefListEntity etypeattr4;

    @OneToOne
    @JoinColumn(name = "etypeUnitId1", insertable = false, updatable = false)
    private RefListEntity etypeUnit1;

    @OneToOne
    @JoinColumn(name = "etypeUnitId2", insertable = false, updatable = false)
    private RefListEntity etypeUnit2;

    @OneToMany(mappedBy = "configEmissionType")
    private List<RefConfigEmissionsUnitFactorEntity> refConfigEmissionsUnitFactor;
}