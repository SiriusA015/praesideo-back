package earth.praesideo.database.entities.common;

import lombok.Getter;
import lombok.Setter;
import lombok.experimental.Accessors;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "t_ref_product_services", schema="static" )
@Getter
@Setter
@Accessors(chain = true)
public class RefProductServicesEntity extends BaseModifyListenedEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private String prodServName;
}
