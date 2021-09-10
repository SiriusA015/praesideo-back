package earth.praesideo.services;

import earth.praesideo.database.entities.common.*;
import earth.praesideo.database.entities.users.CompanyEntity;
import earth.praesideo.database.repositories.common.*;
import earth.praesideo.database.repositories.users.CompanyRepository;
import earth.praesideo.enums.RefEmissionTypeKey;
import earth.praesideo.enums.RefEmissionTypeValue;
import earth.praesideo.enums.RefListKey;
import earth.praesideo.models.restapi.impactm.DataImpactmRefModel;
import earth.praesideo.services.ref.RefListService;
import org.joda.time.YearMonth;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;
import java.util.stream.Collectors;

import static earth.praesideo.enums.RefEmissionTypeValue.*;

@Service
public class ImpactmRefService {
    private final RefConfigEmissionsFactorRepository refConfigEmissionsFactorRepository;
    private final RefConfigEmissionsTypeRepository refConfigEmissionsTypeRepository;
    private final CompanyService companyService;
    private final RefCountryRepository refCountryRepository;
    private final RefRegionsRepository refRegionsRepository;
    private final RefCountryChildRepository refCountryChildRepository;
    private final ModelMapper modelMapper;
    private final YearRepresentationRepository yearRepresentationRepository;
    private final RefListService refListService;

    private static final Integer CONST_CONTINENT_ID_EUROPE = 4;

    @Autowired
    public ImpactmRefService(RefConfigEmissionsFactorRepository refConfigEmissionsFactorRepository,
                             RefConfigEmissionsTypeRepository refConfigEmissionsTypeRepository,
                             RefCountryRepository refCountryRepository,
                             YearRepresentationRepository yearRepresentationRepository,
                             RefRegionsRepository refRegionsRepository,
                             RefListService refListService,
                             CompanyService companyService,
                             RefCountryChildRepository refCountryChildRepository,
                             ModelMapper modelMapper) {
        this.refConfigEmissionsFactorRepository = refConfigEmissionsFactorRepository;
        this.refConfigEmissionsTypeRepository = refConfigEmissionsTypeRepository;
        this.modelMapper = modelMapper;
        this.refCountryRepository = refCountryRepository;
        this.yearRepresentationRepository = yearRepresentationRepository;
        this.refRegionsRepository = refRegionsRepository;
        this.refCountryChildRepository = refCountryChildRepository;
        this.refListService = refListService;
        this.companyService = companyService;
    }

    public ArrayList<DataImpactmRefModel> getImpactMeasurementRefData(Integer companyId) {

        List<RefConfigEmissionsFactorEntity> listConfigEmissionFactors = this.getEmissionFactorForCompanyIdAndYearRepresentationId(
                companyId, this.companyService.getCompanyEntityById(companyId).getYearRepresentationId());

        List<RefConfigEmissionsTypeEntity> allRecords = refConfigEmissionsTypeRepository.findAll();
        List<Integer> listConfigEmissionTypeIds =
                listConfigEmissionFactors.stream().map(RefConfigEmissionsFactorEntity::getConfigEtypeId).collect(Collectors.toList());

        Collection<RefConfigEmissionsTypeEntity> filteredRecords =
                allRecords.stream().filter(row -> listConfigEmissionTypeIds.contains(row.getId())).collect(Collectors.toList());

        return populateRefListDataModel(filteredRecords);
    }

