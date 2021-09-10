package earth.praesideo.services;

import earth.praesideo.database.entities.common.RefConfigEmissionsFactorEntity;
import earth.praesideo.database.entities.common.RefConfigEmissionsTypeEntity;
import earth.praesideo.database.entities.common.RefConfigEmissionsUnitFactorEntity;
import earth.praesideo.database.entities.impactm.*;
import earth.praesideo.database.entities.users.CompanyEntity;
import earth.praesideo.database.repositories.common.RefConfigEmissionsFactorRepository;
import earth.praesideo.database.repositories.common.RefConfigEmissionsTypeRepository;
import earth.praesideo.database.repositories.common.RefConfigEmissionsUnitFactorRepository;
import earth.praesideo.database.repositories.common.RefListRepository;
import earth.praesideo.database.repositories.impactm.*;
import earth.praesideo.database.repositories.users.CompanyRepository;
import earth.praesideo.enums.RefEmissionTypeKey;
import earth.praesideo.models.restapi.general.RefListModel;
import earth.praesideo.models.restapi.impactm.*;
import earth.praesideo.models.security.CustomUserDetailsModel;
import earth.praesideo.utils.DateUtils;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.*;
import java.util.stream.Collectors;

import static earth.praesideo.enums.RefEmissionTypeValue.*;

@Service
public class ImpactmService {
    private final DataImpactmEmissionRepository dataImpactmEmissionRepository;
    private final DataImpactmScope1FuelCombustionRepository dataImpactmScope1FuelCombustionRepository;
    private final DataImpactmScope1DistanceRepository dataImpactmScope1DistanceRepository;
    private final DataImpactmScope1RefrigeratorsRepository dataImpactmScope1RefrigeratorsRepository;
    private final DataImpactmScope1ExtinguishersRepository dataImpactmScope1ExtinguishersRepository;
    private final DataImpactmScope2ElectricityRepository dataImpactmScope2ElectricityRepository;
    private final DataImpactmScope3EmployeeCommuteRepository dataImpactmScope3EmployeeCommuteRepository;
    private final DataImpactmScope3BusinessTravelRepository dataImpactmScope3BusinessTravelRepository;
    private final CompanyRepository companyRepository;
    private final CompanyService companyService;
    private final ProductService productService;
    private final ImpactmRefService impactmRefService;

    private final RefConfigEmissionsTypeRepository refConfigEmissionsTypeRepository;
    private final RefConfigEmissionsUnitFactorRepository refConfigEmissionsUnitFactorRepository;
    private final RefConfigEmissionsFactorRepository refConfigEmissionsFactorRepository;
    private final RefListRepository refListRepository;
    private final ModelMapper modelMapper;
    private final Integer NUMBER_OF_BUSINESS_DAYS_IN_YEAR = 220;

    @Autowired
    public ImpactmService(DataImpactmEmissionRepository dataImpactmEmissionRepository,
                          DataImpactmScope1FuelCombustionRepository dataImpactmScope1FuelCombustionRepository,
                          DataImpactmScope1DistanceRepository dataImpactmScope1DistanceRepository,
                          DataImpactmScope1RefrigeratorsRepository dataImpactmScope1RefrigeratorsRepository,
                          DataImpactmScope1ExtinguishersRepository dataImpactmScope1ExtinguishersRepository,
                          DataImpactmScope2ElectricityRepository dataImpactmScope2ElectricityRepository,
                          DataImpactmScope3EmployeeCommuteRepository dataImpactmScope3EmployeeCommuteRepository,
                          DataImpactmScope3BusinessTravelRepository dataImpactmScope3BusinessTravelRepository,
                          RefConfigEmissionsTypeRepository refConfigEmissionsTypeRepository,
                          RefConfigEmissionsUnitFactorRepository refConfigEmissionsUnitFactorRepository,
                          RefConfigEmissionsFactorRepository refConfigEmissionsFactorRepository,
                          RefListRepository refListRepository,
                          ProductService productService,
                          CompanyService companyService,
                          CompanyRepository companyRepository,
                          ImpactmRefService impactmRefService,
                          ModelMapper modelMapper) {
        this.dataImpactmEmissionRepository = dataImpactmEmissionRepository;
        this.dataImpactmScope1FuelCombustionRepository = dataImpactmScope1FuelCombustionRepository;
        this.dataImpactmScope1DistanceRepository = dataImpactmScope1DistanceRepository;
        this.dataImpactmScope1RefrigeratorsRepository = dataImpactmScope1RefrigeratorsRepository;
        this.dataImpactmScope1ExtinguishersRepository = dataImpactmScope1ExtinguishersRepository;
        this.dataImpactmScope2ElectricityRepository = dataImpactmScope2ElectricityRepository;
        this.dataImpactmScope3EmployeeCommuteRepository = dataImpactmScope3EmployeeCommuteRepository;
        this.dataImpactmScope3BusinessTravelRepository = dataImpactmScope3BusinessTravelRepository;
        this.refConfigEmissionsTypeRepository = refConfigEmissionsTypeRepository;
        this.refConfigEmissionsUnitFactorRepository = refConfigEmissionsUnitFactorRepository;
        this.refConfigEmissionsFactorRepository = refConfigEmissionsFactorRepository;
        this.refListRepository = refListRepository;
        this.modelMapper = modelMapper;
        this.productService = productService;
        this.companyService = companyService;
        this.companyRepository = companyRepository;
        this.impactmRefService = impactmRefService;
    }

    public DataImpactmEmissionModel getImpactMeasurement(Integer companyId, Integer yearRepresentationId) {
        System.out.println("---------test------------11");
        DataImpactmEmissionModel response = new DataImpactmEmissionModel();
        response = initializeBlankResponse(response, companyId, yearRepresentationId);
        int intEmissionTypeId = 0;
        Optional<DataImpactmEmissionEntity> dbEntity =
                this.dataImpactmEmissionRepository.findByCompanyIdAndYearRepresentationId(companyId, yearRepresentationId);

        System.out.println("---------dbEntity------------11");

        if (dbEntity.isPresent()) {
            response = modelMapper.map(dbEntity.get(), DataImpactmEmissionModel.class);
            if (response.getDataImpactmScope1FuelCombustion() != null) {

                intEmissionTypeId = this.refListRepository.findByListKeyAndListValueIgnoreCase
                        (RefEmissionTypeKey.IMPACTM_EMISSION_TYPE.getValue(), SCOPE1_MOBILE_FUEL_COMBUSTION.getValue()).get().getListId();
                List<DataImpactmScope1FuelCombustionEntity> listMobileFuelEntity
                        = this.dataImpactmScope1FuelCombustionRepository.findByDataEmissionIdAndCalcEmissionTypeId
                        (dbEntity.get().getId(), intEmissionTypeId);

                List<DataImpactmScope1FuelCombustionModel> listModelMobile =
                        listMobileFuelEntity.stream()
                                .map(obj -> modelMapper.map(obj, DataImpactmScope1FuelCombustionModel.class)).collect(Collectors.toList());

                response.setDataImpactmScope1MobileFuelCombustion(listModelMobile);

                intEmissionTypeId = this.refListRepository.findByListKeyAndListValueIgnoreCase
                        (RefEmissionTypeKey.IMPACTM_EMISSION_TYPE.getValue(), SCOPE1_STATIONARY_FUEL_COMBUSTION.getValue()).get().getListId();

                List<DataImpactmScope1FuelCombustionEntity> listStationaryFuelEntity
                        = this.dataImpactmScope1FuelCombustionRepository.findByDataEmissionIdAndCalcEmissionTypeId
                        (dbEntity.get().getId(), intEmissionTypeId);

                List<DataImpactmScope1FuelCombustionModel> listStationaryFuel =
                        listStationaryFuelEntity.stream()
                                .map(obj -> modelMapper.map(obj, DataImpactmScope1FuelCombustionModel.class)).collect(Collectors.toList());

                response.setDataImpactmScope1FuelCombustion(listStationaryFuel);
            }
            List<RefConfigEmissionsFactorEntity> emissionFactorsList =
                    this.impactmRefService.getEmissionFactorForCompanyIdAndYearRepresentationId(companyId, yearRepresentationId);
            response = this.populateEmissionFactorsList(response, emissionFactorsList);
            response = this.SortModel(response);

        }
        return response;
    }

