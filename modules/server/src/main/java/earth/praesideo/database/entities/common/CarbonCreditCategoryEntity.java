package earth.praesideo.database.entities.common;

import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import java.util.List;

@Entity
@Table(name = "t_ref_carbon_credit_category", schema = "static")
@Data
public class CarbonCreditCategoryEntity {
    @Id
    private Integer carbonCreditCategoryId;
    private String name;

    @OneToMany(mappedBy = "carbonCreditCategory")
    private List<CarbonCompensationTypeEntity> carbonCompensationTypes;
}
