package earth.praesideo.services.policy;

import org.springframework.stereotype.Service;

/**
 * @author Koshman Vadim
 */

@Service
public class PasswordPolicyService {
    /*(?=.*[0-9])       # a digit must occur at least once
     (?=.*[a-z])       # a lower case letter must occur at least once
     (?=.*[A-Z])       # an upper case letter must occur at least once
     (?=.*[@#$%^&+=])  # a special character must occur at least once
     (?=\S+$)          # no whitespace allowed in the entire string
     .{8,}             # anything, at least eight places though*/
    private static final String PASSWORD_REGEX = "(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=*!?/])(?=\\S+$).{8,}";

    public boolean validityPasswordPattern(String expectedPassword) {
        return expectedPassword.matches(PASSWORD_REGEX);
    }
}
