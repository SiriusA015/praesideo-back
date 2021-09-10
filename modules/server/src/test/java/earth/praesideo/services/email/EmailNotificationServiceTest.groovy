package earth.praesideo.services.email

import earth.praesideo.models.restapi.internal.AccountCreatedInternalModel
import earth.praesideo.services.email.factory.EmailFactory
import earth.praesideo.services.email.service.EmailServiceImpl
import earth.praesideo.services.template.EmailTemplate
import earth.praesideo.utils.MessageType
import earth.praesideo.utils.NotificationUtil
import earth.praesideo.utils.UrlGenerator
import org.junit.jupiter.api.Test
import org.junit.jupiter.api.extension.ExtendWith
import org.mockito.InjectMocks
import org.mockito.Mock
import org.mockito.junit.jupiter.MockitoExtension

import static org.mockito.Mockito.when

@ExtendWith(MockitoExtension.class)
class EmailNotificationServiceTest {

    @InjectMocks
    private EmailNotificationService emailNotificationService
    @Mock
    private  EmailFactory emailFactory;
    @Mock
    private  EmailServiceImpl emailService;
    @Mock
    private  UrlGenerator urlGenerator;
    @Mock
    private  NotificationUtil notificationUtil;

    @Test
    void onApplicationEvent_shouldSendEmail_whenReceiveAnEvent() {
        def email = "test@test.com"
        def accountCreatedInternalModel = new AccountCreatedInternalModel(this, email, "");

        when(emailFactory.getAccountVerifiedTemplate()).thenReturn(new EmailTemplate(""))
        when(urlGenerator.getBaseUrl()).thenReturn("")

        Map<Locale, NotificationUtil.Message> map = new HashMap<>()
        map.put(Locale.ENGLISH, new NotificationUtil.Message())
        when(notificationUtil.getByType(MessageType.VERIFY_EMAIL)).thenReturn(map)

        emailNotificationService.onApplicationEvent(accountCreatedInternalModel)
    }

}
