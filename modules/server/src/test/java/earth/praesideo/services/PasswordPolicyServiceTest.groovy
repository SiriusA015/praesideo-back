package earth.praesideo.services

import earth.praesideo.services.policy.PasswordPolicyService
import org.junit.jupiter.api.Test
import org.junit.jupiter.api.extension.ExtendWith
import org.mockito.InjectMocks
import org.mockito.junit.jupiter.MockitoExtension

import static org.junit.jupiter.api.Assertions.assertEquals

/**
 * @author Koshman Vadim
 */

@ExtendWith(MockitoExtension.class)
class PasswordPolicyServiceTest {
    @InjectMocks
    private PasswordPolicyService passwordPolicyService

    @Test
    void validityPasswordPattern_shouldReturnTrue(){
        def result = passwordPolicyService.validityPasswordPattern("123#aZ23")
        assertEquals(result, true)
    }
}
