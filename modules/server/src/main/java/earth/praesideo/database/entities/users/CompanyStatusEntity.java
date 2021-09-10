package earth.praesideo.database.entities.users;

import earth.praesideo.database.entities.common.BaseModifyListenedEntity;
import lombok.Data;

import javax.persistence.*;

/**
 * @author Koshman Vadim
 */

@Entity
@Table(name = "t_ref_company_status", schema = "static")
@Data
public class CompanyStatusEntity extends BaseModifyListenedEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer statusId;

    private String status;

}
