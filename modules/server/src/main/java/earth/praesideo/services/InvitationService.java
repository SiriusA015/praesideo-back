package earth.praesideo.services;

import earth.praesideo.database.entities.suppliers.InvitationStatus;
import earth.praesideo.database.entities.suppliers.SupplyChain;
import earth.praesideo.database.entities.users.CompanyEntity;
import earth.praesideo.database.repositories.suppliers.SupplierInvitationStatusRepository;
import earth.praesideo.database.repositories.suppliers.SupplyChainRepository;
import earth.praesideo.exceptions.ApiException;
import earth.praesideo.exceptions.ExceptionContent;
import earth.praesideo.models.restapi.internal.SupplierInvitationInternalModel;
import earth.praesideo.models.restapi.suppliers.InvitationInfoDto;
import earth.praesideo.models.restapi.suppliers.InviteSupplyChainDto;
import earth.praesideo.models.security.CustomUserDetailsModel;
import earth.praesideo.utils.InvitationUtil;
import earth.praesideo.utils.UrlGenerator;
import lombok.AllArgsConstructor;
import org.modelmapper.ModelMapper;
import org.springframework.context.ApplicationEventPublisher;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;

/**
 * @author Koshman Vadim
 */
@AllArgsConstructor
@Service
public class InvitationService {
    private final String CC_PRAESIDEO_NAME = "Praesideo";

    private final InvitationUtil invitationUtil;
    private final SupplyChainRepository supplyChainRepository;
    private final CompanyService companyService;
    private final SupplierInvitationStatusRepository supplierInvitationStatusRepository;
    private final ApplicationEventPublisher applicationEventPublisher;
    private final ModelMapper mapper;
    private final UrlGenerator urlGenerator;

    public void setSupplierInvitationEmail(final String email,
                                           final Integer supplierChainId) {
        var supplier = supplyChainRepository.findById(supplierChainId);
        supplier.ifPresent(supplyChain -> {
            supplyChain.setSupplierContactEmail(email);

            if (!email.isEmpty()) {
                var invitation = supplierInvitationStatusRepository.findByValue(InvitationStatus.INVITE_ME.name());
                supplyChain.setSupplierInvitationStatus(invitation);
            }
            else {
                supplyChain.setSupplierInvitationStatus(null);
            }
            supplyChainRepository.save(supplier.get());
        });
    }

    public void sendInvitation(InvitationInfoDto request) {
        var supplier = supplyChainRepository.findById(request.getTo().getSupplyChainId());
        String[] to = new String[]{request.getTo().getEmail()};

        String[] cc = request.getCc()
                .stream()
                .map(InviteSupplyChainDto::getEmail)
                .toArray(String[]::new);

        applicationEventPublisher.publishEvent(new SupplierInvitationInternalModel(this, to, cc, request.getSubject(), request.getBody()));


        supplier.ifPresent(supplyChain -> {
            supplyChain.setSupplierInvitationDate(new Date());
            var invitation = supplierInvitationStatusRepository.findByValue(InvitationStatus.INVITED.name());
            supplyChain.setSupplierInvitationStatus(invitation);
            supplyChainRepository.save(supplier.get());
        });
    }

    public InvitationInfoDto getInvitationInfo(CustomUserDetailsModel user, Integer supplyChainId) {
        SupplyChain supplyChain = supplyChainRepository.findById(supplyChainId)
                .orElseThrow(() -> new ApiException(ExceptionContent.COMPANY_NOT_FOUND, HttpStatus.NOT_FOUND));

        CompanyEntity company = companyService.getCompanyEntityById(user.getCompanyId());

        var content = invitationUtil.getPreparedContentByCompanyId(company, supplyChain);
        var invitationInfoDto = mapper.map(content, InvitationInfoDto.class);

        invitationInfoDto.setTo(InviteSupplyChainDto.builder()
                .supplyChainId(supplyChain.getSupplyChainId())
                .email(supplyChain.getSupplierContactEmail())
                .name(supplyChain.getSupplier().getCompanyName())
                .build());

        ArrayList<InviteSupplyChainDto> cc = new ArrayList<>() {
            {
                add(InviteSupplyChainDto.builder()
                        .email(user.getUsername())
                        .name(company.getCompanyName())
                        .build());

                add(InviteSupplyChainDto.builder()
                        .email(urlGenerator.getEmailPraesideo())
                        .name(CC_PRAESIDEO_NAME)
                        .build());
            }
        };
        invitationInfoDto.setCc(cc);
        return invitationInfoDto;
    }
}
