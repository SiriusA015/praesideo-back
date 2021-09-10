package earth.praesideo.database.entities.datasets;

import earth.praesideo.database.entities.common.BaseModifyListenedEntity;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.MappedSuperclass;

@NoArgsConstructor
@AllArgsConstructor
@MappedSuperclass
@Data
abstract class DataSetEmissionsReductionTarget extends BaseModifyListenedEntity {

    /**
     * 0 - Absolute
     * 1 - Relative
     */
    private Integer targetTypeId;
    private Integer targetReductionPercentage;
    private Integer targetYear;
}
