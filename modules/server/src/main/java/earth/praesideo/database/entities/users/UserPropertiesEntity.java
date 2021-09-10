package earth.praesideo.database.entities.users;

import earth.praesideo.database.entities.common.BaseModifyListenedEntity;
import lombok.Data;

import javax.persistence.*;

/**
 * @author Koshman Vadim
 */
@Entity
@Table(name = "t_user_properties", schema = "public")
@Data
public class UserPropertiesEntity extends BaseModifyListenedEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "p_key")
    private String key;
    @Column(name = "p_value")
    private String value;
}
