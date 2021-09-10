package earth.praesideo.database.entities.impactperformance;

import earth.praesideo.database.entities.users.CompanyEntity;
import lombok.Data;
import lombok.experimental.Accessors;

import javax.persistence.*;
import java.io.Serializable;

@Embeddable
@Data
@Accessors(chain = true)
public class ImpactTemperatureAlignmentKey implements Serializable {
    @ManyToOne
    @JoinColumn(name = "companyId")
    private CompanyEntity organisation;

    private Integer year;

    @Enumerated(EnumType.ORDINAL)
    private TemperatureAlignmentRecordType recordType;

    @Column(name = "is_scenario")
    private Boolean isScenario;

    @Column(name = "is_supplychain_aggregated")
    private Boolean isSupplyChainAggregated;
}
