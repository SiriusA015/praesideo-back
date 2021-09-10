package earth.praesideo.controllers.suppliers;

import earth.praesideo.controllers.BaseController;
import earth.praesideo.database.entities.common.YearRepresentationEntity;
import earth.praesideo.database.entities.suppliers.SupplierAllocation;
import earth.praesideo.database.entities.suppliers.SupplierStatus;
import earth.praesideo.exceptions.*;
import earth.praesideo.models.restapi.suppliers.*;
import earth.praesideo.services.SuppliersService;
import earth.praesideo.database.entities.suppliers.ClassificationStatus;
import lombok.AllArgsConstructor;
import org.modelmapper.ModelMapper;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Objects;
import java.util.Set;
import java.util.stream.Collectors;

@AllArgsConstructor
@RestController
@RequestMapping("/api/suppliers")
public class SuppliersRestController extends BaseController {

    private final SuppliersService service;
    private final ModelMapper mapper;

    @GetMapping("/year-representation/list")
    public ResponseEntity<List<YearRepresentationEntity>> getYearRepresentations(@RequestParam(name = "companyId") Integer companyId) {
        return ResponseEntity.ok(service.getYearRepresentations(companyId));
    }

    @GetMapping("/select")
    public ResponseEntity<List<CompanySupplierDto>> selectSuppliers(
            @RequestParam(name = "query", required = false, defaultValue = "") String query) {
        var user = getLoggedInUser().orElseThrow(() -> new ApiException(ExceptionContent.USER_NOT_FOUND, HttpStatus.BAD_REQUEST));
        return ResponseEntity.ok(service.selectSuppliers(query, user)
                .stream()
                .map(companyEntity -> mapper.map(companyEntity, CompanySupplierDto.class))
                .collect(Collectors.toList()));
    }

    @PostMapping
    public ResponseEntity<Void> addSupplier(@RequestBody AddSupplyChainDto supplierData) {
        var user = getLoggedInUser().orElseThrow(() -> new ApiException(ExceptionContent.USER_NOT_FOUND, HttpStatus.BAD_REQUEST));
        if (supplierData.getSupplierId() != null) {
            service.addSupplyChain(
                    supplierData.getSupplierId(),
                    supplierData.getYearRepresentationId(),
                    supplierData.getStartMonth(),
                    supplierData.getIsFinancialYear(),
                    user
            );
        } else {
            service.addSupplyChain(
                    supplierData.getCompanyName(),
                    supplierData.getYearRepresentationId(),
                    supplierData.getStartMonth(),
                    supplierData.getIsFinancialYear(),
                    user
            );
        }
        return new ResponseEntity<>(HttpStatus.CREATED);
    }

    @GetMapping("/chain")
    public ResponseEntity<Page<SupplyChainDto>> getUserSuppliersByRepresentationYear(
            @RequestParam(name = "companyId") Integer companyId,
            @RequestParam(name = "yearRepresentationId") Integer yearRepresentationId, final Pageable pageable) {
        return ResponseEntity.ok(service.getSupplyChainsByRepresentationYearAndUser(companyId, yearRepresentationId, pageable)
                .map(entity -> {
                    SupplyChainDto supplyChainDto = mapper.map(entity, SupplyChainDto.class);
                    supplyChainDto.getSupplier().setStatus(service.ifCompanyStatusSupplier(supplyChainDto.getSupplier().getCompanyId()) ? SupplierStatus.AVAILABLE.name() : SupplierStatus.ONBOARD_ME.name());
                    return supplyChainDto;
                }));
    }

    @DeleteMapping("/chain/{supplyChainId}")
    public ResponseEntity<Void> deleteSupplier(@PathVariable("supplyChainId") Integer supplyChainId) {
        var user = getLoggedInUser().orElseThrow(() -> new ApiException(ExceptionContent.USER_NOT_FOUND, HttpStatus.BAD_REQUEST));
        service.deleteSupplyChain(supplyChainId, user);
        return new ResponseEntity<>(HttpStatus.OK);
    }

