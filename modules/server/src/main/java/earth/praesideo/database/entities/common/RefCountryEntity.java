package earth.praesideo.database.entities.common;

import lombok.Getter;
import lombok.Setter;
import lombok.experimental.Accessors;

import javax.persistence.*;

@Entity
@Table(name = "t_ref_countries", schema = "static")
@Getter
@Setter
@Accessors(chain = true)
public class RefCountryEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private String country;
    private Integer regionId;
}
