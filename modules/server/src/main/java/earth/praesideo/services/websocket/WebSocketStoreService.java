package earth.praesideo.services.websocket;

import earth.praesideo.database.entities.users.UserEntity;
import earth.praesideo.database.repositories.users.UserRepository;
import lombok.extern.log4j.Log4j2;
import org.springframework.context.event.EventListener;
import org.springframework.stereotype.Service;
import org.springframework.web.socket.messaging.SessionDisconnectEvent;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/**
 * @author Koshman Vadim
 */
@Service
@Log4j2
public class WebSocketStoreService {
    private final UserRepository userRepository;

    private Map<String, String> listener = new ConcurrentHashMap<>(); //sessionId, userName
    private Map<String, Integer> companySubscribers = new ConcurrentHashMap<>(); // userName, companyId

    public WebSocketStoreService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }


    @EventListener
    public void sessionDisconnectionHandler(SessionDisconnectEvent event) {
        String sessionId = event.getSessionId();
        log.info("Disconnecting " + sessionId + "!");
        removeListeners(sessionId);
    }

    public void addListeners(String sessionId, String userName) {
        listener.put(sessionId, userName);

        UserEntity user = userRepository.findByUsernameIgnoreCase(userName);
        companySubscribers.put(userName, user.getCompany().getCompanyId());
    }

    public void removeListeners(String sessionId) {
        companySubscribers.remove(listener.get(sessionId));
        listener.remove(sessionId);
    }

    public Integer getCompanyIdByUserName(String userName){
        return companySubscribers.get(userName);
    }


}
