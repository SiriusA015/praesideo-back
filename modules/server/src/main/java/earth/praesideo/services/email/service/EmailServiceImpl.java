package earth.praesideo.services.email.service;

import earth.praesideo.database.entities.tech.AppLogType;
import earth.praesideo.exceptions.EmailException;
import earth.praesideo.services.tech.AppLogService;
import earth.praesideo.services.template.AbstractEmailTemplate;
import earth.praesideo.utils.UrlGenerator;
import lombok.Getter;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;
import org.thymeleaf.TemplateEngine;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import static java.nio.charset.StandardCharsets.UTF_8;

/**
 * @author Koshman Vadim
 */

@Slf4j
@Service
@Getter
public class EmailServiceImpl {

    private final JavaMailSender javaMailSender;
    private final TemplateEngine templateEngine;
    private final AppLogService appLogService;
    private final UrlGenerator urlGenerator;

    @Autowired
    public EmailServiceImpl(JavaMailSender javaMailSender, TemplateEngine templateEngine, AppLogService appLogService, UrlGenerator urlGenerator) {
        this.javaMailSender = javaMailSender;
        this.templateEngine = templateEngine;
        this.appLogService = appLogService;
        this.urlGenerator = urlGenerator;
    }

    @Async
    public void sendEmail(String to, String subject, AbstractEmailTemplate template, AppLogType appLogType) {
        try {
            MimeMessagePreparator mimeMessagePreparator = mimeMessage -> {
                MimeMessageHelper messageHelper = createMessageHelper(subject, template, mimeMessage);
                messageHelper.setTo(to);
                messageHelper.setFrom(urlGenerator.getHostEmail());
            };
            javaMailSender.send(mimeMessagePreparator);
            appLogService.addSuccessfulEmailRegistrationLog(to, appLogType);
        } catch (Exception e) {
            appLogService.addFailedEmailRegistrationLog(e.getMessage(), to, appLogType);
            if(e.getMessage().contains("550")){
                throw new EmailException(e.getMessage(),HttpStatus.BAD_REQUEST);
            }
            throw new EmailException(e.getMessage(),HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @Async
    public void sendEmailBulk(String[] to, String[] cc, String subject, AbstractEmailTemplate template, AppLogType appLogType) {
        try {
            MimeMessagePreparator mimeMessagePreparator = mimeMessage -> {
                MimeMessageHelper messageHelper = createMessageHelper(subject, template, mimeMessage);
                messageHelper.setTo(to);
                messageHelper.setCc(cc);
                messageHelper.setFrom(urlGenerator.getHostEmail());
            };
            javaMailSender.send(mimeMessagePreparator);
//            appLogService.addSuccessfulEmailRegistrationLog(to, appLogType);
        } catch (Exception e) {
//            appLogService.addFailedEmailRegistrationLog(e.getMessage(), to, appLogType);
            if(e.getMessage().contains("550")){
                throw new EmailException(e.getMessage(),HttpStatus.BAD_REQUEST);
            }
            throw new EmailException(e.getMessage(),HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }


    private MimeMessageHelper createMessageHelper(String subject, AbstractEmailTemplate template, MimeMessage mimeMessage) throws MessagingException {
        MimeMessageHelper messageHelper = new MimeMessageHelper(mimeMessage, true, UTF_8.name());
        messageHelper.setSubject(subject);
        String content = templateEngine.process(template.getHtmlForm(), template.getContext());
        messageHelper.setText(content, true);
        return messageHelper;
    }


}
