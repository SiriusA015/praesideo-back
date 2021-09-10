package earth.praesideo.database.entities.datasets;

import com.fasterxml.jackson.annotation.JsonIgnore;
import earth.praesideo.database.entities.common.BaseModifyListenedEntity;
import lombok.Data;

import javax.persistence.*;

@Entity
@Table(name = "t_data_ghg_inventory_method_operational_boundary", schema = "impact")
@Data
public class DataSetGhgInventoryMethodOperationalBoundaryEntity extends BaseModifyListenedEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer ghgInventoryMethodEntityOperationalBoundaryId;
    private Integer ghgInventoryMethodEntityId;
    private Integer operationalBoundaryId;

    @JsonIgnore
    @ManyToOne
    @JoinColumn(name = "ghgInventoryMethodEntityId", insertable = false, updatable = false)
    private DataSetGhgInventoryMethodEntity dataSetGhgInventoryMethod;
}
