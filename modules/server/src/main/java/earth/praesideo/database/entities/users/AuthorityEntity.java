package earth.praesideo.database.entities.users;

import com.fasterxml.jackson.annotation.JsonIgnore;
import earth.praesideo.database.entities.common.BaseModifyListenedEntity;
import lombok.Data;

import javax.persistence.*;

@Entity
@Table(name = "t_users_authentication")
@Data
public class AuthorityEntity extends BaseModifyListenedEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer authorityId;
    @Column(length = 50)
    private String username;
    @Column(length = 50)
    private String authority;

    @JsonIgnore
    @ManyToOne
    @JoinColumn(name = "userId")
    private UserEntity user;
}
