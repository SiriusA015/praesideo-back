package earth.praesideo.services.websocket;

import org.junit.platform.commons.util.StringUtils;
import org.springframework.security.authentication.AuthenticationCredentialsNotFoundException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.stereotype.Service;

import java.util.Collections;

/**
 * @author Koshman Vadim
 */
@Service
public class WebSocketAuthenticatorService {

    public UsernamePasswordAuthenticationToken getAuthenticatedOrFail(final String username, final String authToken) throws AuthenticationException {

        if (StringUtils.isBlank(username)) {
            throw new AuthenticationCredentialsNotFoundException("Username is null or empty.");
        }
        if (StringUtils.isBlank(authToken)) {
            throw new AuthenticationCredentialsNotFoundException("Authentication token is null or empty.");
        }

        // Everything is fine, return an authenticated Authentication. (the constructor with grantedAuthorities auto set authenticated = true)
        // null credentials, we do not pass the password along to prevent security flaw
        return new UsernamePasswordAuthenticationToken(
                username,
                null,
                Collections.singleton((GrantedAuthority) () -> "USER")
        );
    }

}