    private ArrayList<DataImpactmRefModel> populateRefListDataModel
            (Collection<RefConfigEmissionsTypeEntity> listRefConfigEmissionsTypeEntity) {

        int eTypeIdStationaryFuel = this.refListService.getRefListEntityByKeyValue
                (RefEmissionTypeKey.IMPACTM_EMISSION_TYPE.getValue(), SCOPE1_STATIONARY_FUEL_COMBUSTION.getValue()).get().getListId();
        int eTypeIdMobileFuel = this.refListService.getRefListEntityByKeyValue
                (RefEmissionTypeKey.IMPACTM_EMISSION_TYPE.getValue(), SCOPE1_MOBILE_FUEL_COMBUSTION.getValue()).get().getListId();
        int eTypeIdDistance = this.refListService.getRefListEntityByKeyValue
                (RefEmissionTypeKey.IMPACTM_EMISSION_TYPE.getValue(), SCOPE1_DISTANCE_TRAVELLED.getValue()).get().getListId();
        int eTypeIdRefrigerator = this.refListService.getRefListEntityByKeyValue
                (RefEmissionTypeKey.IMPACTM_EMISSION_TYPE.getValue(), SCOPE1_REFRIGERATORS_CHILLERS.getValue()).get().getListId();
        int eTypeIdExtinguisher = this.refListService.getRefListEntityByKeyValue
                (RefEmissionTypeKey.IMPACTM_EMISSION_TYPE.getValue(), SCOPE1_FIRE_EXTINGUISHERS.getValue()).get().getListId();
        int eTypeIdElectricity = this.refListService.getRefListEntityByKeyValue
                (RefEmissionTypeKey.IMPACTM_EMISSION_TYPE.getValue(), SCOPE2_GRID_EMISSION.getValue()).get().getListId();
        int eTypeIdEmployeeCommute = this.refListService.getRefListEntityByKeyValue
                (RefEmissionTypeKey.IMPACTM_EMISSION_TYPE.getValue(), SCOPE3_EMPLOYEE_COMMUTE.getValue()).get().getListId();
        int eTypeIdBusinessTravel = this.refListService.getRefListEntityByKeyValue
                (RefEmissionTypeKey.IMPACTM_EMISSION_TYPE.getValue(), SCOPE3_BUSINESS_TRAVEL.getValue()).get().getListId();

        ArrayList<DataImpactmRefModel> collDataModel = new ArrayList<>();

        DataImpactmRefModel objStationaryFuel = new DataImpactmRefModel();
        objStationaryFuel.setListId(eTypeIdStationaryFuel);
        objStationaryFuel.setListValue(SCOPE1_STATIONARY_FUEL_COMBUSTION.getValue());
        ArrayList<DataImpactmRefModel> stationaryFuelTypes = new ArrayList<>();

        DataImpactmRefModel objMobileFuel = new DataImpactmRefModel();
        objMobileFuel.setListId(eTypeIdMobileFuel);
        objMobileFuel.setListValue(SCOPE1_MOBILE_FUEL_COMBUSTION.getValue());
        ArrayList<DataImpactmRefModel> mobileFuelTypes = new ArrayList<>();

        DataImpactmRefModel objDistance = new DataImpactmRefModel();
        objDistance.setListId(eTypeIdDistance);
        objDistance.setListValue(SCOPE1_DISTANCE_TRAVELLED.getValue());
        ArrayList<DataImpactmRefModel> vehicleCategories = new ArrayList<>();

        DataImpactmRefModel objRefrigerator = new DataImpactmRefModel();
        objRefrigerator.setListId(eTypeIdRefrigerator);
        objRefrigerator.setListValue(SCOPE1_REFRIGERATORS_CHILLERS.getValue());
        ArrayList<DataImpactmRefModel> refrigeratorList = new ArrayList<>();

        DataImpactmRefModel objExtinguisher = new DataImpactmRefModel();
        objExtinguisher.setListId(eTypeIdExtinguisher);
        objExtinguisher.setListValue(SCOPE1_FIRE_EXTINGUISHERS.getValue());
        ArrayList<DataImpactmRefModel> extinguisherList = new ArrayList<>();

        DataImpactmRefModel objElectricity = new DataImpactmRefModel();
        objElectricity.setListId(eTypeIdElectricity);
        objElectricity.setListValue(SCOPE2_GRID_EMISSION.getValue());
        ArrayList<DataImpactmRefModel> electricity = new ArrayList<>();

        DataImpactmRefModel objEmployeeCommute = new DataImpactmRefModel();
        objEmployeeCommute.setListId(eTypeIdEmployeeCommute);
        objEmployeeCommute.setListValue(SCOPE3_EMPLOYEE_COMMUTE.getValue());
        ArrayList<DataImpactmRefModel> employeeCommute = new ArrayList<>();

        DataImpactmRefModel objBusinessTravel = new DataImpactmRefModel();
        objBusinessTravel.setListId(eTypeIdBusinessTravel);
        objBusinessTravel.setListValue(SCOPE3_BUSINESS_TRAVEL.getValue());
        ArrayList<DataImpactmRefModel> businessTravel = new ArrayList<>();

        listRefConfigEmissionsTypeEntity.forEach(row -> {
            DataImpactmRefModel attributeRow1 =
                    modelMapper.map(row.getEtypeattr1(), DataImpactmRefModel.class);

            DataImpactmRefModel attributeRow2 = null;
            if (row.getEtypeattr2() != null) {
                attributeRow2 = modelMapper.map(row.getEtypeattr2(), DataImpactmRefModel.class);
            }
            ArrayList<DataImpactmRefModel> units = new ArrayList<>();
            row.getRefConfigEmissionsUnitFactor().forEach(rowInner -> {
                units.add(modelMapper.map(rowInner.getEtypeUnit1(), DataImpactmRefModel.class));
            });
            if (row.getEtypeId().equals(eTypeIdStationaryFuel)) {
                checkAndAddFuelTypes(stationaryFuelTypes, attributeRow1, units);
            }
            if (row.getEtypeId().equals(eTypeIdMobileFuel)) {
                checkAndAddFuelTypes(mobileFuelTypes, attributeRow1, units);
            }
            if (row.getEtypeId().equals(eTypeIdDistance)) {
                checkAndAddToVehicleCategoryList(vehicleCategories, attributeRow1, attributeRow2, units);
            }
            if (row.getEtypeId().equals(eTypeIdRefrigerator)) {
                attributeRow1.setChildList(units);
                refrigeratorList.add(attributeRow1);
            }
            if (row.getEtypeId().equals(eTypeIdExtinguisher)) {
                attributeRow1.setChildList(units);
                extinguisherList.add(attributeRow1);
            }
            if (row.getEtypeId().equals(eTypeIdElectricity)) {
                attributeRow1.setChildList(units);
                electricity.add(attributeRow1);
            }
            if (row.getEtypeId().equals(eTypeIdEmployeeCommute)) {
                attributeRow1.setChildList(units);
                employeeCommute.add(attributeRow1);
            }
            if (row.getEtypeId().equals(eTypeIdBusinessTravel)) {
                attributeRow1.setChildList(units);
                businessTravel.add(attributeRow1);
            }
        });
        objStationaryFuel.setChildList(stationaryFuelTypes);
        objMobileFuel.setChildList(mobileFuelTypes);
        objDistance.setChildList(vehicleCategories);
        objRefrigerator.setChildList(refrigeratorList);
        objExtinguisher.setChildList(extinguisherList);
        objElectricity.setChildList(electricity);
        objEmployeeCommute.setChildList(employeeCommute);
        objBusinessTravel.setChildList(businessTravel);

        collDataModel.add(objStationaryFuel);
        collDataModel.add(objMobileFuel);
        collDataModel.add(objDistance);
        collDataModel.add(objRefrigerator);
        collDataModel.add(objExtinguisher);
        collDataModel.add(objElectricity);
        collDataModel.add(objEmployeeCommute);
        collDataModel.add(objBusinessTravel);

        ArrayList<DataImpactmRefModel> applianceTypes = new ArrayList<>();
        this.refListService.getRefListEntityByKey(RefListKey.IMPACTM_REFRIGERATOR_TYPE.getValue()).forEach(row -> {
            applianceTypes.add(modelMapper.map(row, DataImpactmRefModel.class));
        });

        DataImpactmRefModel objAppliance = new DataImpactmRefModel();
        objAppliance.setListValue(RefListKey.IMPACTM_REFRIGERATOR_TYPE.getValue());
        objAppliance.setChildList(applianceTypes);
        collDataModel.add(objAppliance);

        ArrayList<DataImpactmRefModel> applianceTypesExtinguisher = new ArrayList<>();
        this.refListService.getRefListEntityByKey(RefListKey.IMPACTM_EXTINGUISHER_TYPE.getValue()).forEach(row -> {
            applianceTypesExtinguisher.add(modelMapper.map(row, DataImpactmRefModel.class));
        });
        DataImpactmRefModel objApplianceTypeExtinguisher = new DataImpactmRefModel();
        objApplianceTypeExtinguisher.setListValue(RefListKey.IMPACTM_EXTINGUISHER_TYPE.getValue());
        objApplianceTypeExtinguisher.setChildList(applianceTypesExtinguisher);
        collDataModel.add(objApplianceTypeExtinguisher);

        return collDataModel;
    }

