package earth.praesideo.database.entities.common;

import lombok.Getter;
import lombok.Setter;
import lombok.experimental.Accessors;

import javax.persistence.*;

@Entity
@Table(name = "t_ref_blocked_domains", schema = "static")
@Getter
@Setter
@Accessors(chain = true)
public class RefBlockedDomainEntity extends BaseModifyListenedEntity{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private String domain;
}
