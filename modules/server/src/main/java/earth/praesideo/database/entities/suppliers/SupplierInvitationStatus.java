package earth.praesideo.database.entities.suppliers;

import earth.praesideo.database.entities.common.BaseRemoveListenedEntity;
import earth.praesideo.database.entities.common.DictionaryEntity;
import lombok.Data;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.Size;

@Entity
@Table(name = "t_ref_supplier_invitation_status", schema = "static")
@Data
public class SupplierInvitationStatus extends BaseRemoveListenedEntity implements DictionaryEntity {

    @Id
    @Column(name = "supplier_invitation_status_id")
    private Integer id;

    @Size(max = 500)
    @Column(name = "supplier_invitation_status")
    private String value;
}
