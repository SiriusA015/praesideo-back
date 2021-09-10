package earth.praesideo.database.entities.common;

import lombok.Data;

import javax.persistence.*;

@Entity
@Table(name = "t_ref_base_currency", schema = "static")
@Data
public class BaseCurrencyEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer baseCurrencyId;
    private String currency;
    private String code;
    private String symbol;
    private Double conversionRate;
    /**
     * Used for ordering of the values according to customer needs
     */
    @Column(columnDefinition = "integer default 99")
    private Integer ordering;
}
