package earth.praesideo.database.entities.common;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;

import javax.persistence.*;

@Entity
@Table(name = "t_ref_home_stock_exchange", schema = "static")
@Data
public class HomeStockExchangeEntity {
    @Id
    private Integer homeStockExchangeId;
    private String name;

    @JsonIgnore
    @ManyToOne
    @JoinColumn(name = "homeStockExchangeZoneId")
    private HomeStockExchangeZoneEntity homeStockExchangeZone;
}
