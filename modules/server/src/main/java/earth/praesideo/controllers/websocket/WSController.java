package earth.praesideo.controllers.websocket;

import earth.praesideo.models.restapi.CompanyGeneralBackgroundModel;
import earth.praesideo.models.restapi.auth.FinancialInfoApiModel;
import earth.praesideo.models.restapi.datasets.DataSetClimateMechanismsInfluenceModel;
import earth.praesideo.models.restapi.datasets.DataSetEmissionsReductionModel;
import earth.praesideo.models.restapi.datasets.DataSetGhgInventoryMethodModel;
import earth.praesideo.models.restapi.datasets.DataSetRecentYearEmissionsModel;
import earth.praesideo.models.restapi.upload.UploadFileInfoRequestModel;
import earth.praesideo.services.websocket.WebSocketStoreService;
import earth.praesideo.websocket.WSDestinations;
import io.swagger.annotations.Api;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;

import java.security.Principal;

/**
 * @author Koshman Vadim
 */
@Api(value = "Socket controller")
@Controller
public class WSController {

    private final SimpMessagingTemplate messagingTemplate;
    private final WebSocketStoreService webSocketStoreService;

    public WSController(SimpMessagingTemplate messagingTemplate, WebSocketStoreService webSocketStoreService) {
        this.messagingTemplate = messagingTemplate;
        this.webSocketStoreService = webSocketStoreService;
    }

    @MessageMapping("/general-background")
    public void message(Principal user, @Payload CompanyGeneralBackgroundModel req) {
        messagingTemplate.convertAndSend(WSDestinations.COMMON_TOPIC_PATH + WSDestinations.COMMON_GENERAL_BACKGROUND_PATH + "/" + webSocketStoreService.getCompanyIdByUserName(user.getName()), req);
    }

    @MessageMapping("/financial-information")
    public void message(Principal user, @Payload FinancialInfoApiModel req) {
        messagingTemplate.convertAndSend(WSDestinations.COMMON_TOPIC_PATH + WSDestinations.COMMON_FINANCIAL_INFORMATION_PATH + "/" + webSocketStoreService.getCompanyIdByUserName(user.getName()), req);
    }

    @MessageMapping("/ghg-inventory")
    public void message(Principal user, @Payload DataSetGhgInventoryMethodModel req) {
        messagingTemplate.convertAndSend(WSDestinations.COMMON_TOPIC_PATH + WSDestinations.COMMON_GHG_INVENTORY_PATH + "/" + webSocketStoreService.getCompanyIdByUserName(user.getName()), req);
    }

    @MessageMapping("/inventory-emission")
    public void message(Principal user, @Payload DataSetRecentYearEmissionsModel req) {
        messagingTemplate.convertAndSend(WSDestinations.COMMON_TOPIC_PATH + WSDestinations.COMMON_INVENTORY_EMISSION_PATH + "/" + webSocketStoreService.getCompanyIdByUserName(user.getName()), req);
    }

    @MessageMapping("/emissions-reduction-target")
    public void message(Principal user, @Payload DataSetEmissionsReductionModel req) {
        messagingTemplate.convertAndSend(WSDestinations.COMMON_TOPIC_PATH + WSDestinations.COMMON_EMISSION_REDUCTION_TARGET_PATH + "/" + webSocketStoreService.getCompanyIdByUserName(user.getName()), req);
    }

    @MessageMapping("/climate-metric")
    public void message(Principal user, @Payload DataSetClimateMechanismsInfluenceModel req) {
        messagingTemplate.convertAndSend(WSDestinations.COMMON_TOPIC_PATH + WSDestinations.COMMON_CLIMATE_METRIC_PATH + "/" + webSocketStoreService.getCompanyIdByUserName(user.getName()), req);
    }

    @MessageMapping("/document-upload")
    public void message(Principal user, @Payload UploadFileInfoRequestModel req) {
        messagingTemplate.convertAndSend(WSDestinations.COMMON_TOPIC_PATH + WSDestinations.COMMON_DOCUMENT_UPLOAD_PATH + "/" + webSocketStoreService.getCompanyIdByUserName(user.getName()), req);
    }


}
