package earth.praesideo.controllers.websocket.listeners;

import earth.praesideo.services.websocket.WebSocketStoreService;
import lombok.extern.log4j.Log4j2;
import org.springframework.context.ApplicationListener;

import org.springframework.messaging.simp.stomp.StompHeaderAccessor;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.messaging.SessionDisconnectEvent;


@Component
@Log4j2
public class StompDisconnectEventListener implements ApplicationListener<SessionDisconnectEvent> {

    private final WebSocketStoreService webSocketStoreService;

    public StompDisconnectEventListener(WebSocketStoreService webSocketStoreService) {
        this.webSocketStoreService = webSocketStoreService;
    }

    @Override
    public void onApplicationEvent(SessionDisconnectEvent event) {
        StompHeaderAccessor headerAccessor = StompHeaderAccessor.wrap(event.getMessage());
        webSocketStoreService.removeListeners(headerAccessor.getSessionId());
        log.info("User with name {} has been disconnected {}", event.getUser().getName(), headerAccessor);
    }


}