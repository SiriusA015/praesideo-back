package earth.praesideo.database.entities.common;

import lombok.Data;
import lombok.experimental.Accessors;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "t_ref_fx", schema = "static")
@Data
@Accessors(chain = true)
public class RefFx {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @ManyToOne
    @JoinColumn(name = "currencyId")
    private BaseCurrencyEntity baseCurrencyEntity;

    private Double rate;

    private Date date;
}
