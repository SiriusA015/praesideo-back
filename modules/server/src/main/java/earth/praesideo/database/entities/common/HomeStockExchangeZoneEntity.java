package earth.praesideo.database.entities.common;

import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import java.util.List;

@Entity
@Table(name = "t_ref_stock_exchange_zone", schema = "static")
@Data
public class HomeStockExchangeZoneEntity {
    @Id
    private Integer homeStockExchangeZoneId;
    private String name;

    @OneToMany(mappedBy = "homeStockExchangeZone")
    private List<HomeStockExchangeEntity> homeStockExchanges;
}
