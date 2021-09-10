package earth.praesideo.database.entities.common;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;

import javax.persistence.*;

@Entity
@Table(name = "t_ref_carbon_compensation_type", schema = "static")
@Data
public class CarbonCompensationTypeEntity {
    @Id
    private Integer carbonCompensationTypeId;
    private String name;

    @JsonIgnore
    @ManyToOne
    @JoinColumn(name = "carbonCreditCategoryId")
    private CarbonCreditCategoryEntity carbonCreditCategory;
}
