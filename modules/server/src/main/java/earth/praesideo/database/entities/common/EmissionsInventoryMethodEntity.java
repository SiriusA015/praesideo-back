package earth.praesideo.database.entities.common;

import lombok.Data;

import javax.persistence.*;

@Entity
@Table(name = "t_ref_emissions_inventory_method", schema = "static")
@Data
public class EmissionsInventoryMethodEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer emissionsInventoryMethodId;
    private String name;


}
