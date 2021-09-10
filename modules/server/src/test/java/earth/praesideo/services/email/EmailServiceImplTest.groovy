package earth.praesideo.services.email

import earth.praesideo.exceptions.EmailException
import earth.praesideo.services.email.service.EmailServiceImpl
import earth.praesideo.services.tech.AppLogService
import earth.praesideo.services.template.EmailTemplate
import org.junit.jupiter.api.Test
import org.junit.jupiter.api.extension.ExtendWith
import org.mockito.InjectMocks
import org.mockito.Mock
import org.mockito.junit.jupiter.MockitoExtension
import org.springframework.mail.javamail.JavaMailSender
import org.springframework.mail.javamail.MimeMessagePreparator

import static org.junit.jupiter.api.Assertions.assertNotNull
import static org.mockito.ArgumentMatchers.any
import static org.mockito.ArgumentMatchers.anyString
import static org.mockito.ArgumentMatchers.eq
import static org.mockito.Mockito.verify
import static org.mockito.Mockito.when

@ExtendWith(MockitoExtension.class)
class EmailServiceImplTest {

    @InjectMocks
    private EmailServiceImpl emailService
    @Mock
    private JavaMailSender javaMailSender
    @Mock
    private AppLogService appLogService

    @Test
    void sendEmail_shouldThrowException_whenEmailServerIsDown() {
        def email = "test@tes.com"

        EmailTemplate template = new EmailTemplate("");
        template.setLink("localhost"
                + "/activate-account/"
                + "")

        when(javaMailSender.send(any(MimeMessagePreparator))).thenThrow(new RuntimeException("error"))

        try {
            emailService.sendEmail(email, "New account register", template)
        } catch (EmailException expected) {
            assertNotNull expected
        }
        verify(javaMailSender).send(any(MimeMessagePreparator))
        verify(appLogService).addFailedEmailRegistrationLog(anyString(), eq(email))
    }

    @Test
    void sendEmail_shouldSendEmail_whenEmailServerIsUp() {
        def email = "test@tes.com"

        EmailTemplate template = new EmailTemplate("");
        template.setLink("localhost"
                + "/activate-account/"
                + "")

        emailService.sendEmail(email, "New account register", template)

        verify(javaMailSender).send(any(MimeMessagePreparator))
        verify(appLogService).addSuccessfulEmailRegistrationLog(email)
    }
}
