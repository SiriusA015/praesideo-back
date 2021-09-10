package earth.praesideo.enums;

import lombok.AllArgsConstructor;
import lombok.Getter;

@AllArgsConstructor
@Getter
public enum RefListKey {
    IMPACTM_REFRIGERATOR_TYPE("impactm_refrigerator_type"),
    IMPACTM_EXTINGUISHER_TYPE("impactm_extinguisher_type"),
    INVOICE_STATUS("Invoice_Status"),
    INVOICE_TYPE("Invoice_Type"),
    INVOICE_ITEM_TYPE("invoice_item_type"),
    PRAESIDEO_DEMO_COMPANY_ID("praesideo_demo_company_id");

    private final String value;
}
