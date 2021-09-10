package earth.praesideo.database.entities.common;

import lombok.Data;

import javax.persistence.*;

@Entity
@Table(name = "t_ref_auditing_validation", schema = "static")
@Data
public class AuditingValidationEntity {
    @Id
    private Integer auditingValidationId;
    private String name;
}
