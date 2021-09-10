package earth.praesideo.database.entities.users;

import earth.praesideo.database.entities.common.BaseModifyListenedEntity;
import lombok.Getter;
import lombok.Setter;
import lombok.experimental.Accessors;

import javax.persistence.*;

@Entity
@Table(name = "t_ref_company_category", schema="static" )
@Getter
@Setter
@Accessors(chain = true)
public class CompanyCategoryEntity extends BaseModifyListenedEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private String category;

}
