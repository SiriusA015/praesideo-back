package earth.praesideo.database.entities.datasets;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;

import javax.persistence.MappedSuperclass;
import java.sql.Timestamp;

@MappedSuperclass
@Data
public abstract class DataSetBaseEntity {
    @JsonIgnore
    private Timestamp insertedDate;
    @JsonIgnore
    private Timestamp updatedDate;

}