    @DeleteMapping("/chain/{supplyAllocationId}/allocation")
    public ResponseEntity<Void> deleteSupplierAllocation(@PathVariable("supplyAllocationId") Integer supplyAllocationId) {
        var user = getLoggedInUser().orElseThrow(() -> new ApiException(ExceptionContent.USER_NOT_FOUND, HttpStatus.BAD_REQUEST));
        service.deleteSupplyAllocation(supplyAllocationId, user);
        return new ResponseEntity<>(HttpStatus.OK);
    }

    @GetMapping("/chain/{supplyChainId}/allocation")
    public ResponseEntity<SupplierAggregatedAllocationDto> getSupplierAllocationsBySupplyChain(@PathVariable("supplyChainId") Integer supplyChainId) {
        //TODO Refactor in future
        List<SupplierAllocationDto> supplierAllocationDtoList = service.getSupplierAllocationsBySupplyChain(supplyChainId)
                .stream()
                .map(entity -> mapper.map(entity, SupplierAllocationDto.class))
                .collect(Collectors.toList());

        if (supplierAllocationDtoList.isEmpty()) {
            return ResponseEntity.ok(null);
        }
        Set<Integer> setTypeIds = supplierAllocationDtoList
                .stream()
                .map(SupplierAllocationDto::getSupplierTypeId)
                .filter(Objects::nonNull)
                .collect(Collectors.toSet());

        Set<Integer> setCategoryIds = supplierAllocationDtoList
                .stream()
                .map(SupplierAllocationDto::getSupplierCategoryId)
                .filter(Objects::nonNull)
                .collect(Collectors.toSet());

        Set<Integer> setCurrencyIds = supplierAllocationDtoList
                .stream()
                .map(SupplierAllocationDto::getSupplierCurrencyId)
                .filter(Objects::nonNull)
                .collect(Collectors.toSet());
        //use BigDecimal in future
        double amount = supplierAllocationDtoList
                .stream()
                .filter(f -> f.getSupplierAmount() != null)
                .mapToDouble(SupplierAllocationDto::getSupplierAmount)
                .sum();

        ClassificationStatus status = ClassificationStatus.COMPLETE;

        for (SupplierAllocationDto s : supplierAllocationDtoList){
            if (s.getSupplierTypeId() == null || s.getSupplierAmount() == null || s.getSupplierCategoryId() == null || s.getSupplierCurrencyId() == null){
                status = ClassificationStatus.INCOMPLETE;
                break;
            }
        }

        String averageTypeId = "";
        String averageCategoryId = "";
        String averageCurrencyId = "";

        if (setTypeIds.size() != 0) {
            averageTypeId = setTypeIds.size() > 1 ? "Multiple" : setTypeIds.stream().findFirst().get().toString();
        }

        if (setCategoryIds.size() != 0) {
            averageCategoryId = setCategoryIds.size() > 1 ? "Multiple" : setCategoryIds.stream().findFirst().get().toString();
        }

        if (setCurrencyIds.size() != 0) {
            averageCurrencyId = setCurrencyIds.size() > 1 ? "Multiple" : setCurrencyIds.stream().findFirst().get().toString();
        }

        return ResponseEntity.ok(SupplierAggregatedAllocationDto.builder()
                .allocations(supplierAllocationDtoList)
                .averageTypeId(averageTypeId)
                .averageCategoryId(averageCategoryId)
                .averageCurrencyId(averageCurrencyId)
                .status(status)
                .sumAmount(amount)
                .build());
    }

    @PostMapping("/chain/{supplyChainId}/allocation")
    public ResponseEntity<List<SupplierAllocationDto>> addSupplierAllocationBySupplyChain(@PathVariable("supplyChainId") Integer supplyChainId,
                                                                                          @RequestBody SupplierAllocationDto dto) {
        service.addSupplierAllocation(supplyChainId, mapper.map(dto, SupplierAllocation.class));
        return new ResponseEntity<>(HttpStatus.OK);
    }

    @PostMapping("/chain/update/allocation")
    public ResponseEntity<Void> updateSupplierAllocation(@RequestBody SupplierAllocationDto dto) {
        service.updateSupplierAllocation(mapper.map(dto, SupplierAllocation.class));
        return new ResponseEntity<>(HttpStatus.OK);
    }
}
