package earth.praesideo.database.entities.common;

import lombok.Data;

import javax.persistence.*;

@Entity
@Table(name = "t_ref_purchase_credit_categories", schema = "static")
@Data
public class PurchaseCreditCategoriesEntity {
    @Id
    private Integer purchaseCreditCategoriesId;
    private String name;
}
