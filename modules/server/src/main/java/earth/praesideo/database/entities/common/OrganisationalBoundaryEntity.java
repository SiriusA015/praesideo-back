package earth.praesideo.database.entities.common;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "t_ref_organisational_boundary", schema = "static")
@Data
public class OrganisationalBoundaryEntity {
    @Id
    private Integer organisationalBoundaryId;
    private String name;

    @JsonIgnore
    @OneToMany(mappedBy = "organisationalBoundary")
    private List<OrganisationalBoundaryCriteriaEntity> organisationalBoundaryCriteria;
}
