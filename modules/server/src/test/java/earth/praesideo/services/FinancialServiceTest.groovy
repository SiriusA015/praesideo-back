package earth.praesideo.services

import earth.praesideo.database.entities.users.UserFinancialDetailsEntity
import earth.praesideo.database.repositories.users.UserFinancialDetailsRepository
import earth.praesideo.models.security.CustomUserDetailsModel
import org.junit.jupiter.api.Test
import org.junit.jupiter.api.extension.ExtendWith
import org.mockito.InjectMocks
import org.mockito.Mock
import org.mockito.junit.jupiter.MockitoExtension

import static org.mockito.Mockito.when

@ExtendWith(MockitoExtension.class)
class FinancialServiceTest {

    @Mock
    private UserFinancialDetailsRepository userFinancialDetailsRepository

    @InjectMocks
    private FinancialService financialService

    @Test
    void calculatePercentage_shouldGetPercentage_whenDataExist() {
        def companyId = 12
        def model = new CustomUserDetailsModel(0, companyId, "", "test", "", [], true)

        when(userFinancialDetailsRepository.findByCompany_CompanyId(companyId))
                .thenReturn(new UserFinancialDetailsEntity())

        def result = financialService.calculatePercentage(model)

        assert result.financialInformationPercentageTotal == 5
        assert result.financialInformationPercentageCompleted == 0
        assert result.financialInformationMissingFields.size() == 5
        assert result.financialInformationPercentage == 0
    }

    @Test
    void calculatePercentage_shouldGetPercentage_whenDataNotExist() {
        def companyId = 12
        def model = new CustomUserDetailsModel(0, companyId, "", "test", "", [], true)

        when(userFinancialDetailsRepository.findByCompany_CompanyId(companyId)).thenReturn(null)

        def result = financialService.calculatePercentage(model)

        assert result.financialInformationPercentageTotal == 5
        assert result.financialInformationPercentageCompleted == 0
        assert result.financialInformationMissingFields.size() == 5
        assert result.financialInformationPercentage == 0
    }

    @Test
    void calculatePercentage_shouldGetPercentage_whenIsFinancialYear() {
        def companyId = 12
        def model = new CustomUserDetailsModel(0, companyId, "", "test", "", [], true)

        when(userFinancialDetailsRepository.findByCompany_CompanyId(companyId))
                .thenReturn(new UserFinancialDetailsEntity(isFinancialYear: true))

        def result = financialService.calculatePercentage(model)

        assert result.financialInformationPercentageTotal == 6
        assert result.financialInformationPercentageCompleted == 1
        assert result.financialInformationMissingFields.size() == 5
        assert result.financialInformationPercentage == 17
    }

}
