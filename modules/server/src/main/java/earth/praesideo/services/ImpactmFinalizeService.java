package earth.praesideo.services;

import earth.praesideo.database.entities.common.YearRepresentationEntity;
import earth.praesideo.database.entities.datasets.DataSetGhgInventoryMethodEntity;
import earth.praesideo.database.entities.datasets.DataSetGhgInventoryMethodOperationalBoundaryEntity;
import earth.praesideo.database.entities.datasets.DataSetRecentYearEmissionsEntity;
import earth.praesideo.database.entities.datasets.DataSetRecentYearEmissionsSourceEntity;
import earth.praesideo.database.entities.impactm.DataImpactmEmissionEntity;
import earth.praesideo.database.entities.users.CompanyEntity;
import earth.praesideo.database.repositories.common.OperationalBoundaryRepository;
import earth.praesideo.database.repositories.common.RefListRepository;
import earth.praesideo.database.repositories.common.YearRepresentationRepository;
import earth.praesideo.database.repositories.datasets.DataSetGhgInventoryMethodOperationalBoundaryRepository;
import earth.praesideo.database.repositories.datasets.DataSetGhgInventoryMethodRepository;
import earth.praesideo.database.repositories.datasets.DataSetRecentYearEmissionsRepository;
import earth.praesideo.database.repositories.datasets.DataSetRecentYearEmissionsSourceRepository;
import earth.praesideo.database.repositories.impactm.DataImpactmEmissionRepository;
import earth.praesideo.database.repositories.users.CompanyRepository;
import earth.praesideo.enums.ImpactmFinalizeRecordType;
import earth.praesideo.enums.RefEmissionTypeKey;
import earth.praesideo.exceptions.ApiException;
import earth.praesideo.exceptions.ExceptionContent;
import earth.praesideo.models.restapi.datasets.DataSetPercentageModel;
import earth.praesideo.models.security.CustomUserDetailsModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.*;
import java.util.stream.Collectors;

@Service
public class ImpactmFinalizeService {
    private final DataSetRecentYearEmissionsRepository dataSetRecentYearEmissionsRepository;
    private final DataSetRecentYearEmissionsSourceRepository dataSetRecentYearEmissionsSourceRepository;
    private final DataImpactmEmissionRepository dataImpactmEmissionRepository;
    private final OperationalBoundaryRepository operationalBoundaryRepository;
    private final RefListRepository refListRepository;
    private final CompanyRepository companyRepository;
    private final CompanyService companyService;
    private final YearRepresentationRepository yearRepresentationRepository;
    private final DataSetGhgInventoryMethodRepository dataSetGhgInventoryMethodRepository;
    private final DataSetGhgInventoryMethodOperationalBoundaryRepository dataSetGhgInventoryMethodOperationalBoundaryRepository;
    private final BillingService billingService;

    private static final String REF_OP_BOUNDARY_SCOPE1_STATIONARY_COMBUSTION = "Fuel Use- Stationary Combustion";
    private static final String REF_OP_BOUNDARY_SCOPE1_MOBILE_COMBUSTION = "Fuel Use- Mobile Combustion";
    private static final String REF_OP_BOUNDARY_SCOPE1_REFRIGERANTS = "Fugitive Emissions: Refrigerants and Aerosols";
    private static final String REF_OP_BOUNDARY_SCOPE2_PURCHASED_ELECTRICITY = "Purchased Electricity";
    private static final String REF_OP_BOUNDARY_SCOPE3_EMPLOYEE_COMMUTE = "Employee commuting";
    private static final String REF_OP_BOUNDARY_SCOPE3_BUSINESS_TRAVEL = "Business travel";
    private static final String REF_EMISSION_TYPE_VALUE_STATIONARY_FUEL_COMBUSTION = "Scope1_stationary_fuel_combustion";
    private static final String REF_EMISSION_TYPE_VALUE_MOBILE_FUEL_COMBUSTION = "Scope1_mobile_fuel_combustion";

