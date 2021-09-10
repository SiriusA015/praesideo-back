package earth.praesideo.database.entities.common;

import lombok.Data;

import javax.persistence.*;

@Entity
@Table(name = "t_ref_purchase_credit_category_type", schema = "static")
@Data
public class PurchaseCreditCategoryTypeEntity {
    @Id
    private Integer purchaseCreditCategoryTypeId;
    private String name;
}
