package earth.praesideo.database.entities.common;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.Where;

import javax.persistence.MappedSuperclass;
import javax.validation.constraints.Size;
import java.util.Date;

@EqualsAndHashCode(callSuper = true)
@Data
@NoArgsConstructor
@AllArgsConstructor
@MappedSuperclass
@Where(clause = "date_removed is null")
public abstract class BaseRemoveListenedEntity extends BaseModifyListenedEntity {

    private Date dateRemoved;

    @Size(max = 100)
    private String removedBy;
}
