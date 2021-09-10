package earth.praesideo.database.entities.common;

import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "t_ref_emissions_reduction_target_scope", schema = "static")
@Data
public class EmissionsReductionTargetScopeEntity {
    @Id
    private Integer emissionsReductionTargetScopeId;
    private String name;
}
