package earth.praesideo.database.entities.common;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;

import javax.persistence.*;

@Entity
@Table(name = "t_ref_carbon_price_coverage_type", schema = "static")
@Data
public class CarbonPriceCoverageTypeEntity {
    @Id
    private Integer carbonPriceCoverageTypeId;
    private String name;

    @JsonIgnore
    @ManyToOne
    @JoinColumn(name = "carbonPriceCoverageId")
    private CarbonPriceCoverageEntity carbonPriceCoverage;
}