    private void checkAndAddFuelTypes(ArrayList<DataImpactmRefModel> fuelTypes,
                                      DataImpactmRefModel attributeRow1,
                                      ArrayList<DataImpactmRefModel> units) {
        boolean isPresent = false;
        for (DataImpactmRefModel row : fuelTypes) {
            if (row.getListId().equals(attributeRow1.getListId())) {
                isPresent = true;
                ArrayList<DataImpactmRefModel> existingUnits= row.getChildList();
                for (DataImpactmRefModel unitRow: units) {
                    existingUnits.add(unitRow);
                }
                row.setChildList(existingUnits);
                break;
            }
        }
        if (!isPresent) {
            attributeRow1.setChildList(units);
            fuelTypes.add(attributeRow1);
        }
    }

    private void checkAndAddToVehicleCategoryList
            (ArrayList<DataImpactmRefModel> vehicleCategories,
             DataImpactmRefModel vehicleCategoryInput,
             DataImpactmRefModel vehicleTypeInput,
             ArrayList<DataImpactmRefModel> units
            ) {
        boolean isVehicleCategoryInList = false;
        vehicleTypeInput.setChildList(units);
        for (DataImpactmRefModel category : vehicleCategories) {
            if (category.getListId().equals(vehicleCategoryInput.getListId())) {
                isVehicleCategoryInList = true;
                ArrayList<DataImpactmRefModel> vehicleTypes = category.getChildList();
                vehicleTypes.add(vehicleTypeInput);
                category.setChildList(vehicleTypes);
                break;
            }
        }
        if (!isVehicleCategoryInList) {
            ArrayList<DataImpactmRefModel> vt = new ArrayList<>();
            vt.add(vehicleTypeInput);
            vehicleCategoryInput.setChildList(vt);
            vehicleCategories.add(vehicleCategoryInput);
        }
    }

