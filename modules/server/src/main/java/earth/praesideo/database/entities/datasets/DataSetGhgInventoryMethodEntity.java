package earth.praesideo.database.entities.datasets;

import com.fasterxml.jackson.annotation.JsonIgnore;
import earth.praesideo.database.entities.common.BaseModifyListenedEntity;
import earth.praesideo.database.entities.users.CompanyEntity;
import lombok.Data;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "t_data_ghg_inventory_method", schema = "impact")
@Data
public class DataSetGhgInventoryMethodEntity extends BaseModifyListenedEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer ghgInventoryMethodEntityId;

    private Integer emissionsInventoryMethodId;
    // if user selects other in the dropdown
    private String otherEmissionsInventoryMethod;
    private Integer organisationalBoundaryId;
    private Integer organisationalBoundaryCriteriaId;

    private Integer auditingValidationId;
    private String auditingValidationOther;

    @Column(columnDefinition = "boolean default true")
    private Boolean isGhgInventoryPresent;

    @OneToMany(mappedBy = "dataSetGhgInventoryMethod", cascade = CascadeType.ALL)
    private List<DataSetGhgInventoryMethodOperationalBoundaryEntity> dataSetGhgInventoryMethodOperationalBoundaries;

    @JsonIgnore
    @ManyToOne
    @JoinColumn(name = "companyId")
    private CompanyEntity company;
}
