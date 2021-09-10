package earth.praesideo.database.entities.datasets;

import com.fasterxml.jackson.annotation.JsonIgnore;
import earth.praesideo.database.entities.common.EmissionsReductionTargetScopeEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;

import javax.persistence.*;

@Entity
@Table(name = "t_data_emissions_reduction_target_scenarios", schema = "impact")
@Data
@EqualsAndHashCode(callSuper = true)
public class DataEmissionsReductionTargetsScenarioEntity extends DataSetEmissionsReductionTarget {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer scenarioId;

	@JsonIgnore
	@ManyToOne
	@JoinColumn(name = "emissions_reduction_id", insertable = false, updatable = false)
	private DataSetEmissionsReductionEntity emissionsReduction;

	@JsonIgnore
	@OneToOne
	@JoinColumn(name = "emissions_reduction_target_scope_id", insertable = false, updatable = false)
	private EmissionsReductionTargetScopeEntity emissionsReductionTargetScope;
}