    public EmissionCalculationScope getImpactCalculationData(Integer companyId, Integer yearRepresentationId) {

        System.out.println("---------test------------11");
        DataImpactmEmissionModel response = new DataImpactmEmissionModel();
        response = initializeBlankResponse(response, companyId, yearRepresentationId);

        EmissionCalculationScope result = new EmissionCalculationScope();

        result.setScope3EmployeeCommute(BigDecimal.ZERO);
        result.setScope3BusinessTravel(BigDecimal.ZERO);

        Optional<DataImpactmEmissionEntity> dbEntity =
                this.dataImpactmEmissionRepository.findByCompanyIdAndYearRepresentationId(companyId, yearRepresentationId);

        if (dbEntity.isPresent()) {
            response = modelMapper.map(dbEntity.get(), DataImpactmEmissionModel.class);

            response.getDataImpactmScope3BusinessTravel().forEach(row -> {
                if (row.getCalcTco2() != null && row.getCalcTotalDistanceConverted() != null){
                    BigDecimal temp = result.getScope3BusinessTravel().add(row.getCalcTco2().multiply(row.getCalcTotalDistanceConverted()));
                    result.setScope3BusinessTravel(temp);
                }
            });

            response.getDataImpactmScope3EmployeeCommute().forEach(row -> {
                if (row.getCalcTco2() != null && row.getCalcTotalDistanceConverted() != null){
                    BigDecimal temp = result.getScope3EmployeeCommute().add(row.getCalcTco2().multiply(row.getCalcTotalDistanceConverted()));
                    result.setScope3EmployeeCommute(temp);
                }
            });
            result.setScope3Total(result.getScope3EmployeeCommute().add(result.getScope3BusinessTravel()));
            result.setIsMeasurement(response.getIsMeasurement());
        }

        return result;
    }

    private DataImpactmEmissionModel SortModel(DataImpactmEmissionModel response) {
        if (response.getDataImpactmScope1FuelCombustion() != null && response.getDataImpactmScope1FuelCombustion().size() > 1) {
            response.getDataImpactmScope1FuelCombustion().sort(Comparator.comparing((o -> o.getId())));
        }
        if (response.getDataImpactmScope1MobileFuelCombustion() != null && response.getDataImpactmScope1MobileFuelCombustion().size() > 1) {
            response.getDataImpactmScope1MobileFuelCombustion().sort(Comparator.comparing((o -> o.getId())));
        }
        if (response.getDataImpactmScope1Distance() != null && response.getDataImpactmScope1Distance().size() > 1) {
            response.getDataImpactmScope1Distance().sort(Comparator.comparing((o -> o.getId())));
        }
        if (response.getDataImpactmScope1Refrigerators() != null && response.getDataImpactmScope1Refrigerators().size() > 1) {
            response.getDataImpactmScope1Refrigerators().sort(Comparator.comparing((o -> o.getId())));
        }
        if (response.getDataImpactmScope1Extinguishers() != null && response.getDataImpactmScope1Extinguishers().size() > 1) {
            response.getDataImpactmScope1Extinguishers().sort(Comparator.comparing((o -> o.getId())));
        }
        if (response.getDataImpactmScope3EmployeeCommute() != null && response.getDataImpactmScope3EmployeeCommute().size() > 1) {
            response.getDataImpactmScope3EmployeeCommute().sort(Comparator.comparing((o -> o.getId())));
        }
        if (response.getDataImpactmScope3BusinessTravel() != null && response.getDataImpactmScope3BusinessTravel().size() > 1) {
            response.getDataImpactmScope3BusinessTravel().sort(Comparator.comparing((o -> o.getId())));
        }
        return response;
    }

    private DataImpactmEmissionModel initializeBlankResponse(DataImpactmEmissionModel inputModel, Integer companyId, Integer yearRepresentationId) {
        inputModel.setCompanyId(companyId);
        if (yearRepresentationId > 0) {
            inputModel.setYearRepresentationId(yearRepresentationId);
        }
        inputModel.setIsFinancialYear(false);
        inputModel.setIsMeasurement(this.productService.isImpactMeasurementOnlySubscription(companyId));
        inputModel.setIsStationaryCombustion(false);
        inputModel.setIsMobileCombustion(false);
        inputModel.setIsRefrigerators(false);
        inputModel.setIsFireExtinguisher(false);
        inputModel.setIsEmployeeCommuteCompleteData(false);
        inputModel.setIsEmployeeCommutePartialData(false);
        inputModel.setIsEmployeeCommuteApproximateData(false);
        inputModel.setIsBusinessTravelCompleteData(false);
        inputModel.setIsBusinessTravelPartialData(false);
        return inputModel;
    }

