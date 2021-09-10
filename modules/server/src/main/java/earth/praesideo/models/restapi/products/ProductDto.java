package earth.praesideo.models.restapi.products;

import lombok.Data;

import java.util.List;

@Data
public class ProductDto {

    private Integer id;

    private String name;

    private String description;

    private Boolean active;

    private List<ProductVariantDto> variants;
}
