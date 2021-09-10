package earth.praesideo.database.entities.common;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;

import javax.persistence.*;

@Entity
@Table(name = "t_ref_operational_boundary", schema = "static")
@Data
public class OperationalBoundaryEntity {
    @Id
    private Integer operationalBoundaryId;
    private String name;

    @JsonIgnore
    @ManyToOne
    @JoinColumn(name = "operationalBoundaryScopeId")
    private OperationalBoundaryScopeEntity operationalBoundaryScope;
}
