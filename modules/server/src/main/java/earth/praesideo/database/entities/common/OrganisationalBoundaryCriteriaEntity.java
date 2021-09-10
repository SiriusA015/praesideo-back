package earth.praesideo.database.entities.common;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;

import javax.persistence.*;

@Entity
@Table(name = "t_ref_organisational_boundary_criteria", schema = "static")
@Data
public class OrganisationalBoundaryCriteriaEntity {
    @Id
    private Integer organisationalBoundaryCriteriaId;
    private String name;

    @JsonIgnore
    @ManyToOne
    @JoinColumn(name = "organisationalBoundaryId")
    private OrganisationalBoundaryEntity organisationalBoundary;
}
