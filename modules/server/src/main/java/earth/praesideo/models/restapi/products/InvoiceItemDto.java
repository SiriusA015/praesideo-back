package earth.praesideo.models.restapi.products;

import lombok.Data;
import java.math.BigDecimal;

@Data
public class InvoiceItemDto {
    private Integer id;
    private String invoiceItemText;
    private String invoiceItemCurrency;
    private BigDecimal invoiceItemAmount;
    private String invoiceItemType;
    private Integer invoiceItemSequence;
    private String invoiceItemDisplayAmount;
}
