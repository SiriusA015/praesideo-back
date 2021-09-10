package earth.praesideo.database.entities.users;

import earth.praesideo.database.entities.common.BaseModifyListenedEntity;
import lombok.Data;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

/**
 * @author Koshman Vadim
 */
@Entity
@Table(name = "t_users_permission", schema = "public")
@Data
public class PermissionEntity extends BaseModifyListenedEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer permissionId;

    @Column(length = 50)
    private String username;

    @Column(length = 50)
    private String tracePermission;

    @Column(length = 50)
    private String impactPermission;

    @Column(length = 50)
    private String role;

    @Column(length = 50)
    private Integer companyId;

    @ElementCollection
    @CollectionTable(name = "t_permission_service", joinColumns = @JoinColumn(name = "permissionId"))
    @Column(name = "service")
    private Set<String> services = new HashSet<>();
}