    @Autowired
    public ImpactmFinalizeService(DataSetRecentYearEmissionsRepository dataSetRecentYearEmissionsRepository,
                                  DataSetRecentYearEmissionsSourceRepository dataSetRecentYearEmissionsSourceRepository,
                                  DataImpactmEmissionRepository dataImpactmEmissionRepository,
                                  OperationalBoundaryRepository operationalBoundaryRepository,
                                  CompanyRepository companyRepository, RefListRepository refListRepository,
                                  DataSetGhgInventoryMethodRepository dataSetGhgInventoryMethodRepository,
                                  DataSetGhgInventoryMethodOperationalBoundaryRepository dataSetGhgInventoryMethodOperationalBoundaryRepository,
                                  YearRepresentationRepository yearRepresentationRepository,
                                  BillingService billingService,
                                  CompanyService companyService) {
        this.dataSetRecentYearEmissionsRepository = dataSetRecentYearEmissionsRepository;
        this.dataSetRecentYearEmissionsSourceRepository = dataSetRecentYearEmissionsSourceRepository;
        this.dataImpactmEmissionRepository = dataImpactmEmissionRepository;
        this.operationalBoundaryRepository = operationalBoundaryRepository;
        this.companyRepository = companyRepository;
        this.refListRepository = refListRepository;
        this.yearRepresentationRepository = yearRepresentationRepository;
        this.dataSetGhgInventoryMethodRepository = dataSetGhgInventoryMethodRepository;
        this.dataSetGhgInventoryMethodOperationalBoundaryRepository = dataSetGhgInventoryMethodOperationalBoundaryRepository;
        this.billingService = billingService;
        this.companyService = companyService;
    }

    public void confirmImpactMeasurement(CustomUserDetailsModel user, Integer yearRepresentationId) {
        Integer companyId = user.getCompanyId();
        Optional<DataImpactmEmissionEntity> dataImpactmEmissionEntity = this.dataImpactmEmissionRepository.
                findByCompanyIdAndYearRepresentationId(companyId, yearRepresentationId);
        if (dataImpactmEmissionEntity.isPresent()) {
            Optional<YearRepresentationEntity> yearRepresentationEntity = this.yearRepresentationRepository.findById(yearRepresentationId);
            if (yearRepresentationEntity.isEmpty()) {
                throw new ApiException(ExceptionContent.INVALID_YEAR, HttpStatus.BAD_REQUEST);
            }
            CompanyEntity company = this.companyRepository.findByCompanyId(companyId).get();
            DataSetRecentYearEmissionsEntity dataSetRecentYearEmissionsEntity = new DataSetRecentYearEmissionsEntity();
            Optional<DataSetRecentYearEmissionsEntity> dbEntity = this.dataSetRecentYearEmissionsRepository.
                    findFirstByCompanyCompanyIdAndYearRepresentationYearRepresentationId(companyId, yearRepresentationId);
            if (dbEntity.isPresent()) {
                dataSetRecentYearEmissionsEntity = dbEntity.get();
                dataSetRecentYearEmissionsEntity.setDateModified(new Date());
                dataSetRecentYearEmissionsEntity.setModifiedBy(user.getUsername());
            } else {
                dataSetRecentYearEmissionsEntity.setDateAdded(new Date());
                dataSetRecentYearEmissionsEntity.setAddedBy(user.getUsername());
                dataSetRecentYearEmissionsEntity.setCompany(company);
                dataSetRecentYearEmissionsEntity.setParticipationOfCarbonCreditsOrCertificates(false);
            }
            dataSetRecentYearEmissionsEntity.setFinancialYearStartMonth(dataImpactmEmissionEntity.get().getStartMonth());
            dataSetRecentYearEmissionsEntity.setIsFinancialYear(dataImpactmEmissionEntity.get().getIsFinancialYear());
            dataSetRecentYearEmissionsEntity.setYearRepresentationId(yearRepresentationId);
            dataSetRecentYearEmissionsEntity.setIsHistoricalEmissions(false);
            dataSetRecentYearEmissionsEntity.setScope1(getTCo2Value(dataImpactmEmissionEntity.get(), ImpactmFinalizeRecordType.SCOPE1));
            dataSetRecentYearEmissionsEntity.setScope2(getTCo2Value(dataImpactmEmissionEntity.get(), ImpactmFinalizeRecordType.SCOPE2));
            dataSetRecentYearEmissionsEntity.setScope3(getTCo2Value(dataImpactmEmissionEntity.get(), ImpactmFinalizeRecordType.SCOPE3));
            dataSetRecentYearEmissionsEntity = this.dataSetRecentYearEmissionsRepository.save(dataSetRecentYearEmissionsEntity);
            this.updateEmissionSourceEntity(dataSetRecentYearEmissionsEntity, dataImpactmEmissionEntity.get(), user);
            this.billingService.generateDailyBill(companyId);
        }
    }

