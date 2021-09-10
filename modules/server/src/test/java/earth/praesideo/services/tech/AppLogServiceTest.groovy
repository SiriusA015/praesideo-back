package earth.praesideo.services.tech

import earth.praesideo.database.entities.tech.AppLogEntity
import earth.praesideo.database.repositories.tech.AppLogRepository
import org.junit.jupiter.api.Test
import org.junit.jupiter.api.extension.ExtendWith
import org.mockito.InjectMocks
import org.mockito.Mock
import org.mockito.junit.jupiter.MockitoExtension

import static org.mockito.ArgumentMatchers.any
import static org.mockito.Mockito.verify

@ExtendWith(MockitoExtension.class)
class AppLogServiceTest {

    @Mock
    private AppLogRepository repository

    @InjectMocks
    private AppLogService service

    @Test
    void addSuccessfulEmailRegistrationLog_shouldAddLog_whenDataIsProvided() {
        service.addSuccessfulEmailRegistrationLog("test@test.com")

        verify(repository).save(any(AppLogEntity))
    }

    @Test
    void addFailedEmailRegistrationLog_shouldAddLog_whenDataIsProvided() {
        service.addFailedEmailRegistrationLog("Error", "test@test.com")

        verify(repository).save(any(AppLogEntity))
    }

}