    private DataImpactmEmissionModel populateEmissionFactorsList(DataImpactmEmissionModel model,
                                                                 List<RefConfigEmissionsFactorEntity> emissionFactorsList) {
        if (!model.getDataImpactmScope1FuelCombustion().isEmpty()) {
            model.getDataImpactmScope1FuelCombustion().forEach(row -> {
                List<RefConfigEmissionsFactorEntity> listFactors = emissionFactorsList.
                        stream().filter(c -> c.getConfigEtypeId().equals(row.getCalcConfigEmissionsTypeId())).collect(Collectors.toList());
                if (!listFactors.isEmpty()) {
                    List<RefListModel> modelList = new LinkedList<>();
                    listFactors.forEach(factor -> {
                        RefListModel list = new RefListModel();
                        list.setListId(factor.getId());
                        list.setListValue(factor.getEmissionFactor().setScale(2, RoundingMode.UP).toString());
                        if (factor.getEmissionSourceId() != null) {
                            list.setListKey(this.refListRepository.findById(factor.getEmissionSourceId()).get().getListValue()
                                    .concat(this.getFactorDatesIfAvailable(factor)));
                        }
                        list.setListValue2(factor.getRefConfigEmissionsTypeEntity().getEtypeUnit2().getListValue());
                        modelList.add(list);
                    });
                    row.setEmissionFactorsList(modelList);
                }
            });
        }
        if (!model.getDataImpactmScope1MobileFuelCombustion().isEmpty()) {
            model.getDataImpactmScope1MobileFuelCombustion().forEach(row -> {
                List<RefConfigEmissionsFactorEntity> listFactors = emissionFactorsList.
                        stream().filter(c -> c.getConfigEtypeId().equals(row.getCalcConfigEmissionsTypeId())).collect(Collectors.toList());
                if (!listFactors.isEmpty()) {
                    List<RefListModel> modelList = new LinkedList<>();
                    listFactors.forEach(factor -> {
                        RefListModel list = new RefListModel();
                        list.setListId(factor.getId());
                        list.setListValue(factor.getEmissionFactor().setScale(2, RoundingMode.UP).toString());
                        if (factor.getEmissionSourceId() != null) {
                            list.setListKey(this.refListRepository.findById(factor.getEmissionSourceId()).get().getListValue()
                                    .concat(this.getFactorDatesIfAvailable(factor)));
                        }
                        list.setListValue2(factor.getRefConfigEmissionsTypeEntity().getEtypeUnit2().getListValue());
                        modelList.add(list);
                    });
                    row.setEmissionFactorsList(modelList);
                }
            });
        }
        if (!model.getDataImpactmScope1Distance().isEmpty()) {
            model.getDataImpactmScope1Distance().forEach(row -> {
                List<RefConfigEmissionsFactorEntity> listFactors = emissionFactorsList.
                        stream().filter(c -> c.getConfigEtypeId().equals(row.getCalcConfigEmissionsTypeId())).collect(Collectors.toList());
                if (!listFactors.isEmpty()) {
                    List<RefListModel> modelList = new LinkedList<>();
                    listFactors.forEach(factor -> {
                        RefListModel list = new RefListModel();
                        list.setListId(factor.getId());
                        list.setListValue(factor.getEmissionFactor().setScale(4, RoundingMode.UP).toString());
                        if (factor.getEmissionSourceId() != null) {
                            list.setListKey(this.refListRepository.findById(factor.getEmissionSourceId()).get().getListValue()
                                    .concat(this.getFactorDatesIfAvailable(factor)));
                        }
                        list.setListValue2(factor.getRefConfigEmissionsTypeEntity().getEtypeUnit2().getListValue());
                        modelList.add(list);
                    });
                    row.setEmissionFactorsList(modelList);
                }
            });
        }
        if (!model.getDataImpactmScope1Refrigerators().isEmpty()) {
            model.getDataImpactmScope1Refrigerators().forEach(row -> {
                List<RefConfigEmissionsFactorEntity> listFactors = emissionFactorsList.
                        stream().filter(c -> c.getConfigEtypeId().equals(row.getCalcConfigEmissionsTypeId())).collect(Collectors.toList());
                if (!listFactors.isEmpty()) {
                    List<RefListModel> modelList = new LinkedList<>();
                    listFactors.forEach(factor -> {
                        RefListModel list = new RefListModel();
                        list.setListId(factor.getId());
                        list.setListValue(factor.getEmissionFactor().setScale(2, RoundingMode.UP).toString());
                        if (factor.getEmissionSourceId() != null) {
                            list.setListKey(this.refListRepository.findById(factor.getEmissionSourceId()).get().getListValue()
                                    .concat(this.getFactorDatesIfAvailable(factor)));
                        }
                        list.setListValue2(factor.getRefConfigEmissionsTypeEntity().getEtypeUnit2().getListValue());
                        modelList.add(list);
                    });
                    row.setEmissionFactorsList(modelList);
                }
            });
        }
        if (!model.getDataImpactmScope1Extinguishers().isEmpty()) {
            model.getDataImpactmScope1Extinguishers().forEach(row -> {
                List<RefConfigEmissionsFactorEntity> listFactors = emissionFactorsList.
                        stream().filter(c -> c.getConfigEtypeId().equals(row.getCalcConfigEmissionsTypeId())).collect(Collectors.toList());
                if (!listFactors.isEmpty()) {
                    List<RefListModel> modelList = new LinkedList<>();
                    listFactors.forEach(factor -> {
                        RefListModel list = new RefListModel();
                        list.setListId(factor.getId());
                        list.setListValue(factor.getEmissionFactor().setScale(2, RoundingMode.UP).toString());
                        if (factor.getEmissionSourceId() != null) {
                            list.setListKey(this.refListRepository.findById(factor.getEmissionSourceId()).get().getListValue()
                                    .concat(this.getFactorDatesIfAvailable(factor)));
                        }
                        list.setListValue2(factor.getRefConfigEmissionsTypeEntity().getEtypeUnit2().getListValue());
                        modelList.add(list);
                    });
                    row.setEmissionFactorsList(modelList);
                }
            });
        }

        if (!model.getDataImpactmScope2Electricity().isEmpty()) {
            model.getDataImpactmScope2Electricity().forEach(row -> {
                List<RefConfigEmissionsFactorEntity> listFactors = emissionFactorsList.
                        stream().filter(c -> c.getConfigEtypeId().equals(row.getCalcConfigEmissionsTypeId())).collect(Collectors.toList());
                if (!listFactors.isEmpty()) {
                    List<RefListModel> modelList = new LinkedList<>();
                    listFactors.forEach(factor -> {
                        RefListModel list = new RefListModel();
                        list.setListId(factor.getId());
                        list.setListValue(factor.getEmissionFactor().setScale(2, RoundingMode.UP).toString());
                        if (factor.getEmissionSourceId() != null) {
                            list.setListKey(this.refListRepository.findById(factor.getEmissionSourceId()).get().getListValue()
                                    .concat(this.getFactorDatesIfAvailable(factor)));
                        }
                        list.setListValue2(factor.getRefConfigEmissionsTypeEntity().getEtypeUnit2().getListValue());
                        modelList.add(list);
                    });
                    row.setEmissionFactorsList(modelList);
                }
            });
        }
        if (!model.getDataImpactmScope3EmployeeCommute().isEmpty()) {
            model.getDataImpactmScope3EmployeeCommute().forEach(row -> {
                List<RefConfigEmissionsFactorEntity> listFactors = emissionFactorsList.
                        stream().filter(c -> c.getConfigEtypeId().equals(row.getCalcConfigEmissionsTypeId())).collect(Collectors.toList());
                if (!listFactors.isEmpty()) {
                    List<RefListModel> modelList = new LinkedList<>();
                    listFactors.forEach(factor -> {
                        RefListModel list = new RefListModel();
                        list.setListId(factor.getId());
                        list.setListValue(factor.getEmissionFactor().setScale(2, RoundingMode.UP).toString());
                        if (factor.getEmissionSourceId() != null) {
                            list.setListKey(this.refListRepository.findById(factor.getEmissionSourceId()).get().getListValue()
                                    .concat(this.getFactorDatesIfAvailable(factor)));
                        }
                        list.setListValue2(factor.getRefConfigEmissionsTypeEntity().getEtypeUnit2().getListValue());
                        modelList.add(list);
                    });
                    row.setEmissionFactorsList(modelList);
                }
            });
        }
        if (!model.getDataImpactmScope3BusinessTravel().isEmpty()) {
            model.getDataImpactmScope3BusinessTravel().forEach(row -> {
                List<RefConfigEmissionsFactorEntity> listFactors = emissionFactorsList.
                        stream().filter(c -> c.getConfigEtypeId().equals(row.getCalcConfigEmissionsTypeId())).collect(Collectors.toList());
                if (!listFactors.isEmpty()) {
                    List<RefListModel> modelList = new LinkedList<>();
                    listFactors.forEach(factor -> {
                        RefListModel list = new RefListModel();
                        list.setListId(factor.getId());
                        list.setListValue(factor.getEmissionFactor().setScale(2, RoundingMode.UP).toString());
                        if (factor.getEmissionSourceId() != null) {
                            list.setListKey(this.refListRepository.findById(factor.getEmissionSourceId()).get().getListValue()
                                    .concat(this.getFactorDatesIfAvailable(factor)));
                        }
                        list.setListValue2(factor.getRefConfigEmissionsTypeEntity().getEtypeUnit2().getListValue());
                        modelList.add(list);
                    });
                    row.setEmissionFactorsList(modelList);
                }
            });
        }
        return model;
    }

    private String getFactorDatesIfAvailable(RefConfigEmissionsFactorEntity factor) {
        String returnValue = new String();
        if (factor.getEndDate() != null) {
            if (factor.getStartDate() != null) {
                returnValue = returnValue.concat("(")
                        .concat(DateUtils.getEmissionFactorDateFormatted(factor.getStartDate()))
                        .concat(" - ")
                        .concat(DateUtils.getEmissionFactorDateFormatted(factor.getEndDate()))
                        .concat(")");
            } else {
                returnValue = returnValue.concat("(")
                        .concat(" - ")
                        .concat(DateUtils.getEmissionFactorDateFormatted(factor.getEndDate()))
                        .concat(")");
            }
        }
        return returnValue;
    }

    public DataImpactmEmissionModel saveImpactMeasurement
            (Integer companyId, DataImpactmEmissionModel dataModel, CustomUserDetailsModel user) {

        DataImpactmEmissionEntity dbEntity = updateDataEmission(dataModel, user);
        this.updateStationaryFuel(dbEntity, dataModel, user);
        this.updateMobileFuel(dbEntity, dataModel, user);
        this.updateDistance(dbEntity, dataModel, user);
        this.updateRefrigerators(dbEntity, dataModel, user);
        this.updateExtinguishers(dbEntity, dataModel, user);
        this.updateElectricity(dbEntity, dataModel, user);
        this.updateEmployeeCommute(dbEntity, dataModel, user);
        this.updateBusinessTravel(dbEntity, dataModel, user);
        return getImpactMeasurement(companyId, dataModel.getYearRepresentationId());
    }

    private DataImpactmEmissionEntity updateDataEmission(DataImpactmEmissionModel dataModel
            , CustomUserDetailsModel user) {
        DataImpactmEmissionEntity dbEntity;
        CompanyEntity companyEntity = this.companyService.getCompanyEntityById(dataModel.getCompanyId());
        if (dataModel.getId() == null) {
            dbEntity = new DataImpactmEmissionEntity();
            dbEntity.setDateAdded(new Date());
            dbEntity.setAddedBy(user.getUsername());
        } else {
            dbEntity = this.dataImpactmEmissionRepository.getById(dataModel.getId());
            dbEntity.setDateModified(new Date());
            dbEntity.setModifiedBy(user.getUsername());
        }
        dbEntity.setCompanyId(dataModel.getCompanyId());
        if (dataModel.getIsFinancialYear() != null) {
            dbEntity.setIsFinancialYear(dataModel.getIsFinancialYear());
            companyEntity.setIsFinancialYear(dataModel.getIsFinancialYear());
        }
        if (dataModel.getYearRepresentationId() != null) {
            dbEntity.setYearRepresentationId(dataModel.getYearRepresentationId());
            companyEntity.setYearRepresentationId(dataModel.getYearRepresentationId());
        }
        if (dataModel.getStartMonth() != null) {
            dbEntity.setStartMonth(dataModel.getStartMonth());
            companyEntity.setStartMonth(dataModel.getStartMonth());
        }
        dbEntity.setIsMeasurement(dataModel.getIsMeasurement());
        dbEntity.setIsStationaryCombustion(dataModel.getIsStationaryCombustion());
        dbEntity.setIsMobileCombustion(dataModel.getIsMobileCombustion());
        dbEntity.setIsRefrigerators(dataModel.getIsRefrigerators());
        dbEntity.setIsFireExtinguisher(dataModel.getIsFireExtinguisher());
        dbEntity.setIsEmployeeCommuteCompleteData(dataModel.getIsEmployeeCommuteCompleteData());
        dbEntity.setIsEmployeeCommutePartialData(dataModel.getIsEmployeeCommutePartialData());
        dbEntity.setIsEmployeeCommuteApproximateData(dataModel.getIsEmployeeCommuteApproximateData());
        dbEntity.setIsBusinessTravelCompleteData(dataModel.getIsBusinessTravelCompleteData());
        dbEntity.setIsBusinessTravelPartialData(dataModel.getIsBusinessTravelPartialData());
        this.companyRepository.save(companyEntity);
        return this.dataImpactmEmissionRepository.save(dbEntity);
    }

