package earth.praesideo.controllers.websocket.listeners;

import earth.praesideo.services.websocket.WebSocketStoreService;
import lombok.extern.log4j.Log4j2;
import org.springframework.context.ApplicationListener;
import org.springframework.messaging.simp.stomp.StompHeaderAccessor;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.socket.messaging.SessionSubscribeEvent;

@Component
@Log4j2
public class StompSubscribeEventListener implements ApplicationListener<SessionSubscribeEvent> {

    private final WebSocketStoreService webSocketStoreService;

    public StompSubscribeEventListener(WebSocketStoreService webSocketStoreService) {
        this.webSocketStoreService = webSocketStoreService;
    }

    @Override
    @Transactional
    public void onApplicationEvent(SessionSubscribeEvent sessionSubscribeEvent) {
        StompHeaderAccessor headerAccessor = StompHeaderAccessor.wrap(sessionSubscribeEvent.getMessage());
        log.info("User with name  {} has been subscribed {}", sessionSubscribeEvent.getUser().getName(), headerAccessor);
        webSocketStoreService.addListeners(headerAccessor.getSessionId(), sessionSubscribeEvent.getUser().getName());
    }
}
