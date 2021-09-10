package earth.praesideo.websocket;

/**
 * @author Koshman Vadim
 */
public class WSDestinations {
    public static final String COMMON_STOMP_ENDPOINT = "/ws-stomp-common-endpoint";
    public static final String COMMON_TOPIC_PATH     = "/topic";
    public static final String COMMON_QUEUE_PATH     = "/queue";

    public static final String COMMON_GENERAL_BACKGROUND_PATH            = "/general-background/messages";
    public static final String COMMON_FINANCIAL_INFORMATION_PATH         = "/financial-information/messages";
    public static final String COMMON_GHG_INVENTORY_PATH                 = "/ghg-inventory/messages";
    public static final String COMMON_INVENTORY_EMISSION_PATH            = "/inventory-emission/messages";
    public static final String COMMON_EMISSION_REDUCTION_TARGET_PATH     = "/emission-reduction-target/messages";
    public static final String COMMON_CLIMATE_METRIC_PATH                = "/climate-metric/messages";
    public static final String COMMON_DOCUMENT_UPLOAD_PATH               = "/document-upload/messages";
}