    private void updateStationaryFuel(DataImpactmEmissionEntity parentEntity,
                                      DataImpactmEmissionModel dataModel,
                                      CustomUserDetailsModel user) {
        var emissionTypeId = this.refListRepository.findByListKeyAndListValueIgnoreCase
                (RefEmissionTypeKey.IMPACTM_EMISSION_TYPE.getValue(), SCOPE1_STATIONARY_FUEL_COMBUSTION.getValue()).get().getListId();

        if (dataModel.getIsStationaryCombustion() && dataModel.getDataImpactmScope1FuelCombustion() != null
                && !dataModel.getDataImpactmScope1FuelCombustion().isEmpty()) {
            this.updateFuelCombustion(parentEntity, dataModel.getDataImpactmScope1FuelCombustion(), user, emissionTypeId);
        } else if (parentEntity.getDataImpactmScope1FuelCombustion() != null && !parentEntity.getDataImpactmScope1FuelCombustion().isEmpty()) {
            parentEntity.getDataImpactmScope1FuelCombustion().forEach(row -> {
                if (row.getCalcEmissionTypeId().equals(emissionTypeId)) {
                    this.deleteStationaryFuel(row.getId());
                }
            });
        }
    }

    private void updateMobileFuel(DataImpactmEmissionEntity parentEntity,
                                  DataImpactmEmissionModel dataModel,
                                  CustomUserDetailsModel user) {
        var emissionTypeId = this.refListRepository.findByListKeyAndListValueIgnoreCase
                (RefEmissionTypeKey.IMPACTM_EMISSION_TYPE.getValue(), SCOPE1_MOBILE_FUEL_COMBUSTION.getValue()).get().getListId();
        if (dataModel.getIsMobileCombustion() && dataModel.getDataImpactmScope1MobileFuelCombustion() != null
                && !dataModel.getDataImpactmScope1MobileFuelCombustion().isEmpty()) {

            this.updateFuelCombustion(parentEntity,
                    dataModel.getDataImpactmScope1MobileFuelCombustion(),
                    user,
                    emissionTypeId);
        } else if (parentEntity.getDataImpactmScope1FuelCombustion() != null && !parentEntity.getDataImpactmScope1FuelCombustion().isEmpty()) {
            parentEntity.getDataImpactmScope1FuelCombustion().forEach(row -> {
                if (row.getCalcEmissionTypeId().equals(emissionTypeId)) {
                    this.deleteMobileFuel(row.getId());
                }
            });
        }
    }

    private void updateFuelCombustion(DataImpactmEmissionEntity parentEntity,
                                      Collection<DataImpactmScope1FuelCombustionModel> dataModel,
                                      CustomUserDetailsModel user,
                                      Integer emissionTypeId) {
        dataModel.forEach(it -> {
            DataImpactmScope1FuelCombustionEntity objDataImpactmScope1FuelCombustionEntity;
            if (it.getId() == null) {
                objDataImpactmScope1FuelCombustionEntity = new DataImpactmScope1FuelCombustionEntity();
                objDataImpactmScope1FuelCombustionEntity.setAddedBy(user.getUsername());
                objDataImpactmScope1FuelCombustionEntity.setDateAdded(new Date());
                objDataImpactmScope1FuelCombustionEntity.setDataEmissionId(parentEntity.getId());
            } else {
                objDataImpactmScope1FuelCombustionEntity = this.dataImpactmScope1FuelCombustionRepository.getById(it.getId());
                objDataImpactmScope1FuelCombustionEntity.setModifiedBy(user.getUsername());
                objDataImpactmScope1FuelCombustionEntity.setDateModified(new Date());
            }
            objDataImpactmScope1FuelCombustionEntity.setCalcEmissionTypeId(emissionTypeId);
            objDataImpactmScope1FuelCombustionEntity.setFuelAmountRaw(it.getFuelAmountRaw());
            objDataImpactmScope1FuelCombustionEntity.setFuelUnitId(it.getFuelUnitId());

            if (it.getEmissionFactorId() != null) {
                objDataImpactmScope1FuelCombustionEntity.setEmissionFactorId(it.getEmissionFactorId());
            } else {
                objDataImpactmScope1FuelCombustionEntity.setEmissionFactorId(null);
            }
            if (it.getEmissionFactorByUser() != null) {
                objDataImpactmScope1FuelCombustionEntity.setEmissionFactorByUser(it.getEmissionFactorByUser());
            } else {
                objDataImpactmScope1FuelCombustionEntity.setEmissionFactorByUser(null);
            }

            if (it.getFuelTypeId() != null) {
                objDataImpactmScope1FuelCombustionEntity.setFuelTypeId(it.getFuelTypeId());

                if (it.getFuelUnitId() != null && it.getFuelAmountRaw() != null) {
                    int configEmissionTypeId = 0;
                    List<RefConfigEmissionsTypeEntity> factorConfigs =
                            this.refConfigEmissionsTypeRepository.
                                    findByEtypeIdAndEtypeattrId1(emissionTypeId, it.getFuelTypeId());
                    if (factorConfigs.stream().count() == 1) {
                        configEmissionTypeId = factorConfigs.get(0).getId();
                    } else {
                        for (RefConfigEmissionsTypeEntity row : factorConfigs) {
                            RefConfigEmissionsUnitFactorEntity unitConfig = this.refConfigEmissionsUnitFactorRepository.findByConfigEmissionTypeIdAndEtypeUnitId1
                                    (row.getId(), it.getFuelUnitId());
                            if (unitConfig != null) {
                                if (unitConfig.getEtypeUnitId1().equals(it.getFuelUnitId()) && unitConfig.getEtypeUnitFactor1().compareTo(BigDecimal.valueOf(1.00)) == 0) {
                                    configEmissionTypeId = unitConfig.getConfigEmissionTypeId();
                                    break;
                                }
                            }
                        }
                    }

                    objDataImpactmScope1FuelCombustionEntity.setCalcConfigEmissionsTypeId(configEmissionTypeId);

                    RefConfigEmissionsUnitFactorEntity refConfigEmissionsUnitFactorEntity
                            = this.refConfigEmissionsUnitFactorRepository.findByConfigEmissionTypeIdAndEtypeUnitId1
                            (configEmissionTypeId, it.getFuelUnitId());

                    objDataImpactmScope1FuelCombustionEntity.setCalcConfigEmissionsUnitFactorId
                            (refConfigEmissionsUnitFactorEntity.getId());

                    BigDecimal convertedFuelAmount = it.getFuelAmountRaw().multiply
                            (refConfigEmissionsUnitFactorEntity.getEtypeUnitFactor1());
                    objDataImpactmScope1FuelCombustionEntity.setCalcFuelAmountConverted(convertedFuelAmount);

                    if (it.getEmissionFactorByUser() != null) {
                        BigDecimal tCo2 = convertedFuelAmount.multiply(it.getEmissionFactorByUser())
                                .multiply(refConfigEmissionsUnitFactorEntity.getEtypeUnitFactor2());
                        objDataImpactmScope1FuelCombustionEntity.setCalcTco2(tCo2);
                    } else {
                        if (it.getEmissionFactorId() != null) {
                            Optional<RefConfigEmissionsFactorEntity> refConfigEmissionsFactorEntity
                                    = this.refConfigEmissionsFactorRepository.findById(it.getEmissionFactorId());
                            if (refConfigEmissionsFactorEntity.isPresent()) {
                                BigDecimal tCo2 = convertedFuelAmount.multiply(refConfigEmissionsFactorEntity.get().getEmissionFactor())
                                        .multiply(refConfigEmissionsUnitFactorEntity.getEtypeUnitFactor2());
                                objDataImpactmScope1FuelCombustionEntity.setCalcTco2(tCo2);
                            }
                        }
                    }
                }
            }
            this.dataImpactmScope1FuelCombustionRepository.save(objDataImpactmScope1FuelCombustionEntity);
        });
    }

