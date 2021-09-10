package earth.praesideo.controllers.websocket.interseptor;

import earth.praesideo.services.websocket.WebSocketAuthenticatorService;
import earth.praesideo.utils.JwtTokenUtil;
import org.springframework.messaging.Message;
import org.springframework.messaging.MessageChannel;
import org.springframework.messaging.simp.stomp.StompCommand;
import org.springframework.messaging.simp.stomp.StompHeaderAccessor;
import org.springframework.messaging.support.MessageHeaderAccessor;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.messaging.support.ChannelInterceptor;
import org.springframework.stereotype.Component;

import java.util.Optional;

/**
 * @author Koshman Vadim
 */
@Component
public class AuthChannelInterceptorAdapter implements ChannelInterceptor {

    private static final String                  AUTH_HEADER  = "Authorization";
    private static final String                  TOKEN_PREFIX = "Bearer ";
    private final WebSocketAuthenticatorService webSocketAuthenticatorService;
    private final JwtTokenUtil jwtTokenUtil;

    public AuthChannelInterceptorAdapter(WebSocketAuthenticatorService webSocketAuthenticatorService, JwtTokenUtil jwtTokenUtil) {
        this.webSocketAuthenticatorService = webSocketAuthenticatorService;
        this.jwtTokenUtil = jwtTokenUtil;
    }

    @Override
    public Message<?> preSend(final Message<?> message, final MessageChannel channel) throws AuthenticationException {
        final StompHeaderAccessor accessor = MessageHeaderAccessor.getAccessor(message, StompHeaderAccessor.class);

        if (StompCommand.CONNECT == accessor.getCommand()) {
            final String authToken = accessor.getFirstNativeHeader(AUTH_HEADER);
            String username = jwtTokenUtil.getUsernameFromToken(extractToken(authToken).get());
            final Authentication user = webSocketAuthenticatorService.getAuthenticatedOrFail(username, authToken);

            accessor.setUser(user);
        }

        return message;
    }

    private Optional<String> extractToken(String token) {
        return Optional.ofNullable(token)
                .filter(v -> v.startsWith(TOKEN_PREFIX))
                .map(v -> v.substring(TOKEN_PREFIX.length()));
    }

}
