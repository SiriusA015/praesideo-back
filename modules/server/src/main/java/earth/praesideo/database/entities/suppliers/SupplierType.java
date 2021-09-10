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
@Table(name = "t_ref_supplier_type", schema = "static")
@Data
public class SupplierType extends BaseRemoveListenedEntity implements DictionaryEntity {

    @Id
    @Column(name = "supplier_type_id")
    private Integer id;

    @Size(max = 500)
    @Column(name = "supplier_type")
    private String value;
}
