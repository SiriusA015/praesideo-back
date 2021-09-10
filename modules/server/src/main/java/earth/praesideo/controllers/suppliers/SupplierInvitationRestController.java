package earth.praesideo.controllers.suppliers;

import earth.praesideo.controllers.BaseController;
import earth.praesideo.database.entities.suppliers.InvitationStatus;
import earth.praesideo.database.entities.suppliers.SupplyChain;
import earth.praesideo.exceptions.ApiException;
import earth.praesideo.exceptions.ExceptionContent;
import earth.praesideo.models.restapi.suppliers.InvitationInfoDto;
import earth.praesideo.services.InvitationService;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author Koshman Vadim
 */
import earth.praesideo.models.restapi.suppliers.InviteSupplyChainDto;
import earth.praesideo.models.restapi.suppliers.SupplierAllocationDto;
import earth.praesideo.models.restapi.suppliers.SupplyChainDto;
import earth.praesideo.services.SuppliersService;
import org.modelmapper.ModelMapper;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.*;
import java.util.stream.Collectors;

/**
 * @author Koshman Vadim
 */
@AllArgsConstructor
@RestController
@RequestMapping("/api/suppliers/invitation")
public class SupplierInvitationRestController extends BaseController {
    private final InvitationService invitationService;
    private final SuppliersService suppliersService;
    private final ModelMapper mapper;

    @GetMapping("/chain")
    public ResponseEntity<Page<SupplyChainDto>> getUserSuppliersByRepresentationYear(
            @RequestParam(name = "companyId") Integer companyId,
            @RequestParam(name = "yearRepresentationId", required = false) Optional<Integer> yearRepresentationId,
            final Pageable pageable) {
        Page<SupplyChain> suppliers;
        if (yearRepresentationId.isPresent()) {
            suppliers = suppliersService.getSupplyByCustomerCompanyIdAndYearAndDateInvitationPage(companyId, yearRepresentationId.get(), pageable);
        } else {
            suppliers = suppliersService.getSupplyByCustomerCompanyIdAndDateInvitationPage(companyId, pageable);
        }

        Page<SupplyChainDto> supplyChains = suppliers.map(entity -> {
                    SupplyChainDto supplyChainDto = mapper.map(entity, SupplyChainDto.class);
                    List<SupplierAllocationDto> supplierAllocationDtoList = suppliersService.getSupplierAllocationsBySupplyChain(supplyChainDto.getSupplyChainId())
                            .stream()
                            .map(allocation -> mapper.map(allocation, SupplierAllocationDto.class))
                            .collect(Collectors.toList());

                    return suppliersService.getSupplyChainDtoInvitationDashboard(supplierAllocationDtoList, supplyChainDto);
                });
        return ResponseEntity.ok(supplyChains);
    }

    @PostMapping("/chain/{supplierChainId}")
    public ResponseEntity<Void> setInvitationEmail(@RequestBody InviteSupplyChainDto request,
                                                   @PathVariable("supplierChainId") Integer supplierChainId) {
        invitationService.setSupplierInvitationEmail(request.getEmail(), supplierChainId);
        return new ResponseEntity<>(HttpStatus.OK);
    }

    @GetMapping("/chain/info/{supplyChainId}")
    public ResponseEntity<InvitationInfoDto> getInvitationInfo(@PathVariable("supplyChainId") Integer supplyChainId) {
        var user = getLoggedInUser().orElseThrow(() -> new ApiException(ExceptionContent.USER_NOT_FOUND, HttpStatus.BAD_REQUEST));
        return ResponseEntity.ok(invitationService.getInvitationInfo(user, supplyChainId));
    }

    @GetMapping("/chain/available/suppliers")
    public ResponseEntity<List<InviteSupplyChainDto>> getAvailableSuppliers() {
        var user = getLoggedInUser().orElseThrow(() -> new ApiException(ExceptionContent.USER_NOT_FOUND, HttpStatus.BAD_REQUEST));
        return ResponseEntity.ok(suppliersService.findAllSuppliersByInvitationStatus(user.getCompanyId(), InvitationStatus.PENDING.getValue())
                .stream()
                .map(entity -> mapper.map(entity, SupplyChainDto.class))
                .map(supplyChainDto -> InviteSupplyChainDto.builder()
                        .supplyChainId(supplyChainDto.getSupplyChainId())
                        .supplierId(supplyChainDto.getSupplier().getCompanyId())
                        .email(supplyChainDto.getSupplierContactEmail())
                        .name(supplyChainDto.getSupplier().getCompanyName())
                        .build())
                .collect(Collectors.toList()));
    }

    @PostMapping("/send")
    public ResponseEntity<Void> sendInvitation(@RequestBody InvitationInfoDto request) {
        invitationService.sendInvitation(request);
        return new ResponseEntity<>(HttpStatus.OK);
    }
}