    private void updateEmissionSourceEntity(DataSetRecentYearEmissionsEntity dataSetRecentYearEmissionsEntity,
                                            DataImpactmEmissionEntity dataImpactmEmissionEntity,
                                            CustomUserDetailsModel user) {

        Integer operationalBoundaryId_Scope1FuelUseStationaryCombustion = this.operationalBoundaryRepository.
                findByName(REF_OP_BOUNDARY_SCOPE1_STATIONARY_COMBUSTION).getOperationalBoundaryId();
        Integer operationalBoundaryId_Scope1FuelUseMobileCombustionId = this.operationalBoundaryRepository.
                findByName(REF_OP_BOUNDARY_SCOPE1_MOBILE_COMBUSTION).getOperationalBoundaryId();
        Integer operationalBoundaryId_Scope1Refrigerant = this.operationalBoundaryRepository.
                findByName(REF_OP_BOUNDARY_SCOPE1_REFRIGERANTS).getOperationalBoundaryId();
        Integer operationalBoundaryId_Scope2PurchasedElectricity = this.operationalBoundaryRepository.
                findByName(REF_OP_BOUNDARY_SCOPE2_PURCHASED_ELECTRICITY).getOperationalBoundaryId();
        Integer operationalBoundaryId_Scope3EmployeeCommute = this.operationalBoundaryRepository.
                findByName(REF_OP_BOUNDARY_SCOPE3_EMPLOYEE_COMMUTE).getOperationalBoundaryId();
        Integer operationalBoundaryId_Scope3BusinessTravel = this.operationalBoundaryRepository.
                findByName(REF_OP_BOUNDARY_SCOPE3_BUSINESS_TRAVEL).getOperationalBoundaryId();

        DataSetRecentYearEmissionsSourceEntity dataSetRecentYearEmissionsSourceEntity = new DataSetRecentYearEmissionsSourceEntity();
        dataSetRecentYearEmissionsSourceEntity.setOperationalBoundaryId(operationalBoundaryId_Scope1FuelUseStationaryCombustion);
        dataSetRecentYearEmissionsSourceEntity.setRecentYearEmissionsId(dataSetRecentYearEmissionsEntity.getRecentYearEmissionsId());
        dataSetRecentYearEmissionsSourceEntity.setSourceValue((int) getTCo2Value(dataImpactmEmissionEntity,
                ImpactmFinalizeRecordType.REF_OP_BOUNDARY_SCOPE1_STATIONARY_COMBUSTION));
        this.checkAndSaveSourceValue(dataSetRecentYearEmissionsSourceEntity, user);

        dataSetRecentYearEmissionsSourceEntity = new DataSetRecentYearEmissionsSourceEntity();
        dataSetRecentYearEmissionsSourceEntity.setOperationalBoundaryId(operationalBoundaryId_Scope1FuelUseMobileCombustionId);
        dataSetRecentYearEmissionsSourceEntity.setRecentYearEmissionsId(dataSetRecentYearEmissionsEntity.getRecentYearEmissionsId());
        dataSetRecentYearEmissionsSourceEntity.setSourceValue((int) getTCo2Value(dataImpactmEmissionEntity,
                ImpactmFinalizeRecordType.REF_OP_BOUNDARY_SCOPE1_MOBILE_COMBUSTION));
        this.checkAndSaveSourceValue(dataSetRecentYearEmissionsSourceEntity, user);

        dataSetRecentYearEmissionsSourceEntity = new DataSetRecentYearEmissionsSourceEntity();
        dataSetRecentYearEmissionsSourceEntity.setOperationalBoundaryId(operationalBoundaryId_Scope1Refrigerant);
        dataSetRecentYearEmissionsSourceEntity.setRecentYearEmissionsId(dataSetRecentYearEmissionsEntity.getRecentYearEmissionsId());
        dataSetRecentYearEmissionsSourceEntity.setSourceValue((int) getTCo2Value(dataImpactmEmissionEntity,
                ImpactmFinalizeRecordType.REF_OP_BOUNDARY_SCOPE1_REFRIGERANTS));
        this.checkAndSaveSourceValue(dataSetRecentYearEmissionsSourceEntity, user);

        dataSetRecentYearEmissionsSourceEntity = new DataSetRecentYearEmissionsSourceEntity();
        dataSetRecentYearEmissionsSourceEntity.setOperationalBoundaryId(operationalBoundaryId_Scope2PurchasedElectricity);
        dataSetRecentYearEmissionsSourceEntity.setRecentYearEmissionsId(dataSetRecentYearEmissionsEntity.getRecentYearEmissionsId());
        dataSetRecentYearEmissionsSourceEntity.setSourceValue((int) getTCo2Value(dataImpactmEmissionEntity,
                ImpactmFinalizeRecordType.REF_OP_BOUNDARY_SCOPE2_PURCHASED_ELECTRICITY));
        this.checkAndSaveSourceValue(dataSetRecentYearEmissionsSourceEntity, user);

        dataSetRecentYearEmissionsSourceEntity = new DataSetRecentYearEmissionsSourceEntity();
        dataSetRecentYearEmissionsSourceEntity.setOperationalBoundaryId(operationalBoundaryId_Scope3EmployeeCommute);
        dataSetRecentYearEmissionsSourceEntity.setRecentYearEmissionsId(dataSetRecentYearEmissionsEntity.getRecentYearEmissionsId());
        dataSetRecentYearEmissionsSourceEntity.setSourceValue((int) getTCo2Value(dataImpactmEmissionEntity,
                ImpactmFinalizeRecordType.REF_OP_BOUNDARY_SCOPE3_EMPLOYEE_COMMUTE));
        this.checkAndSaveSourceValue(dataSetRecentYearEmissionsSourceEntity, user);

        dataSetRecentYearEmissionsSourceEntity = new DataSetRecentYearEmissionsSourceEntity();
        dataSetRecentYearEmissionsSourceEntity.setOperationalBoundaryId(operationalBoundaryId_Scope3BusinessTravel);
        dataSetRecentYearEmissionsSourceEntity.setRecentYearEmissionsId(dataSetRecentYearEmissionsEntity.getRecentYearEmissionsId());
        dataSetRecentYearEmissionsSourceEntity.setSourceValue((int) getTCo2Value(dataImpactmEmissionEntity,
                ImpactmFinalizeRecordType.REF_OP_BOUNDARY_SCOPE3_BUSINESS_TRAVEL));
        this.checkAndSaveSourceValue(dataSetRecentYearEmissionsSourceEntity, user);

        DataSetGhgInventoryMethodEntity dataSetGhgInventoryMethodEntity
                = dataSetGhgInventoryMethodRepository.findFirstByCompanyCompanyId(dataSetRecentYearEmissionsEntity.getCompany().getCompanyId());

        if (dataSetGhgInventoryMethodEntity == null) {
            dataSetGhgInventoryMethodEntity = new DataSetGhgInventoryMethodEntity();
            dataSetGhgInventoryMethodEntity.setAddedBy(user.getUsername());
            dataSetGhgInventoryMethodEntity.setDateAdded(new Date());
            dataSetGhgInventoryMethodEntity.setIsGhgInventoryPresent(true);
            dataSetGhgInventoryMethodEntity = dataSetGhgInventoryMethodRepository.save(dataSetGhgInventoryMethodEntity);
        } else {
            dataSetGhgInventoryMethodEntity.setModifiedBy(user.getUsername());
            dataSetGhgInventoryMethodEntity.setDateModified(new Date());
        }

        if (this.dataSetGhgInventoryMethodOperationalBoundaryRepository.findByGhgInventoryMethodEntityIdAndOperationalBoundaryId
                (dataSetGhgInventoryMethodEntity.getGhgInventoryMethodEntityId()
                        , operationalBoundaryId_Scope1FuelUseStationaryCombustion).isEmpty()) {
            DataSetGhgInventoryMethodOperationalBoundaryEntity row
                    = new DataSetGhgInventoryMethodOperationalBoundaryEntity();
            row.setAddedBy(user.getUsername());
            row.setDateAdded(new Date());
            row.setOperationalBoundaryId(operationalBoundaryId_Scope1FuelUseStationaryCombustion);
            row.setGhgInventoryMethodEntityId(dataSetGhgInventoryMethodEntity.getGhgInventoryMethodEntityId());
            this.dataSetGhgInventoryMethodOperationalBoundaryRepository.save(row);
        }

        if (this.dataSetGhgInventoryMethodOperationalBoundaryRepository.findByGhgInventoryMethodEntityIdAndOperationalBoundaryId
                (dataSetGhgInventoryMethodEntity.getGhgInventoryMethodEntityId()
                        , operationalBoundaryId_Scope1FuelUseMobileCombustionId).isEmpty()) {
            DataSetGhgInventoryMethodOperationalBoundaryEntity row
                    = new DataSetGhgInventoryMethodOperationalBoundaryEntity();
            row.setDateAdded(new Date());
            row.setAddedBy(user.getUsername());
            row.setOperationalBoundaryId(operationalBoundaryId_Scope1FuelUseMobileCombustionId);
            row.setGhgInventoryMethodEntityId(dataSetGhgInventoryMethodEntity.getGhgInventoryMethodEntityId());
            this.dataSetGhgInventoryMethodOperationalBoundaryRepository.save(row);
        }
        if (this.dataSetGhgInventoryMethodOperationalBoundaryRepository.findByGhgInventoryMethodEntityIdAndOperationalBoundaryId
                (dataSetGhgInventoryMethodEntity.getGhgInventoryMethodEntityId()
                        , operationalBoundaryId_Scope1Refrigerant).isEmpty()) {
            DataSetGhgInventoryMethodOperationalBoundaryEntity row
                    = new DataSetGhgInventoryMethodOperationalBoundaryEntity();
            row.setAddedBy(user.getUsername());
            row.setDateAdded(new Date());
            row.setOperationalBoundaryId(operationalBoundaryId_Scope1Refrigerant);
            row.setGhgInventoryMethodEntityId(dataSetGhgInventoryMethodEntity.getGhgInventoryMethodEntityId());
            this.dataSetGhgInventoryMethodOperationalBoundaryRepository.save(row);
        }
        if (this.dataSetGhgInventoryMethodOperationalBoundaryRepository.findByGhgInventoryMethodEntityIdAndOperationalBoundaryId
                (dataSetGhgInventoryMethodEntity.getGhgInventoryMethodEntityId()
                        , operationalBoundaryId_Scope2PurchasedElectricity).isEmpty()) {
            DataSetGhgInventoryMethodOperationalBoundaryEntity row
                    = new DataSetGhgInventoryMethodOperationalBoundaryEntity();
            row.setDateAdded(new Date());
            row.setAddedBy(user.getUsername());
            row.setOperationalBoundaryId(operationalBoundaryId_Scope2PurchasedElectricity);
            row.setGhgInventoryMethodEntityId(dataSetGhgInventoryMethodEntity.getGhgInventoryMethodEntityId());
            this.dataSetGhgInventoryMethodOperationalBoundaryRepository.save(row);
        }
        if (this.dataSetGhgInventoryMethodOperationalBoundaryRepository.findByGhgInventoryMethodEntityIdAndOperationalBoundaryId
                (dataSetGhgInventoryMethodEntity.getGhgInventoryMethodEntityId()
                        , operationalBoundaryId_Scope3EmployeeCommute).isEmpty()) {
            DataSetGhgInventoryMethodOperationalBoundaryEntity row = new DataSetGhgInventoryMethodOperationalBoundaryEntity();
            row.setDateAdded(new Date());
            row.setAddedBy(user.getUsername());
            row.setOperationalBoundaryId(operationalBoundaryId_Scope3EmployeeCommute);
            row.setGhgInventoryMethodEntityId(dataSetGhgInventoryMethodEntity.getGhgInventoryMethodEntityId());
            this.dataSetGhgInventoryMethodOperationalBoundaryRepository.save(row);
        }
        if (this.dataSetGhgInventoryMethodOperationalBoundaryRepository.findByGhgInventoryMethodEntityIdAndOperationalBoundaryId
                (dataSetGhgInventoryMethodEntity.getGhgInventoryMethodEntityId(),
                        operationalBoundaryId_Scope3BusinessTravel).isEmpty()) {
            DataSetGhgInventoryMethodOperationalBoundaryEntity row = new DataSetGhgInventoryMethodOperationalBoundaryEntity();
            row.setDateAdded(new Date());
            row.setAddedBy(user.getUsername());
            row.setOperationalBoundaryId(operationalBoundaryId_Scope3BusinessTravel);
            row.setGhgInventoryMethodEntityId(dataSetGhgInventoryMethodEntity.getGhgInventoryMethodEntityId());
            this.dataSetGhgInventoryMethodOperationalBoundaryRepository.save(row);
        }
    }

