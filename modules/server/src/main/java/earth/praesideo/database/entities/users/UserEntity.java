package earth.praesideo.database.entities.users;

import earth.praesideo.database.entities.common.BaseModifyListenedEntity;
import lombok.Data;

import javax.persistence.*;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "t_users")
@Data
public class UserEntity extends BaseModifyListenedEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer userId;
    @Column(length = 50)
    private String username;
    @Column(length = 150)
    private String password;
    private String email;
    private Boolean enabled;
    @Column(name = "restore_key")
    private String restoreKey;
    @Column(length = 150)
    private String activationString;
    private Date activationTokenDate;
    @Column(name = "approval_date")
    private Date approvalDate;
    @Version
    private int version;

    @OneToMany(mappedBy = "user", fetch = FetchType.EAGER)
    private List<AuthorityEntity> authorities;

    @ManyToOne
    @JoinColumn(name = "companyId")
    private CompanyEntity company;
}
