package earth.praesideo.models.restapi.products;

import lombok.Data;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

@Data
public class InvoiceDto {

    private Integer id;
    private String customer;
    private String address;
    private String subscription;
    private String periodFormatted;

    private String invoiceType;
    private String invoiceStatus;
    private String invoiceCurrency;
    private Date invoiceDate;
    private Date invoiceDueDate;
    private String invoiceDateFormatted;
    private String invoiceDueDateFormatted;
    private BigDecimal invoiceAmount;
    private String invoiceReference;
    private String invoiceAmountFormatted;
    private List<InvoiceItemDto> invoiceLineItems;
}
