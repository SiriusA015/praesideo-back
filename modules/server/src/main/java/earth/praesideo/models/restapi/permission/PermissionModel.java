package earth.praesideo.models.restapi.permission;

import lombok.Data;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

/**
 * @author Koshman Vadim
 */
@Data
public class PermissionModel implements Serializable {
    private String username;
    private Integer companyId;
    private String impactDataPermission;
    private String traceDataPermission;
    private Boolean enabled;
    private String role;
    private Set<String> services = new HashSet<>();
}