    private void updateDistance(DataImpactmEmissionEntity parentEntity,
                                DataImpactmEmissionModel dataModel,
                                CustomUserDetailsModel user) {
        if (dataModel.getIsMobileCombustion() && dataModel.getDataImpactmScope1Distance() != null
                && !dataModel.getDataImpactmScope1Distance().isEmpty()) {

            var emissionTypeId = this.refListRepository.findByListKeyAndListValueIgnoreCase
                    (RefEmissionTypeKey.IMPACTM_EMISSION_TYPE.getValue(), SCOPE1_DISTANCE_TRAVELLED.getValue()).get().getListId();

            List<DataImpactmScope1DistanceModel> listModel = dataModel.getDataImpactmScope1Distance();
            listModel.forEach(it -> {
                DataImpactmScope1DistanceEntity objDistanceEntity;
                if (it.getId() == null) {
                    objDistanceEntity
                            = new DataImpactmScope1DistanceEntity();
                    objDistanceEntity.setAddedBy(user.getUsername());
                    objDistanceEntity.setDateAdded(new Date());
                    objDistanceEntity.setDataEmissionId(parentEntity.getId());
                } else {
                    objDistanceEntity = this.dataImpactmScope1DistanceRepository.getById(it.getId());
                    objDistanceEntity.setModifiedBy(user.getUsername());
                    objDistanceEntity.setDateModified(new Date());
                }
                if (it.getVehicleCategoryId() != null) {
                    objDistanceEntity.setVehicleCategoryId(it.getVehicleCategoryId());
                }
                if (it.getVehicleTypeId() != null) {
                    objDistanceEntity.setVehicleTypeId(it.getVehicleTypeId());
                }
                if (it.getDistanceAmountRaw() != null) {
                    objDistanceEntity.setDistanceAmountRaw(it.getDistanceAmountRaw());
                }
                if (it.getDistanceUnitId() != null) {
                    objDistanceEntity.setDistanceUnitId(it.getDistanceUnitId());
                }
                if (it.getEmissionFactorId() != null) {
                    objDistanceEntity.setEmissionFactorId(it.getEmissionFactorId());
                } else {
                    objDistanceEntity.setEmissionFactorId(null);
                }
                if (it.getEmissionFactorByUser() != null) {
                    objDistanceEntity.setEmissionFactorByUser(it.getEmissionFactorByUser());
                } else {
                    objDistanceEntity.setEmissionFactorByUser(null);
                }
                if (it.getVehicleCategoryId() != null && it.getVehicleTypeId() != null) {
                    int configEmissionTypeId =
                            this.refConfigEmissionsTypeRepository.findByEtypeIdAndEtypeattrId1AndEtypeattrId2
                                    (
                                            emissionTypeId,
                                            it.getVehicleCategoryId(),
                                            it.getVehicleTypeId()
                                    ).getId();
                    objDistanceEntity.setCalcConfigEmissionsTypeId(configEmissionTypeId);
                    if (it.getDistanceUnitId() != null && it.getDistanceUnitId() != null) {
                        RefConfigEmissionsUnitFactorEntity refConfigEmissionsUnitFactorEntity
                                = this.refConfigEmissionsUnitFactorRepository.findByConfigEmissionTypeIdAndEtypeUnitId1
                                (configEmissionTypeId, it.getDistanceUnitId());

                        objDistanceEntity.setCalcConfigEmissionsUnitFactorId
                                (refConfigEmissionsUnitFactorEntity.getId());

                        BigDecimal convertedDistanceAmount = it.getDistanceAmountRaw().multiply
                                (refConfigEmissionsUnitFactorEntity.getEtypeUnitFactor1());
                        objDistanceEntity.setCalcDistanceAmountConverted(convertedDistanceAmount);
                        if (it.getEmissionFactorByUser() != null) {
                            BigDecimal tCo2 = convertedDistanceAmount.multiply(it.getEmissionFactorByUser())
                                    .multiply(refConfigEmissionsUnitFactorEntity.getEtypeUnitFactor2());
                            objDistanceEntity.setCalcTco2(tCo2);
                        } else {
                            if (it.getEmissionFactorId() != null) {
                                Optional<RefConfigEmissionsFactorEntity> refConfigEmissionsFactorEntity
                                        = this.refConfigEmissionsFactorRepository.findById(it.getEmissionFactorId());
                                if (refConfigEmissionsFactorEntity.isPresent()) {
                                    BigDecimal tCo2 = convertedDistanceAmount.multiply(refConfigEmissionsFactorEntity.get().getEmissionFactor())
                                            .multiply(refConfigEmissionsUnitFactorEntity.getEtypeUnitFactor2());
                                    objDistanceEntity.setCalcTco2(tCo2);
                                }
                            }
                        }
                    }
                }
                this.dataImpactmScope1DistanceRepository.save(objDistanceEntity);
            });
        } else if (parentEntity.getDataImpactmScope1Distance() != null && !parentEntity.getDataImpactmScope1Distance().isEmpty()) {
            List<DataImpactmScope1DistanceEntity> distanceList = parentEntity.getDataImpactmScope1Distance();
            distanceList.forEach(row -> {
                this.deleteDistance(row.getId());
            });
        }
    }

    private void updateRefrigerators(DataImpactmEmissionEntity parentEntity,
                                     DataImpactmEmissionModel dataModel,
                                     CustomUserDetailsModel user) {
        if (dataModel.getIsRefrigerators() && dataModel.getDataImpactmScope1Refrigerators() != null
                && !dataModel.getDataImpactmScope1Refrigerators().isEmpty()) {

            var emissionTypeId = this.refListRepository.findByListKeyAndListValueIgnoreCase
                    (RefEmissionTypeKey.IMPACTM_EMISSION_TYPE.getValue(), SCOPE1_REFRIGERATORS_CHILLERS.getValue()).get().getListId();

            List<DataImpactmScope1RefrigeratorsModel> listModel = dataModel.getDataImpactmScope1Refrigerators();
            listModel.forEach(it -> {
                DataImpactmScope1RefrigeratorsEntity objRefrigerators;
                if (it.getId() == null) {
                    objRefrigerators = new DataImpactmScope1RefrigeratorsEntity();
                    objRefrigerators.setAddedBy(user.getUsername());
                    objRefrigerators.setDateAdded(new Date());
                    objRefrigerators.setDataEmissionId(parentEntity.getId());
                } else {
                    objRefrigerators = this.dataImpactmScope1RefrigeratorsRepository.getById(it.getId());
                    objRefrigerators.setModifiedBy(user.getUsername());
                    objRefrigerators.setDateModified(new Date());
                }
                if (it.getApplianceTypeId() != null) {
                    objRefrigerators.setApplianceTypeId(it.getApplianceTypeId());
                }
                if (it.getAnnualTopupQuantity() != null) {
                    objRefrigerators.setAnnualTopupQuantity(it.getAnnualTopupQuantity());
                }
                if (it.getTopupUnitId() != null) {
                    objRefrigerators.setTopupUnitId(it.getTopupUnitId());
                }
                if (it.getIdentificationNumber() != null) {
                    objRefrigerators.setIdentificationNumber(it.getIdentificationNumber());
                }
                if (it.getCapacity() != null) {
                    objRefrigerators.setCapacity(it.getCapacity());
                }
                if (it.getReferigerantTypeId() != null) {
                    objRefrigerators.setReferigerantTypeId(it.getReferigerantTypeId());
                }
                if (it.getEmissionFactorId() != null) {
                    objRefrigerators.setEmissionFactorId(it.getEmissionFactorId());
                } else {
                    objRefrigerators.setEmissionFactorId(null);
                }
                if (it.getEmissionFactorByUser() != null) {
                    objRefrigerators.setEmissionFactorByUser(it.getEmissionFactorByUser());
                } else {
                    objRefrigerators.setEmissionFactorByUser(null);
                }
                if (it.getReferigerantTypeId() != null) {
                    int configEmissionTypeId =
                            this.refConfigEmissionsTypeRepository.findByEtypeIdAndEtypeattrId1
                                    (emissionTypeId, it.getReferigerantTypeId()).get(0).getId();
                    objRefrigerators.setCalcConfigEmissionsTypeId(configEmissionTypeId);
                    if (it.getTopupUnitId() != null && it.getAnnualTopupQuantity() != null) {
                        RefConfigEmissionsUnitFactorEntity refConfigEmissionsUnitFactorEntity
                                = this.refConfigEmissionsUnitFactorRepository.findByConfigEmissionTypeIdAndEtypeUnitId1
                                (configEmissionTypeId, it.getTopupUnitId());

                        objRefrigerators.setCalcConfigEmissionsUnitFactorId
                                (refConfigEmissionsUnitFactorEntity.getId());

                        BigDecimal convertedAmount = it.getAnnualTopupQuantity().multiply
                                (refConfigEmissionsUnitFactorEntity.getEtypeUnitFactor1());
                        objRefrigerators.setCalcAnnualTopupQuantityConverted(convertedAmount);
                        if (it.getEmissionFactorByUser() != null) {
                            BigDecimal tCo2 = convertedAmount.multiply(it.getEmissionFactorByUser())
                                    .multiply(refConfigEmissionsUnitFactorEntity.getEtypeUnitFactor2());
                            objRefrigerators.setCalcTco2(tCo2);
                        } else {
                            if (it.getEmissionFactorId() != null) {
                                Optional<RefConfigEmissionsFactorEntity> refConfigEmissionsFactorEntity
                                        = this.refConfigEmissionsFactorRepository.findById(it.getEmissionFactorId());
                                if (refConfigEmissionsFactorEntity.isPresent()) {
                                    BigDecimal tCo2 = convertedAmount.multiply(refConfigEmissionsFactorEntity.get().getEmissionFactor())
                                            .multiply(refConfigEmissionsUnitFactorEntity.getEtypeUnitFactor2());
                                    objRefrigerators.setCalcTco2(tCo2);
                                }
                            }
                        }
                    }
                }
                this.dataImpactmScope1RefrigeratorsRepository.save(objRefrigerators);
            });
        } else if (parentEntity.getDataImpactmScope1Refrigerators() != null && !parentEntity.getDataImpactmScope1Refrigerators().isEmpty()) {
            List<DataImpactmScope1RefrigeratorsEntity> refrigeratorsList = parentEntity.getDataImpactmScope1Refrigerators();
            refrigeratorsList.forEach(row -> {
                this.deleteRefrigerator(row.getId());
            });
        }
    }

