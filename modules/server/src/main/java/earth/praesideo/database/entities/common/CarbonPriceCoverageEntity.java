package earth.praesideo.database.entities.common;

import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import java.util.List;

@Entity
@Table(name = "t_ref_carbon_price_coverage", schema = "static")
@Data
public class CarbonPriceCoverageEntity {
    @Id
    private Integer carbonPriceCoverageId;
    private String name;

    @OneToMany(mappedBy = "carbonPriceCoverage")
    private List<CarbonPriceCoverageTypeEntity> carbonPriceCoverageTypes;
}