    private void checkAndSaveSourceValue(DataSetRecentYearEmissionsSourceEntity dsInput, CustomUserDetailsModel user) {
        Optional<DataSetRecentYearEmissionsSourceEntity> dataSetRecentYearEmissionsSourceEntity =
                this.dataSetRecentYearEmissionsSourceRepository.findByRecentYearEmissionsIdAndOperationalBoundaryId
                        (dsInput.getRecentYearEmissionsId(), dsInput.getOperationalBoundaryId());
        DataSetRecentYearEmissionsSourceEntity ds;
        if (dataSetRecentYearEmissionsSourceEntity.isEmpty()) {
            ds = dsInput;
            ds.setDateAdded(new Date());
            ds.setAddedBy(user.getUsername());
        } else {
            ds = dataSetRecentYearEmissionsSourceEntity.get();
            ds.setDateModified(new Date());
            ds.setModifiedBy(user.getUsername());
            ds.setSourceValue(dsInput.getSourceValue());
        }
        this.dataSetRecentYearEmissionsSourceRepository.save(ds);
    }

    private double getTCo2Value(DataImpactmEmissionEntity dataImpactmEmissionEntity, ImpactmFinalizeRecordType recordType) {
        var emissionTypeIdStationaryFuel = this.refListRepository.findByListKeyAndListValueIgnoreCase
                (RefEmissionTypeKey.IMPACTM_EMISSION_TYPE.getValue(), REF_EMISSION_TYPE_VALUE_STATIONARY_FUEL_COMBUSTION).get().getListId();
        var emissionTypeIdMobileFuel = this.refListRepository.findByListKeyAndListValueIgnoreCase
                (RefEmissionTypeKey.IMPACTM_EMISSION_TYPE.getValue(), REF_EMISSION_TYPE_VALUE_MOBILE_FUEL_COMBUSTION).get().getListId();

        List<BigDecimal> listTCo2 = new LinkedList<>();
        if (recordType == ImpactmFinalizeRecordType.REF_OP_BOUNDARY_SCOPE1_STATIONARY_COMBUSTION || recordType == ImpactmFinalizeRecordType.SCOPE1) {
            if (dataImpactmEmissionEntity.getDataImpactmScope1FuelCombustion() != null) {
                dataImpactmEmissionEntity.getDataImpactmScope1FuelCombustion().stream().filter
                        (c -> c.getCalcEmissionTypeId().equals(emissionTypeIdStationaryFuel)).forEach(row -> {
                    listTCo2.add(row.getCalcTco2());
                });
            }
        }
        if (recordType == ImpactmFinalizeRecordType.REF_OP_BOUNDARY_SCOPE1_MOBILE_COMBUSTION || recordType == ImpactmFinalizeRecordType.SCOPE1) {
            if (dataImpactmEmissionEntity.getDataImpactmScope1FuelCombustion() != null) {
                dataImpactmEmissionEntity.getDataImpactmScope1FuelCombustion().stream().filter
                        (c -> c.getCalcEmissionTypeId().equals(emissionTypeIdMobileFuel)).forEach(row -> {
                    listTCo2.add(row.getCalcTco2());
                });
            }
            if (dataImpactmEmissionEntity.getDataImpactmScope1Distance() != null) {
                dataImpactmEmissionEntity.getDataImpactmScope1Distance().forEach(row -> {
                    listTCo2.add(row.getCalcTco2());
                });
            }
        }
        if (recordType == ImpactmFinalizeRecordType.REF_OP_BOUNDARY_SCOPE1_REFRIGERANTS || recordType == ImpactmFinalizeRecordType.SCOPE1) {
            if (dataImpactmEmissionEntity.getDataImpactmScope1Refrigerators() != null) {
                dataImpactmEmissionEntity.getDataImpactmScope1Refrigerators().forEach(row -> {
                    listTCo2.add(row.getCalcTco2());
                });
            }
            if (dataImpactmEmissionEntity.getDataImpactmScope1Extinguishers() != null) {
                dataImpactmEmissionEntity.getDataImpactmScope1Extinguishers().forEach(row -> {
                    listTCo2.add(row.getCalcTco2());
                });
            }
        }
        if (recordType == ImpactmFinalizeRecordType.REF_OP_BOUNDARY_SCOPE2_PURCHASED_ELECTRICITY || recordType == ImpactmFinalizeRecordType.SCOPE2) {
            if (dataImpactmEmissionEntity.getDataImpactmScope2Electricity() != null) {
                dataImpactmEmissionEntity.getDataImpactmScope2Electricity().forEach(row -> {
                    listTCo2.add(row.getCalcTco2());
                });
            }
        }
        if (recordType == ImpactmFinalizeRecordType.REF_OP_BOUNDARY_SCOPE3_EMPLOYEE_COMMUTE || recordType == ImpactmFinalizeRecordType.SCOPE3) {
            if (dataImpactmEmissionEntity.getDataImpactmScope3EmployeeCommute() != null) {
                dataImpactmEmissionEntity.getDataImpactmScope3EmployeeCommute().forEach(row -> {
                    listTCo2.add(row.getCalcTco2());
                });
            }
        }
        if (recordType == ImpactmFinalizeRecordType.REF_OP_BOUNDARY_SCOPE3_BUSINESS_TRAVEL || recordType == ImpactmFinalizeRecordType.SCOPE3) {
            if (dataImpactmEmissionEntity.getDataImpactmScope3BusinessTravel() != null) {
                dataImpactmEmissionEntity.getDataImpactmScope3BusinessTravel().forEach(row -> {
                    listTCo2.add(row.getCalcTco2());
                });
            }
        }
        if (listTCo2.stream().count() > 0) {
            BigDecimal sum = listTCo2.stream().filter(Objects::nonNull).reduce(BigDecimal.ZERO, BigDecimal::add);
            return sum.doubleValue();
        }
        return 0.0;
    }