    private void updateExtinguishers(DataImpactmEmissionEntity parentEntity,
                                     DataImpactmEmissionModel dataModel,
                                     CustomUserDetailsModel user) {
        if (dataModel.getIsFireExtinguisher() && dataModel.getDataImpactmScope1Extinguishers() != null && !dataModel.getDataImpactmScope1Extinguishers().isEmpty()) {

            var emissionTypeId = this.refListRepository.findByListKeyAndListValueIgnoreCase
                    (RefEmissionTypeKey.IMPACTM_EMISSION_TYPE.getValue(), SCOPE1_FIRE_EXTINGUISHERS.getValue()).get().getListId();

            List<DataImpactmScope1ExtinguishersModel> listModel = dataModel.getDataImpactmScope1Extinguishers();
            listModel.forEach(it -> {
                DataImpactmScope1ExtinguishersEntity objExtinguishers;
                if (it.getId() == null) {
                    objExtinguishers = new DataImpactmScope1ExtinguishersEntity();
                    objExtinguishers.setAddedBy(user.getUsername());
                    objExtinguishers.setDateAdded(new Date());
                    objExtinguishers.setDataEmissionId(parentEntity.getId());
                } else {
                    objExtinguishers = this.dataImpactmScope1ExtinguishersRepository.getById(it.getId());
                    objExtinguishers.setModifiedBy(user.getUsername());
                    objExtinguishers.setDateModified(new Date());
                }
                if (it.getApplianceTypeId() != null) {
                    objExtinguishers.setApplianceTypeId(it.getApplianceTypeId());
                }
                if (it.getAnnualTopupQuantity() != null) {
                    objExtinguishers.setAnnualTopupQuantity(it.getAnnualTopupQuantity());
                }
                if (it.getTopupUnitId() != null) {
                    objExtinguishers.setTopupUnitId(it.getTopupUnitId());
                }
                if (it.getIdentificationNumber() != null) {
                    objExtinguishers.setIdentificationNumber(it.getIdentificationNumber());
                }
                if (it.getEmissionFactorId() != null) {
                    objExtinguishers.setEmissionFactorId(it.getEmissionFactorId());
                } else {
                    objExtinguishers.setEmissionFactorId(null);
                }
                if (it.getEmissionFactorByUser() != null) {
                    objExtinguishers.setEmissionFactorByUser(it.getEmissionFactorByUser());
                } else {
                    objExtinguishers.setEmissionFactorByUser(null);
                }
                int configEmissionTypeId =
                        this.refConfigEmissionsTypeRepository.findByEtypeIdAndEtypeattrId1
                                (emissionTypeId, emissionTypeId).get(0).getId();
                objExtinguishers.setCalcConfigEmissionsTypeId(configEmissionTypeId);

                if (it.getTopupUnitId() != null && it.getAnnualTopupQuantity() != null) {
                    RefConfigEmissionsUnitFactorEntity refConfigEmissionsUnitFactorEntity
                            = this.refConfigEmissionsUnitFactorRepository.findByConfigEmissionTypeIdAndEtypeUnitId1
                            (configEmissionTypeId, it.getTopupUnitId());

                    objExtinguishers.setCalcConfigEmissionsUnitFactorId
                            (refConfigEmissionsUnitFactorEntity.getId());

                    BigDecimal convertedAmount = it.getAnnualTopupQuantity().multiply
                            (refConfigEmissionsUnitFactorEntity.getEtypeUnitFactor1());
                    objExtinguishers.setCalcAnnualTopupQuantityConverted(convertedAmount);
                    if (it.getEmissionFactorByUser() != null) {
                        BigDecimal tCo2 = convertedAmount.multiply(it.getEmissionFactorByUser())
                                .multiply(refConfigEmissionsUnitFactorEntity.getEtypeUnitFactor2());
                        objExtinguishers.setCalcTco2(tCo2);
                    } else {
                        if (it.getEmissionFactorId() != null) {
                            Optional<RefConfigEmissionsFactorEntity> refConfigEmissionsFactorEntity
                                    = this.refConfigEmissionsFactorRepository.findById(it.getEmissionFactorId());
                            if (refConfigEmissionsFactorEntity.isPresent()) {
                                BigDecimal tCo2 = convertedAmount.multiply(refConfigEmissionsFactorEntity.get().getEmissionFactor())
                                        .multiply(refConfigEmissionsUnitFactorEntity.getEtypeUnitFactor2());
                                objExtinguishers.setCalcTco2(tCo2);
                            }
                        }
                    }
                }
                this.dataImpactmScope1ExtinguishersRepository.save(objExtinguishers);
            });
        } else if (parentEntity.getDataImpactmScope1Extinguishers() != null && !parentEntity.getDataImpactmScope1Extinguishers().isEmpty()) {
            List<DataImpactmScope1ExtinguishersEntity> extinguisherslist = parentEntity.getDataImpactmScope1Extinguishers();
            extinguisherslist.forEach(row -> {
                this.deleteExtinguisher(row.getId());
            });
        }
    }