    public List<RefConfigEmissionsFactorEntity> getEmissionFactorForCompanyIdAndYearRepresentationId(Integer companyId, Integer yearRepresentationId) {

        List<RefConfigEmissionsFactorEntity> filteredList = new LinkedList<>();
        YearRepresentationEntity YearRepresentationEntity = this.yearRepresentationRepository.findById(yearRepresentationId).get();
        CompanyEntity company = this.companyService.getCompanyEntityById(companyId);
        RefCountryEntity refCountry = null;
        RefRegionEntity refRegion = null;

        final Integer year = YearRepresentationEntity.getCalendarYear();

        if (company.getCountryId()!=null) {
            refCountry=this.refCountryRepository.getById(company.getCountryId());
            refRegion = this.refRegionsRepository.getById(refCountry.getRegionId());
        }
        int companyContinentId = 0;
        int companyRegionId = 0;
        int companyCountryId = 0;
        int companyStateId = 0;
        int companyIndustrySectorId = 0;
        int companyIndustrySubSectorId = 0;

        if (refCountry!=null && refRegion.getContinentId() != null) {
            companyContinentId = refRegion.getContinentId();
        }
        if (refCountry!=null && refCountry.getRegionId() != null) {
            companyRegionId = refCountry.getRegionId();
        }
        if (company.getCountryId() != null) {
            companyCountryId = company.getCountryId();
        }
        if (company.getStateId() != null) {
            companyStateId = company.getStateId();
        }
        if (company.getIndustrySectorId() != null) {
            companyIndustrySectorId = company.getIndustrySectorId();
        }
        if (company.getIndustrySubsectorId() != null) {
            companyIndustrySubSectorId = company.getIndustrySubsectorId();
        }
        // Get the emission factor matching the attributes of the company
        filteredList = this.getFactorsForYear(filteredList, year, companyContinentId, companyRegionId, companyCountryId
                , companyStateId, companyIndustrySectorId, companyIndustrySubSectorId);

        // if Country has child country
        if (companyCountryId > 0) {
            Optional<RefCountryChildEntity> refCountryChildEntity = this.refCountryChildRepository.findByChildCountryId(companyCountryId);
            if (refCountryChildEntity.isPresent()) {
                refCountry = this.refCountryRepository.getById(refCountryChildEntity.get().getParentCountryId());
                refRegion = this.refRegionsRepository.getById(refCountry.getRegionId());
                companyContinentId = refRegion.getContinentId();
                companyRegionId = refCountry.getRegionId();
                companyCountryId = refCountryChildEntity.get().getParentCountryId();
                filteredList = this.getFactorsForYear(filteredList, year, companyContinentId, companyRegionId, companyCountryId
                        , companyStateId, companyIndustrySectorId, companyIndustrySubSectorId);
            }
        }
        // Get the missing emission factor from Europe which is the default emission factor
        filteredList = this.getDefaultEuropeFactors(filteredList, year);
        return filteredList;
    }

