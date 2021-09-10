package earth.praesideo.services

import earth.praesideo.database.entities.datasets.DataSetGhgInventoryMethodEntity
import earth.praesideo.database.entities.datasets.DataSetGhgInventoryMethodOperationalBoundaryEntity
import earth.praesideo.database.entities.datasets.DataSetRecentYearEmissionsEntity
import earth.praesideo.database.entities.datasets.DataSetRecentYearEmissionsSourceEntity
import earth.praesideo.database.repositories.datasets.DataSetGhgInventoryMethodOperationalBoundaryRepository
import earth.praesideo.database.repositories.datasets.DataSetGhgInventoryMethodRepository
import earth.praesideo.database.repositories.datasets.DataSetRecentYearEmissionsCarbonCreditsCategoryRepository
import earth.praesideo.database.repositories.datasets.DataSetRecentYearEmissionsCarbonCreditsCategoryTypeRepository
import earth.praesideo.database.repositories.datasets.DataSetRecentYearEmissionsRepository
import earth.praesideo.database.repositories.datasets.DataSetRecentYearEmissionsSourceRepository
import earth.praesideo.models.security.CustomUserDetailsModel
import org.junit.jupiter.api.Test
import org.junit.jupiter.api.extension.ExtendWith
import org.mockito.InjectMocks
import org.mockito.Mock
import org.mockito.junit.jupiter.MockitoExtension

import static org.mockito.ArgumentMatchers.anyBoolean
import static org.mockito.ArgumentMatchers.eq
import static org.mockito.Mockito.when

@ExtendWith(MockitoExtension.class)
class InventoryServiceTest {

    @Mock
    private DataSetGhgInventoryMethodOperationalBoundaryRepository dataSetGhgInventoryMethodOperationalBoundaryRepository

    @Mock
    private DataSetGhgInventoryMethodRepository dataSetGhgInventoryMethodRepository

    @Mock
    private DataSetRecentYearEmissionsRepository dataSetRecentYearEmissionsRepository

    @Mock
    private DataSetRecentYearEmissionsSourceRepository dataSetRecentYearEmissionsSourceRepository

    @Mock
    private DataSetRecentYearEmissionsCarbonCreditsCategoryRepository dataSetRecentYearEmissionsCarbonCreditsCategoryRepository

    @Mock
    private DataSetRecentYearEmissionsCarbonCreditsCategoryTypeRepository dataSetRecentYearEmissionsCarbonCreditsCategoryTypeRepository

    @Mock
    private UsersService usersService

    @InjectMocks
    private InventoryService inventoryService

    @Test
    void calculateGhgInventoryMethodPercentage_shouldGetPercentage_whenDataExist() {
        def userId = 12
        def model = new CustomUserDetailsModel(userId, 0, "", "test", "", [], true)

        when(dataSetGhgInventoryMethodRepository.findFirstByUserDataSetUserIdOrderByUserDataSetInsertedDateDesc(userId))
                .thenReturn(new DataSetGhgInventoryMethodEntity())

        def result = inventoryService.calculateGhgInventoryMethodPercentage(model)

        assert result.ghgInventoryMethodPercentageTotal == 4
        assert result.ghgInventoryMethodPercentageCompleted == 0
        assert result.ghgInventoryMethodMissingFields.size() == 4
        assert result.ghgInventoryMethodPercentage == 0
    }

    @Test
    void calculateGhgInventoryMethodPercentage_shouldGetPercentage_whenDataNotExist() {
        def userId = 12
        def model = new CustomUserDetailsModel(userId, 0, "", "test", "", [], true)

        when(dataSetGhgInventoryMethodRepository.findFirstByUserDataSetUserIdOrderByUserDataSetInsertedDateDesc(userId))
                .thenReturn(null)

        def result = inventoryService.calculateGhgInventoryMethodPercentage(model)

        assert result.ghgInventoryMethodPercentageTotal == 4
        assert result.ghgInventoryMethodPercentageCompleted == 0
        assert result.ghgInventoryMethodMissingFields.size() == 4
        assert result.ghgInventoryMethodPercentage == 0
    }

    @Test
    void calculateGhgInventoryMethodPercentage_shouldGetPercentage_whenAllFlagsAreTrue() {
        def userId = 12
        def model = new CustomUserDetailsModel(userId, 0, "", "test", "", [], true)

        when(dataSetGhgInventoryMethodRepository.findFirstByUserDataSetUserIdOrderByUserDataSetInsertedDateDesc(userId))
                .thenReturn(new DataSetGhgInventoryMethodEntity(emissionsInventoryMethodId: 0, organisationalBoundaryId: 2, auditingValidationId: 1))

        def result = inventoryService.calculateGhgInventoryMethodPercentage(model)

        assert result.ghgInventoryMethodPercentageTotal == 7
        assert result.ghgInventoryMethodPercentageCompleted == 3
        assert result.ghgInventoryMethodMissingFields.size() == 4
        assert result.ghgInventoryMethodPercentage == 43
    }

    @Test
    void calculateGhgInventoryMethodPercentage_shouldGetPercentage_whenIsNotGhgInventoryPresent() {
        def userId = 12
        def model = new CustomUserDetailsModel(userId, 0, "", "test", "", [], true)

        when(dataSetGhgInventoryMethodRepository.findFirstByUserDataSetUserIdOrderByUserDataSetInsertedDateDesc(userId))
                .thenReturn(new DataSetGhgInventoryMethodEntity(isGhgInventoryPresent: false))

        def result = inventoryService.calculateGhgInventoryMethodPercentage(model)

        assert result.ghgInventoryMethodPercentageTotal == 3
        assert result.ghgInventoryMethodPercentageCompleted == 3
        assert result.ghgInventoryMethodMissingFields.size() == 0
        assert result.ghgInventoryMethodPercentage == 100
    }