    private void updateElectricity(DataImpactmEmissionEntity parentEntity,
                                   DataImpactmEmissionModel dataModel,
                                   CustomUserDetailsModel user) {
        if (dataModel.getDataImpactmScope2Electricity() != null && !dataModel.getDataImpactmScope2Electricity().isEmpty()) {

            var emissionTypeId = this.refListRepository.findByListKeyAndListValueIgnoreCase
                    (RefEmissionTypeKey.IMPACTM_EMISSION_TYPE.getValue(), SCOPE2_GRID_EMISSION.getValue()).get().getListId();

            List<DataImpactmScope2ElectricityModel> listModel = dataModel.getDataImpactmScope2Electricity();
            listModel.forEach(it -> {
                DataImpactmScope2ElectricityEntity objElectricity;
                if (it.getId() == null) {
                    objElectricity = new DataImpactmScope2ElectricityEntity();
                    objElectricity.setAddedBy(user.getUsername());
                    objElectricity.setDateAdded(new Date());
                    objElectricity.setDataEmissionId(parentEntity.getId());
                } else {
                    objElectricity = this.dataImpactmScope2ElectricityRepository.getById(it.getId());
                    objElectricity.setModifiedBy(user.getUsername());
                    objElectricity.setDateModified(new Date());
                }
                objElectricity.setFacilityId(it.getFacilityId());

                if (it.getTotalElectricityAmountRaw() != null) {
                    objElectricity.setTotalElectricityAmountRaw(it.getTotalElectricityAmountRaw());
                }
                if (it.getTotalElectricityUnitId() != null) {
                    objElectricity.setTotalElectricityUnitId(it.getTotalElectricityUnitId());
                }
                if (it.getTotalRenewableAmountRaw() != null) {
                    objElectricity.setTotalRenewableAmountRaw(it.getTotalRenewableAmountRaw());
                }
                if (it.getTotalRenewableUnitId() != null) {
                    objElectricity.setTotalRenewableUnitId(it.getTotalRenewableUnitId());
                }
                if (it.getEmissionFactorId() != null) {
                    objElectricity.setEmissionFactorId(it.getEmissionFactorId());
                } else {
                    objElectricity.setEmissionFactorId(null);
                }
                if (it.getEmissionFactorByUser() != null) {
                    objElectricity.setEmissionFactorByUser(it.getEmissionFactorByUser());
                } else {
                    objElectricity.setEmissionFactorByUser(null);
                }
                int configEmissionTypeId =
                        this.refConfigEmissionsTypeRepository.findByEtypeIdAndEtypeattrId1
                                (emissionTypeId, emissionTypeId).get(0).getId();
                objElectricity.setCalcConfigEmissionsTypeId(configEmissionTypeId);

                if (it.getTotalElectricityUnitId() != null && it.getTotalElectricityAmountRaw() != null) {
                    RefConfigEmissionsUnitFactorEntity refConfigEmissionsUnitFactorEntity
                            = this.refConfigEmissionsUnitFactorRepository.findByConfigEmissionTypeIdAndEtypeUnitId1
                            (configEmissionTypeId, it.getTotalElectricityUnitId());

                    objElectricity.setCalcConfigEmissionsUnitFactorId
                            (refConfigEmissionsUnitFactorEntity.getId());

                    BigDecimal convertedAmount = it.getTotalElectricityAmountRaw().multiply
                            (refConfigEmissionsUnitFactorEntity.getEtypeUnitFactor1());
                    objElectricity.setCalcTotalElectricityAmountConverted(convertedAmount);
                    if (it.getEmissionFactorByUser() != null) {
                        BigDecimal tCo2 = convertedAmount.multiply(it.getEmissionFactorByUser())
                                .multiply(refConfigEmissionsUnitFactorEntity.getEtypeUnitFactor2());
                        objElectricity.setCalcTco2(tCo2);
                    } else {
                        if (it.getEmissionFactorId() != null) {
                            Optional<RefConfigEmissionsFactorEntity> refConfigEmissionsFactorEntity
                                    = this.refConfigEmissionsFactorRepository.findById(it.getEmissionFactorId());
                            if (refConfigEmissionsFactorEntity.isPresent()) {
                                BigDecimal tCo2 = convertedAmount.multiply(refConfigEmissionsFactorEntity.get().getEmissionFactor())
                                        .multiply(refConfigEmissionsUnitFactorEntity.getEtypeUnitFactor2());
                                objElectricity.setCalcTco2(tCo2);
                            }
                        }
                    }
                }
                this.dataImpactmScope2ElectricityRepository.save(objElectricity);
            });
        } else if (parentEntity.getDataImpactmScope2Electricity() != null && !parentEntity.getDataImpactmScope2Electricity().isEmpty()) {
            List<DataImpactmScope2ElectricityEntity> electricityLit = parentEntity.getDataImpactmScope2Electricity();
            electricityLit.forEach(row -> {
                this.deleteElectricity(row.getId());
            });
        }
    }

    private void updateEmployeeCommute(DataImpactmEmissionEntity parentEntity,
                                       DataImpactmEmissionModel dataModel,
                                       CustomUserDetailsModel user) {
        if (dataModel.getDataImpactmScope3EmployeeCommute() != null
                && !dataModel.getDataImpactmScope3EmployeeCommute().isEmpty()) {
            var emissionTypeId = this.refListRepository.findByListKeyAndListValueIgnoreCase
                    (RefEmissionTypeKey.IMPACTM_EMISSION_TYPE.getValue(), SCOPE3_EMPLOYEE_COMMUTE.getValue()).get().getListId();
            var isDistanceAvailable = false;
            List<DataImpactmScope3EmployeeCommuteModel> listModel = dataModel.getDataImpactmScope3EmployeeCommute();
            listModel.forEach(it -> {
                DataImpactmScope3EmployeeCommuteEntity objEmployeeCommute;
                if (it.getId() == null) {
                    objEmployeeCommute = new DataImpactmScope3EmployeeCommuteEntity();
                    objEmployeeCommute.setAddedBy(user.getUsername());
                    objEmployeeCommute.setDateAdded(new Date());
                    objEmployeeCommute.setDataEmissionId(parentEntity.getId());
                } else {
                    objEmployeeCommute = this.dataImpactmScope3EmployeeCommuteRepository.getById(it.getId());
                    objEmployeeCommute.setModifiedBy(user.getUsername());
                    objEmployeeCommute.setDateModified(new Date());
                }
                objEmployeeCommute.setFacilityId(it.getFacilityId());
                objEmployeeCommute.setEmployeeId(null);
                objEmployeeCommute.setEmployeePercentage(null);
                objEmployeeCommute.setDistanceTravelledYearly(null);
                objEmployeeCommute.setDistanceTravelledDaily(null);
                objEmployeeCommute.setTransportationMode(null);
                objEmployeeCommute.setDistanceUnitId(null);
                objEmployeeCommute.setEmissionFactorId(null);
                objEmployeeCommute.setEmissionFactorByUser(null);
                objEmployeeCommute.setCalcTotalDistanceConverted(null);
                objEmployeeCommute.setCalcTco2(null);

                if (parentEntity.getIsEmployeeCommuteCompleteData() || parentEntity.getIsEmployeeCommutePartialData()) {
                    if (it.getEmployeeId() != null) {
                        objEmployeeCommute.setEmployeeId(it.getEmployeeId());
                    }
                    if (parentEntity.getIsEmployeeCommuteCompleteData()) {
                        if (it.getDistanceTravelledYearly() != null
                                && it.getDistanceTravelledYearly().compareTo(BigDecimal.ZERO) != 0) {
                            objEmployeeCommute.setDistanceTravelledYearly(it.getDistanceTravelledYearly());
                        }
                    }
                    if (parentEntity.getIsEmployeeCommutePartialData()) {
                        if (it.getDistanceTravelledDaily() != null
                                && it.getDistanceTravelledDaily().compareTo(BigDecimal.ZERO) != 0) {
                            objEmployeeCommute.setDistanceTravelledDaily(it.getDistanceTravelledDaily());
                        }
                    }

                } else if (parentEntity.getIsEmployeeCommuteApproximateData()) {
                    if (it.getEmployeePercentage() != null) {
                        objEmployeeCommute.setEmployeePercentage(it.getEmployeePercentage());
                    }
                    if (it.getDistanceTravelledDaily() != null
                            && it.getDistanceTravelledDaily().compareTo(BigDecimal.ZERO) != 0) {
                        objEmployeeCommute.setDistanceTravelledDaily(it.getDistanceTravelledDaily());
                    }
                }

                if (it.getTransportationModeId() != null && it.getTransportationModeId() > 0) {
                    objEmployeeCommute.setTransportationModeId(it.getTransportationModeId());
                }
                if (it.getDistanceUnitId() != null) {
                    objEmployeeCommute.setDistanceUnitId(it.getDistanceUnitId());
                }
                if (it.getEmissionFactorId() != null) {
                    objEmployeeCommute.setEmissionFactorId(it.getEmissionFactorId());
                }
                if (it.getEmissionFactorByUser() != null) {
                    objEmployeeCommute.setEmissionFactorByUser(it.getEmissionFactorByUser());
                }
                if (objEmployeeCommute.getTransportationModeId() != null) {
                    int configEmissionTypeId =
                            this.refConfigEmissionsTypeRepository.findByEtypeIdAndEtypeattrId1
                                    (emissionTypeId, objEmployeeCommute.getTransportationModeId()).get(0).getId();
                    objEmployeeCommute.setCalcConfigEmissionsTypeId(configEmissionTypeId);

                    if (it.getDistanceUnitId() != null) {
                        RefConfigEmissionsUnitFactorEntity refConfigEmissionsUnitFactorEntity
                                = this.refConfigEmissionsUnitFactorRepository.findByConfigEmissionTypeIdAndEtypeUnitId1
                                (configEmissionTypeId, it.getDistanceUnitId());
                        objEmployeeCommute.setCalcConfigEmissionsUnitFactorId(refConfigEmissionsUnitFactorEntity.getId());
                        BigDecimal convertedAmount = BigDecimal.ZERO;
                        if (objEmployeeCommute.getDistanceTravelledYearly() != null) {
                            convertedAmount = it.getDistanceTravelledYearly().multiply
                                    (refConfigEmissionsUnitFactorEntity.getEtypeUnitFactor1());
                            objEmployeeCommute.setCalcTotalDistanceConverted(convertedAmount);
                        } else if (objEmployeeCommute.getDistanceTravelledDaily() != null) {
                            convertedAmount = it.getDistanceTravelledDaily().multiply
                                            (refConfigEmissionsUnitFactorEntity.getEtypeUnitFactor1())
                                    .multiply(BigDecimal.valueOf(NUMBER_OF_BUSINESS_DAYS_IN_YEAR));
                            objEmployeeCommute.setCalcTotalDistanceConverted(convertedAmount);
                        }
                        if (it.getEmissionFactorByUser() != null) {
                            BigDecimal tCo2 = convertedAmount.multiply(it.getEmissionFactorByUser())
                                    .multiply(refConfigEmissionsUnitFactorEntity.getEtypeUnitFactor2());
                            objEmployeeCommute.setCalcTco2(tCo2);
                        } else {
                            if (it.getEmissionFactorId() != null) {
                                Optional<RefConfigEmissionsFactorEntity> refConfigEmissionsFactorEntity
                                        = this.refConfigEmissionsFactorRepository.findById(it.getEmissionFactorId());
                                if (refConfigEmissionsFactorEntity.isPresent()) {
                                    BigDecimal tCo2 = convertedAmount.multiply(refConfigEmissionsFactorEntity.get().getEmissionFactor())
                                            .multiply(refConfigEmissionsUnitFactorEntity.getEtypeUnitFactor2());
                                    objEmployeeCommute.setCalcTco2(tCo2);
                                }
                            }
                        }
                    }
                }
                this.dataImpactmScope3EmployeeCommuteRepository.save(objEmployeeCommute);
            });
        } else if (parentEntity.getDataImpactmScope3EmployeeCommute() != null
                && !parentEntity.getDataImpactmScope3EmployeeCommute().isEmpty()) {
            List<DataImpactmScope3EmployeeCommuteEntity> electricityLit = parentEntity.getDataImpactmScope3EmployeeCommute();
            electricityLit.forEach(row -> {
                this.deleteEmployeeCommute(row.getId());
            });
        }
    }

