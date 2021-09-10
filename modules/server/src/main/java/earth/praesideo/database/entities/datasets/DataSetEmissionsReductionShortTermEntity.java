package earth.praesideo.database.entities.datasets;

import com.fasterxml.jackson.annotation.JsonIgnore;
import earth.praesideo.database.entities.common.BaseModifyListenedEntity;
import earth.praesideo.database.entities.common.EmissionsReductionTargetScopeEntity;
import java.util.Objects;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import lombok.Data;

@Entity
@IdClass(DataSetEmissionsReductionShortTermId.class)
@Table(name = "t_data_emissions_reduction_short_term", schema = "impact")
@Data
public class DataSetEmissionsReductionShortTermEntity extends BaseModifyListenedEntity {

	@Id
	private Integer emissionsReductionId;

	@Id
	private Integer emissionsReductionTargetScopeId;

	/**
	 * 0 - Absolute
	 * 1 - Relative
	 */
	@Id
	private Integer targetTypeId;

	private Boolean isAssumedSubstitution;
	private Double targetReductionShortTermPlan1;
	private Double targetReductionShortTermPlan2;
	private Double targetReductionShortTermPlan3;
	private Double targetReductionShortTermPlan4;

	@JsonIgnore
	@ManyToOne
	@JoinColumn(name = "emissionsReductionId", insertable = false, updatable = false)
	private DataSetEmissionsReductionEntity emissionsReduction;

	@JsonIgnore
	@OneToOne
	@JoinColumn(name = "emissionsReductionTargetScopeId", insertable = false, updatable = false)
	private EmissionsReductionTargetScopeEntity emissionsReductionTargetScope;

	@Override
	public boolean equals(Object o) {
		if (this == o) {
			return true;
		}
		if (o == null || getClass() != o.getClass()) {
			return false;
		}
		DataSetEmissionsReductionShortTermEntity that = (DataSetEmissionsReductionShortTermEntity) o;
		return emissionsReductionId.equals(that.emissionsReductionId) &&
				emissionsReductionTargetScopeId.equals(that.emissionsReductionTargetScopeId) &&
				targetTypeId.equals(that.targetTypeId);
	}

	@Override
	public int hashCode() {
		return Objects.hash(emissionsReductionId, emissionsReductionTargetScopeId, targetTypeId);
	}
}