    private List<RefConfigEmissionsFactorEntity> getFactorsForYear(List<RefConfigEmissionsFactorEntity> filteredList,
                                                                   Integer year,
                                                                   int companyContinentId,
                                                                   int companyRegionId,
                                                                   int companyCountryId,
                                                                   int companyStateId,
                                                                   int companyIndustrySectorId,
                                                                   int companyIndustrySubSectorId) {
        boolean isMatchingContinent;
        boolean isMatchingRegion;
        boolean isMatchingCountry;
        boolean isMatchingState;
        boolean isMatchingIndustrySector;
        boolean isMatchingIndustrySubSector;
        boolean isMatchingStartDate;
        boolean isMatchingEndDate;
        List<RefConfigEmissionsFactorEntity> allFactors = this.refConfigEmissionsFactorRepository.findAll();
        for (RefConfigEmissionsFactorEntity row : allFactors) {
            isMatchingContinent = true;
            isMatchingRegion = true;
            isMatchingCountry = true;
            isMatchingState = true;
            isMatchingIndustrySector = true;
            isMatchingIndustrySubSector = true;
            isMatchingStartDate = true;
            isMatchingEndDate = true;

            if (companyContinentId > 0) {
                if (row.getContinentId() != null && row.getContinentId() > 0) {
                    isMatchingContinent = row.getContinentId().equals(companyContinentId);
                }
            }
            if (companyRegionId > 0) {
                if (row.getRegionId() != null && row.getRegionId() > 0) {
                    isMatchingRegion = row.getRegionId().equals(companyRegionId);
                }
            }
            if (row.getCountryId() != null && row.getCountryId() > 0) {
                isMatchingCountry = row.getCountryId().equals(companyCountryId);
            }
            if (companyStateId > 0) {
                if (row.getStateId() != null && row.getStateId() > 0) {
                    isMatchingState = row.getStateId().equals(companyStateId);
                }
            }
            if (companyIndustrySectorId > 0) {
                if (row.getIndustrySectorId() != null && row.getIndustrySectorId() > 0) {
                    isMatchingIndustrySector = row.getIndustrySectorId().equals(companyIndustrySectorId);
                }
            }
            if (companyIndustrySubSectorId > 0) {
                if (row.getIndustrySubsectorId() != null && row.getIndustrySubsectorId() > 0) {
                    isMatchingIndustrySubSector = row.getIndustrySubsectorId().equals(companyIndustrySubSectorId);
                }
            }
            if (row.getStartDate() != null) {
                isMatchingStartDate = (YearMonth.fromDateFields(row.getStartDate()).getYear() <= year);
            }
            if (row.getEndDate() != null) {
                //TBD
                isMatchingEndDate = (YearMonth.fromDateFields(row.getEndDate()).getYear() >= year);
                //isMatchingEndDate = false;
            }
            if (isMatchingContinent && isMatchingRegion && isMatchingCountry && isMatchingState
                    && isMatchingIndustrySector && isMatchingIndustrySubSector && isMatchingStartDate && isMatchingEndDate) {
                filteredList.add(row);
            }
        }
        return filteredList;
    }

    private List<RefConfigEmissionsFactorEntity> getDefaultEuropeFactors(List<RefConfigEmissionsFactorEntity> filteredList, Integer year) {
        boolean isMatchingStartDate;
        boolean isMatchingEndDate;
        boolean isPresentInList;
        List<RefConfigEmissionsFactorEntity> europeFactors =
                this.refConfigEmissionsFactorRepository.findByContinentId(CONST_CONTINENT_ID_EUROPE);
        for (RefConfigEmissionsFactorEntity row : europeFactors) {
            isPresentInList = false;
            for (RefConfigEmissionsFactorEntity factor : filteredList) {
                if (factor.getConfigEtypeId().equals(row.getConfigEtypeId())) {
                    isPresentInList = true;
                    break;
                }
            }
            if (!isPresentInList) {
                isMatchingStartDate = true;
                isMatchingEndDate = true;
                if (row.getStartDate() != null) {
                    isMatchingStartDate = (YearMonth.fromDateFields(row.getStartDate()).getYear() <= year);
                }
                if (row.getEndDate() != null) {
                    //TBD
                    isMatchingEndDate = (YearMonth.fromDateFields(row.getEndDate()).getYear() >= year);
                    //isMatchingEndDate = false;
                }
                if (isMatchingStartDate && isMatchingEndDate) {
                    filteredList.add(row);
                }
            }
        }
        return filteredList;
    }
}
