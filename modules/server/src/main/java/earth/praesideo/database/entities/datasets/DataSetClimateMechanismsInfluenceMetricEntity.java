package earth.praesideo.database.entities.datasets;

import com.fasterxml.jackson.annotation.JsonIgnore;
import earth.praesideo.database.entities.common.BaseModifyListenedEntity;
import lombok.Data;

import javax.persistence.*;

@Entity
@Table(name = "t_data_climate_mechanisms_influence_metric", schema = "impact")
@Data
public class DataSetClimateMechanismsInfluenceMetricEntity extends BaseModifyListenedEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer climateMechanismInfluenceMetricId;

    private Integer climateMechanismInfluenceId;
    private String businessAssociation;

    @JsonIgnore
    @ManyToOne
    @JoinColumn(name = "climateMechanismInfluenceId", insertable = false, updatable = false)
    private DataSetClimateMechanismsInfluenceEntity climateMechanismsInfluence;

}
