package earth.praesideo.database.entities.datasets;

import com.fasterxml.jackson.annotation.JsonIgnore;
import earth.praesideo.database.entities.common.EmissionsReductionTargetScopeEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;

import javax.persistence.*;

@Entity
@Table(name = "t_data_emissions_reduction_target", schema = "impact")
@Data
@EqualsAndHashCode(callSuper = true)
public class DataSetEmissionsReductionTargetsEntity extends DataSetEmissionsReductionTarget {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer emissionsReductionTargetId;

	private Integer emissionsReductionTargetScopeId;

	private Integer emissionsReductionId;

	@JsonIgnore
	@OneToOne
	@JoinColumn(name = "emissionsReductionTargetScopeId", insertable = false, updatable = false)
	private EmissionsReductionTargetScopeEntity emissionsReductionTargetScope;

	@JsonIgnore
	@ManyToOne
	@JoinColumn(name = "emissionsReductionId", insertable = false, updatable = false)
	private DataSetEmissionsReductionEntity emissionsReduction;
}
