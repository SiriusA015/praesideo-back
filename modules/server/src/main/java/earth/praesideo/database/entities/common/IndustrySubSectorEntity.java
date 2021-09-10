package earth.praesideo.database.entities.common;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;

import javax.persistence.*;

@Entity
@Table(name = "t_ref_industry_subsector", schema = "static")
@Data
public class IndustrySubSectorEntity {
    @Id
    private Integer industrySubsectorId;
    private String name;

    @JsonIgnore
    @ManyToOne
    @JoinColumn(name = "industrySectorId")
    private IndustrySectorEntity industrySector;

}