    public BigDecimal calculateImpactPercentageCompletion(CustomUserDetailsModel user, Integer yearRepresentationId) {
        DataSetPercentageModel response = new DataSetPercentageModel();
        var companyId = user.getCompanyId();
        Optional<DataImpactmEmissionEntity> dataImpactmEmissionEntityOptional =
                this.dataImpactmEmissionRepository.findByCompanyIdAndYearRepresentationId(companyId, yearRepresentationId);
        var totalRecords = 0;
        var uncompletedRecords = 0;
        if (dataImpactmEmissionEntityOptional.isPresent()) {
            DataImpactmEmissionEntity dataImpactmEmissionEntity = dataImpactmEmissionEntityOptional.get();
            if (dataImpactmEmissionEntity.getDataImpactmScope1FuelCombustion() != null) {
                totalRecords = totalRecords + dataImpactmEmissionEntity.getDataImpactmScope1FuelCombustion().size();
                uncompletedRecords = uncompletedRecords + dataImpactmEmissionEntity.getDataImpactmScope1FuelCombustion()
                        .stream().filter(r -> (r.getEmissionFactorId() == null && r.getEmissionFactorByUser() == null))
                        .collect(Collectors.toList()).size();
            }
            if (dataImpactmEmissionEntity.getDataImpactmScope1Distance() != null) {
                totalRecords = totalRecords + dataImpactmEmissionEntity.getDataImpactmScope1Distance().size();
                uncompletedRecords = uncompletedRecords + dataImpactmEmissionEntity.getDataImpactmScope1Distance()
                        .stream().filter(r -> (r.getEmissionFactorId() == null && r.getEmissionFactorByUser() == null))
                        .collect(Collectors.toList()).size();
            }
            if (dataImpactmEmissionEntity.getDataImpactmScope1Refrigerators() != null) {
                totalRecords = totalRecords + dataImpactmEmissionEntity.getDataImpactmScope1Refrigerators().size();
                uncompletedRecords = uncompletedRecords + dataImpactmEmissionEntity.getDataImpactmScope1Refrigerators()
                        .stream().filter(r -> (r.getEmissionFactorId() == null && r.getEmissionFactorByUser() == null))
                        .collect(Collectors.toList()).size();
            }
            if (dataImpactmEmissionEntity.getDataImpactmScope1Extinguishers() != null) {
                totalRecords = totalRecords + dataImpactmEmissionEntity.getDataImpactmScope1Extinguishers().size();
                uncompletedRecords = uncompletedRecords + dataImpactmEmissionEntity.getDataImpactmScope1Extinguishers()
                        .stream().filter(r -> (r.getEmissionFactorId() == null && r.getEmissionFactorByUser() == null))
                        .collect(Collectors.toList()).size();
            }
            if (dataImpactmEmissionEntity.getDataImpactmScope2Electricity() != null) {
                totalRecords = totalRecords + dataImpactmEmissionEntity.getDataImpactmScope2Electricity().size();
                uncompletedRecords = uncompletedRecords + dataImpactmEmissionEntity.getDataImpactmScope2Electricity()
                        .stream().filter(r -> (r.getEmissionFactorId() == null && r.getEmissionFactorByUser() == null))
                        .collect(Collectors.toList()).size();
            }
            if (dataImpactmEmissionEntity.getDataImpactmScope3EmployeeCommute() != null) {
                totalRecords = totalRecords + dataImpactmEmissionEntity.getDataImpactmScope3EmployeeCommute().size();
                uncompletedRecords = uncompletedRecords + dataImpactmEmissionEntity.getDataImpactmScope3EmployeeCommute()
                        .stream().filter(r -> (r.getEmissionFactorId() == null && r.getEmissionFactorByUser() == null))
                        .collect(Collectors.toList()).size();
            }
            if (dataImpactmEmissionEntity.getDataImpactmScope3BusinessTravel() != null) {
                totalRecords = totalRecords + dataImpactmEmissionEntity.getDataImpactmScope3BusinessTravel().size();
                uncompletedRecords = uncompletedRecords + dataImpactmEmissionEntity.getDataImpactmScope3BusinessTravel()
                        .stream().filter(r -> (r.getEmissionFactorId() == null && r.getEmissionFactorByUser() == null))
                        .collect(Collectors.toList()).size();
            }
            if (totalRecords > 0) {
                return BigDecimal.valueOf(totalRecords - uncompletedRecords)
                        .multiply(BigDecimal.valueOf(100))
                        .divide(BigDecimal.valueOf(totalRecords), 1, RoundingMode.HALF_UP);
            }
        }
        return BigDecimal.ZERO;
    }
}
