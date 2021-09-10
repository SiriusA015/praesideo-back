package earth.praesideo.controllers.suppliers;

import earth.praesideo.controllers.BaseController;
import earth.praesideo.models.restapi.suppliers.SuppliersDictionaryDto;
import earth.praesideo.services.SuppliersService;
import lombok.AllArgsConstructor;
import org.modelmapper.ModelMapper;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.stream.Collectors;

@AllArgsConstructor
@RestController
@RequestMapping("/api/suppliers/dictionaries")
public class SuppliersDictionariesRestController extends BaseController {

    private final SuppliersService service;
    private final ModelMapper      mapper;

    @GetMapping("/categories")
    public ResponseEntity<List<SuppliersDictionaryDto>> getSupplierCategories() {
        return ResponseEntity.ok(
                service.getSupplierCategories().stream()
                        .map(category -> mapper.map(category, SuppliersDictionaryDto.class))
                        .collect(Collectors.toList())
        );
    }

    @GetMapping("/types")
    public ResponseEntity<List<SuppliersDictionaryDto>> getSupplierTypes() {
        return ResponseEntity.ok(
                service.getSupplierTypes().stream()
                        .map(type -> mapper.map(type, SuppliersDictionaryDto.class))
                        .collect(Collectors.toList())
        );
    }

    @GetMapping("/invitation_statuses")
    public ResponseEntity<List<SuppliersDictionaryDto>> getSupplierInvitationStatuses() {
        return ResponseEntity.ok(
                service.getSupplierInvitationStatuses().stream()
                        .map(status -> mapper.map(status, SuppliersDictionaryDto.class))
                        .collect(Collectors.toList())
        );
    }
}
