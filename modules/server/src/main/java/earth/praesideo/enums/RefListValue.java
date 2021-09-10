package earth.praesideo.enums;

import lombok.AllArgsConstructor;
import lombok.Getter;

@AllArgsConstructor
@Getter
public enum RefListValue {
    INVOICE_STATUS_NEW("New"),
    INVOICE_STATUS_PAID("Paid"),
    INVOICE_STATUS_CANCELLED("Cancelled"),
    INVOICE_TYPE_YEARLY_SUBSCRIPTION("Yearly Subscription"),
    INVOICE_TYPE_YEARLY_SUPPLY_CHAIN_USAGE("Yearly supply chain usage"),
    INVOICE_TYPE_YEARLY_PLATFORM_API_USAGE("Yearly platform API usage"),
    INVOICE_ITEM_TYPE_ITEM("Item"),
    INVOICE_ITEM_TYPE_DISCOUNT("discount"),
    INVOICE_ITEM_TYPE_SUBTOTAL("Subtotal"),
    INVOICE_ITEM_TYPE_TOTAL("Total"),
    INVOICE_ITEM_TYPE_VAT("VAT");;

    private final String value;
}
