package earth.praesideo.database.entities.common;

import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import java.util.List;

@Entity
@Table(name = "t_ref_operational_boundary_scope", schema = "static")
@Data
public class OperationalBoundaryScopeEntity {
    @Id
    private Integer operationalBoundaryScopeId;
    private String name;

    @OneToMany(mappedBy = "operationalBoundaryScope")
    private List<OperationalBoundaryEntity> operationalBoundaries;
}
