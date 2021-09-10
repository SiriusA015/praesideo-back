package earth.praesideo.database.entities.common;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Getter;
import lombok.Setter;
import lombok.experimental.Accessors;

import javax.persistence.*;
import java.math.BigDecimal;
import java.util.Date;

@Entity
@Table(name = "t_ref_config_emissions_factor", schema = "static")
@Getter
@Setter
@Accessors(chain = true)
public class RefConfigEmissionsFactorEntity extends BaseModifyListenedEntity{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer Id;
    private Integer continentId;
    private Integer regionId;
    private Integer countryId;
    private Integer stateId;
    private Integer industrySectorId;
    private Integer industrySubsectorId;
    private Integer configEtypeId;
    private BigDecimal emissionFactor;
    private Integer emissionSourceId;
    private Date startDate;
    private Date endDate;

    @JsonIgnore
    @ManyToOne
    @JoinColumn(name = "configEtypeId", insertable = false, updatable = false)
    private RefConfigEmissionsTypeEntity refConfigEmissionsTypeEntity;

}
