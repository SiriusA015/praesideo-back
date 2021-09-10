package earth.praesideo.services;

import earth.praesideo.database.repositories.suppliers.SupplyChainRepository;
import earth.praesideo.models.restapi.impactperformance.PerformancePillar;
import earth.praesideo.models.restapi.traceperformance.*;
import earth.praesideo.models.security.CustomUserDetailsModel;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.Optional;

/**
 * @author Koshman Vadim
 */
@Service
public class TracePerformanceSupplyChaneService {
    private final SupplyChainRepository supplyChainRepository;
    private final ModelMapper modelMapper;

    @Autowired
    public TracePerformanceSupplyChaneService(SupplyChainRepository supplyChainRepository, ModelMapper modelMapper) {
        this.supplyChainRepository = supplyChainRepository;
        this.modelMapper = modelMapper;
    }

    public AvailableSuppliersInfoDto getAvailableSuppliers(final CustomUserDetailsModel user, Pageable pageable) {
        Page<AvailableSuppliers> suppliers = supplyChainRepository.findAvailableSuppliers(user.getCompanyId(), pageable);
        Optional<AvailableSuppliers> totalResultBySuppliers = supplyChainRepository.getTotalInfoByAvailableSuppliers(user.getCompanyId());

        Page<AvailableSupplierDto> supplierDtoPage = Page.empty();
        SupplyChainTotalDto supplyChainTotalDto = SupplyChainTotalDto.builder().build();

        if (!suppliers.getContent().isEmpty() && totalResultBySuppliers.isPresent()) {
            supplierDtoPage = suppliers.map(obj -> modelMapper.map(obj, AvailableSupplierDto.class));
            AvailableSuppliers totalResult = totalResultBySuppliers.get();

            setTotalSupplyEmission(supplierDtoPage, totalResult);

            supplyChainTotalDto = SupplyChainTotalDto.builder()
                    .temperatureAlignmentTotal(totalResult.getTotalTCO2().setScale(2, RoundingMode.DOWN))
                    .temperatureAlignmentValueType(PerformancePillar.OVERALL_SCORE.getValueType())
                    .probability_1_5Total(totalResult.getTotalProbability_1_5().setScale(2, RoundingMode.DOWN))
                    .probability_1_5ValueType(PerformancePillar.PROBABILITY_1_5.getValueType())
                    .probability_2Total(totalResult.getTotalProbability_2().setScale(2, RoundingMode.DOWN))
                    .probability_2ValueType(PerformancePillar.PROBABILITY_2_0.getValueType())
                    .totalSupplyChaneEmissionValueType(PerformancePillar.TOTAL_EMISSION.getValueType())
                    .carbonRatingTotal(null)
                    .TCO2Total(totalResult.getTotalTCO2().setScale(2, RoundingMode.DOWN))
                    .build();
        }
        return AvailableSuppliersInfoDto.builder()
                .supplyChainTotal(supplyChainTotalDto)
                .suppliers(supplierDtoPage)
                .build();
    }


    private void setTotalSupplyEmission(Page<AvailableSupplierDto> supplierDtoPage, AvailableSuppliers totalResult) {
        supplierDtoPage.getContent()
                .forEach(it-> {
                    it.setTotalSupplyEmission(it.getTCO2()
                            .divide(totalResult.getTotalTCO2(),2,RoundingMode.UP)
                            .multiply(BigDecimal.valueOf(100)));
                });
    }
}
