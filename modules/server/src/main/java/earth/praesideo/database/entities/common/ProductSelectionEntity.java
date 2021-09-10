package earth.praesideo.database.entities.common;

import lombok.Data;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "t_ref_product_selection", schema = "static")
@Data
public class ProductSelectionEntity {
    @Id
    private Integer productSelectionId;
    private String name;

    @OneToMany(mappedBy = "product")
    private List<CustomerTypeEntity> customerTypes;
}