    @Test
    void calculateInventoryEmissionsPercentage_shouldGetPercentage_whenDataExist() {
        def userId = 12
        def model = new CustomUserDetailsModel(userId, 0, "", "test", "", [], true)

        when(dataSetRecentYearEmissionsRepository
                .findFirstByUserDataSetUserIdAndIsHistoricalEmissionsOrderByUserDataSetInsertedDateDesc(
                        eq(userId), anyBoolean())).thenReturn(new DataSetRecentYearEmissionsEntity())

        def result = inventoryService.calculateInventoryEmissionsPercentage(model)

        assert result.inventoryEmissionsPercentageTotal == 10
        assert result.inventoryEmissionsPercentageCompleted == 0
        assert result.inventoryEmissionsMissingFields.size() == 10
        assert result.inventoryEmissionsPercentage == 0
    }

    @Test
    void calculateInventoryEmissionsPercentage_shouldGetPercentage_whenDataNotExist() {
        def userId = 12
        def model = new CustomUserDetailsModel(userId, 0, "", "test", "", [], true)

        when(dataSetRecentYearEmissionsRepository
                .findFirstByUserDataSetUserIdAndIsHistoricalEmissionsOrderByUserDataSetInsertedDateDesc(
                        eq(userId), anyBoolean())).thenReturn(null)

        def result = inventoryService.calculateInventoryEmissionsPercentage(model)

        assert result.inventoryEmissionsPercentageTotal == 10
        assert result.inventoryEmissionsPercentageCompleted == 0
        assert result.inventoryEmissionsMissingFields.size() == 10
        assert result.inventoryEmissionsPercentage == 0
    }

    @Test
    void calculateInventoryEmissionsPercentage_shouldGetPercentage_whenIsFinancialYear() {
        def userId = 12
        def model = new CustomUserDetailsModel(userId, 0, "", "test", "", [], true)

        when(dataSetRecentYearEmissionsRepository
                .findFirstByUserDataSetUserIdAndIsHistoricalEmissionsOrderByUserDataSetInsertedDateDesc(eq(userId), anyBoolean()))
                .thenReturn(new DataSetRecentYearEmissionsEntity(isFinancialYear: true))

        def result = inventoryService.calculateInventoryEmissionsPercentage(model)

        assert result.inventoryEmissionsPercentageTotal == 12
        assert result.inventoryEmissionsPercentageCompleted == 2
        assert result.inventoryEmissionsMissingFields.size() == 10
        assert result.inventoryEmissionsPercentage == 17
    }

    @Test
    void calculateInventoryEmissionsPercentage_shouldGetPercentage_whenIsNotGhgInventoryPresent() {
        def userId = 12
        def model = new CustomUserDetailsModel(userId, 0, "", "test", "", [], true)

        when(dataSetGhgInventoryMethodRepository.findFirstByUserDataSetUserIdOrderByUserDataSetInsertedDateDesc(userId))
                .thenReturn(new DataSetGhgInventoryMethodEntity(isGhgInventoryPresent: false))
        when(dataSetRecentYearEmissionsRepository
                .findFirstByUserDataSetUserIdAndIsHistoricalEmissionsOrderByUserDataSetInsertedDateDesc(eq(userId), anyBoolean()))
                .thenReturn(new DataSetRecentYearEmissionsEntity())

        def result = inventoryService.calculateInventoryEmissionsPercentage(model)

        assert result.inventoryEmissionsPercentageTotal == 10
        assert result.inventoryEmissionsPercentageCompleted == 10
        assert result.inventoryEmissionsMissingFields.size() == 0
        assert result.inventoryEmissionsPercentage == 100
    }

    @Test
    void calculateInventoryEmissionsPercentage_shouldGetPercentage_whenOperationalBoundariesIsPresent() {
        def userId = 12
        def model = new CustomUserDetailsModel(userId, 0, "", "test", "", [], true)

        when(dataSetGhgInventoryMethodRepository.findFirstByUserDataSetUserIdOrderByUserDataSetInsertedDateDesc(userId))
                .thenReturn(new DataSetGhgInventoryMethodEntity(isGhgInventoryPresent: true,
                        dataSetGhgInventoryMethodOperationalBoundaries: [new DataSetGhgInventoryMethodOperationalBoundaryEntity(operationalBoundaryId: 1),
                                                                         new DataSetGhgInventoryMethodOperationalBoundaryEntity(operationalBoundaryId: 2)]))
        when(dataSetRecentYearEmissionsRepository
                .findFirstByUserDataSetUserIdAndIsHistoricalEmissionsOrderByUserDataSetInsertedDateDesc(eq(userId), anyBoolean()))
                .thenReturn(new DataSetRecentYearEmissionsEntity(recentYearEmissionsSources: [new DataSetRecentYearEmissionsSourceEntity(sourceValue: 1)]))

        def result = inventoryService.calculateInventoryEmissionsPercentage(model)

        assert result.inventoryEmissionsPercentageTotal == 14
        assert result.inventoryEmissionsPercentageCompleted == 2
        assert result.inventoryEmissionsMissingFields.size() == 12
        assert result.inventoryEmissionsPercentage == 14
    }

}
