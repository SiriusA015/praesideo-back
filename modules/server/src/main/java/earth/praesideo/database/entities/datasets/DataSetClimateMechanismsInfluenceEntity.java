package earth.praesideo.database.entities.datasets;

import com.fasterxml.jackson.annotation.JsonIgnore;
import earth.praesideo.database.entities.common.BaseCurrencyEntity;
import earth.praesideo.database.entities.common.BaseModifyListenedEntity;
import earth.praesideo.database.entities.common.CarbonPriceCoverageEntity;
import earth.praesideo.database.entities.common.CarbonPriceCoverageTypeEntity;
import earth.praesideo.database.entities.users.CompanyEntity;
import lombok.Data;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "t_data_climate_mechanisms_influence", schema = "impact")
@Data
public class DataSetClimateMechanismsInfluenceEntity extends BaseModifyListenedEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer climateMechanismInfluenceId;

    private Boolean internalCarbonPriceUsed;
    private Double carbonPrice;
    private Integer baseCurrencyId;
    private Integer carbonPriceCoverageId;
    private Integer carbonPriceCoverageTypeId;

    @JsonIgnore
    @OneToOne
    @JoinColumn(name = "baseCurrencyId", insertable = false, updatable = false)
    private BaseCurrencyEntity baseCurrencyEntity;

    @JsonIgnore
    @OneToOne
    @JoinColumn(name = "carbonPriceCoverageId", insertable = false, updatable = false)
    private CarbonPriceCoverageEntity carbonPriceCoverage;

    @JsonIgnore
    @OneToOne
    @JoinColumn(name = "carbonPriceCoverageTypeId", insertable = false, updatable = false)
    private CarbonPriceCoverageTypeEntity carbonPriceCoverageType;

    @JsonIgnore
    @ManyToOne
    @JoinColumn(name = "companyId")
    private CompanyEntity company;

    @OneToMany(mappedBy = "climateMechanismsInfluence", cascade = CascadeType.ALL)
    private List<DataSetClimateMechanismsInfluenceMetricEntity> climateMechanismsInfluenceMetrics;
}
