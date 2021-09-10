package earth.praesideo.database.entities.common;

import lombok.Data;

import javax.persistence.*;

@Entity
@Table(name = "t_app_data_text", schema = "tech")
@Data
public class CommonTextEntity extends BaseModifyListenedEntity{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    @Column(name="textkey")
    private String textKey;
    @Column(name="textvalue")
    private String textValue;
    @Column(name="culture")
    private String culture;
}
