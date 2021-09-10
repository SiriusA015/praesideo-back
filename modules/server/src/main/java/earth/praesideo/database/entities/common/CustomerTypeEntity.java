package earth.praesideo.database.entities.common;

import lombok.Data;

import javax.persistence.*;

@Entity
@Table(name = "t_ref_customer_type", schema = "static")
@Data
public class CustomerTypeEntity {
    @Id
    private Integer customerTypeId;
    private String name;

    @ManyToOne
    @JoinColumn(name = "productSelectionId")
    private ProductSelectionEntity product;
}
