package earth.praesideo.utils;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
public class UserUtils {
    private static final Logger LOGGER = LoggerFactory.getLogger(UserUtils.class);

    private final PasswordEncoder passwordEncoder;

    public UserUtils(PasswordEncoder passwordEncoder) {
        LOGGER.info(this.getClass().getSimpleName()+" created.");
        this.passwordEncoder = passwordEncoder;
    }

    public List<GrantedAuthority> getGrantedAuthorities(List<String> privileges) {
        List<GrantedAuthority> grantedAuthorities = new ArrayList<>();
        for(String privilege : privileges) {
            grantedAuthorities.add(new SimpleGrantedAuthority(privilege));
        }
        return grantedAuthorities;
    }

    public String encodePassword(String password) {
        return passwordEncoder.encode(password);
    }

}