    private void updateBusinessTravel(DataImpactmEmissionEntity parentEntity,
                                      DataImpactmEmissionModel dataModel,
                                      CustomUserDetailsModel user) {
        if (dataModel.getDataImpactmScope3BusinessTravel() != null
                && !dataModel.getDataImpactmScope3BusinessTravel().isEmpty()) {
            var emissionTypeId = this.refListRepository.findByListKeyAndListValueIgnoreCase
                    (RefEmissionTypeKey.IMPACTM_EMISSION_TYPE.getValue(), SCOPE3_BUSINESS_TRAVEL.getValue()).get().getListId();
            List<DataImpactmScope3BusinessTravelModel> listModel = dataModel.getDataImpactmScope3BusinessTravel();
            listModel.forEach(it -> {
                DataImpactmScope3BusinessTravelEntity objBusinessTravelEntity;
                if (it.getId() == null) {
                    objBusinessTravelEntity = new DataImpactmScope3BusinessTravelEntity();
                    objBusinessTravelEntity.setAddedBy(user.getUsername());
                    objBusinessTravelEntity.setDateAdded(new Date());
                    objBusinessTravelEntity.setDataEmissionId(parentEntity.getId());
                } else {
                    objBusinessTravelEntity = this.dataImpactmScope3BusinessTravelRepository.getById(it.getId());
                    objBusinessTravelEntity.setModifiedBy(user.getUsername());
                    objBusinessTravelEntity.setDateModified(new Date());
                }
                objBusinessTravelEntity.setFacilityId(it.getFacilityId());
                objBusinessTravelEntity.setEmployeeId(null);
                objBusinessTravelEntity.setDistanceTravelledYearly(null);
                objBusinessTravelEntity.setTransportationMode(null);
                objBusinessTravelEntity.setDistanceUnitId(null);
                objBusinessTravelEntity.setEmissionFactorId(null);
                objBusinessTravelEntity.setEmissionFactorByUser(null);
                objBusinessTravelEntity.setCalcTotalDistanceConverted(null);
                objBusinessTravelEntity.setCalcTco2(null);

                if (it.getEmployeeId() != null) {
                    objBusinessTravelEntity.setEmployeeId(it.getEmployeeId());
                }
                if (it.getDistanceTravelledYearly() != null
                        && it.getDistanceTravelledYearly().compareTo(BigDecimal.ZERO) != 0) {
                    objBusinessTravelEntity.setDistanceTravelledYearly(it.getDistanceTravelledYearly());
                }

                if (it.getTransportationModeId() != null && it.getTransportationModeId() > 0) {
                    objBusinessTravelEntity.setTransportationModeId(it.getTransportationModeId());
                }
                if (it.getDistanceUnitId() != null) {
                    objBusinessTravelEntity.setDistanceUnitId(it.getDistanceUnitId());
                }
                if (it.getEmissionFactorId() != null) {
                    objBusinessTravelEntity.setEmissionFactorId(it.getEmissionFactorId());
                }
                if (it.getEmissionFactorByUser() != null) {
                    objBusinessTravelEntity.setEmissionFactorByUser(it.getEmissionFactorByUser());
                }
                if (objBusinessTravelEntity.getTransportationModeId() != null) {
                    int configEmissionTypeId =
                            this.refConfigEmissionsTypeRepository.findByEtypeIdAndEtypeattrId1
                                    (emissionTypeId, objBusinessTravelEntity.getTransportationModeId()).get(0).getId();
                    objBusinessTravelEntity.setCalcConfigEmissionsTypeId(configEmissionTypeId);

                    if (it.getDistanceUnitId() != null) {
                        RefConfigEmissionsUnitFactorEntity refConfigEmissionsUnitFactorEntity
                                = this.refConfigEmissionsUnitFactorRepository.findByConfigEmissionTypeIdAndEtypeUnitId1
                                (configEmissionTypeId, it.getDistanceUnitId());
                        objBusinessTravelEntity.setCalcConfigEmissionsUnitFactorId(refConfigEmissionsUnitFactorEntity.getId());
                        BigDecimal convertedAmount = BigDecimal.ZERO;
                        if (objBusinessTravelEntity.getDistanceTravelledYearly() != null) {
                            convertedAmount = it.getDistanceTravelledYearly().multiply
                                    (refConfigEmissionsUnitFactorEntity.getEtypeUnitFactor1());
                            objBusinessTravelEntity.setCalcTotalDistanceConverted(convertedAmount);
                        }
                        if (it.getEmissionFactorByUser() != null) {
                            BigDecimal tCo2 = convertedAmount.multiply(it.getEmissionFactorByUser())
                                    .multiply(refConfigEmissionsUnitFactorEntity.getEtypeUnitFactor2());
                            objBusinessTravelEntity.setCalcTco2(tCo2);
                        } else {
                            if (it.getEmissionFactorId() != null) {
                                Optional<RefConfigEmissionsFactorEntity> refConfigEmissionsFactorEntity
                                        = this.refConfigEmissionsFactorRepository.findById(it.getEmissionFactorId());
                                if (refConfigEmissionsFactorEntity.isPresent()) {
                                    BigDecimal tCo2 = convertedAmount.multiply(refConfigEmissionsFactorEntity.get().getEmissionFactor())
                                            .multiply(refConfigEmissionsUnitFactorEntity.getEtypeUnitFactor2());
                                    objBusinessTravelEntity.setCalcTco2(tCo2);
                                }
                            }
                        }
                    }
                }
                this.dataImpactmScope3BusinessTravelRepository.save(objBusinessTravelEntity);
            });
        } else if (parentEntity.getDataImpactmScope3BusinessTravel() != null
                && !parentEntity.getDataImpactmScope3BusinessTravel().isEmpty()) {
            List<DataImpactmScope3BusinessTravelEntity> list = parentEntity.getDataImpactmScope3BusinessTravel();
            list.forEach(row -> {
                this.deleteBusinessTravel(row.getId());
            });
        }
    }

    public void deleteStationaryFuel(Integer Id) {
        this.dataImpactmScope1FuelCombustionRepository.deleteById(Id);
    }

    public void deleteMobileFuel(Integer Id) {
        this.dataImpactmScope1FuelCombustionRepository.deleteById(Id);
    }

    public void deleteDistance(Integer Id) {
        this.dataImpactmScope1DistanceRepository.deleteById(Id);
    }

    public void deleteRefrigerator(Integer Id) {
        this.dataImpactmScope1RefrigeratorsRepository.deleteById(Id);
    }

    public void deleteExtinguisher(Integer Id) {
        this.dataImpactmScope1ExtinguishersRepository.deleteById(Id);
    }

    public void deleteElectricity(Integer Id) {
        this.dataImpactmScope2ElectricityRepository.deleteById(Id);
    }

    public void deleteEmployeeCommute(Integer Id) {
        this.dataImpactmScope3EmployeeCommuteRepository.deleteById(Id);
    }

    public void deleteBusinessTravel(Integer Id) {
        this.dataImpactmScope3BusinessTravelRepository.deleteById(Id);
    }

}
