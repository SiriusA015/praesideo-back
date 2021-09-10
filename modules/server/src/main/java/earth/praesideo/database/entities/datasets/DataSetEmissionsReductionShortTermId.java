package earth.praesideo.database.entities.datasets;

import java.io.Serializable;
import java.util.Objects;

import lombok.Data;

@Data
public class DataSetEmissionsReductionShortTermId implements Serializable {

    private Integer emissionsReductionId;
    private Integer emissionsReductionTargetScopeId;
    /**
     * 0 - Absolute
     * 1 - Relative
     */
    private Integer targetTypeId;

    public DataSetEmissionsReductionShortTermId() {
    }

    public DataSetEmissionsReductionShortTermId(Integer emissionsReductionId, Integer emissionsReductionTargetScopeId, Integer targetTypeId) {
        this.emissionsReductionId = emissionsReductionId;
        this.emissionsReductionTargetScopeId = emissionsReductionTargetScopeId;
        this.targetTypeId = targetTypeId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        DataSetEmissionsReductionShortTermId that = (DataSetEmissionsReductionShortTermId) o;
        return emissionsReductionId.equals(that.emissionsReductionId) &&
                emissionsReductionTargetScopeId.equals(that.emissionsReductionTargetScopeId) &&
                targetTypeId.equals(that.targetTypeId);
    }

    @Override
    public int hashCode() {
        return Objects.hash(emissionsReductionId, emissionsReductionTargetScopeId, targetTypeId);
    }
}
