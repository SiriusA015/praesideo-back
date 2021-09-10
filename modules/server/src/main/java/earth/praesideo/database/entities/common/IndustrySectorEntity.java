package earth.praesideo.database.entities.common;

import lombok.Data;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "t_ref_industry_sector", schema = "static")
@Data
public class IndustrySectorEntity {
    @Id
    private Integer industrySectorId;
    private String name;

    @OneToMany(mappedBy = "industrySector")
    private List<IndustrySubSectorEntity> industrySubSectors;
}
