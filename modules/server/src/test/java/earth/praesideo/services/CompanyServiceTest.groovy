package earth.praesideo.services

import earth.praesideo.database.entities.users.CompanyEntity
import earth.praesideo.database.entities.users.CompanyStatusEntity
import earth.praesideo.database.repositories.users.CompanyRepository
import earth.praesideo.models.security.CustomUserDetailsModel
import earth.praesideo.utils.DataEntryPortalSubmittedStatusEnum
import org.junit.jupiter.api.Test
import org.junit.jupiter.api.extension.ExtendWith
import org.mockito.InjectMocks
import org.mockito.Mock
import org.mockito.junit.jupiter.MockitoExtension

import static org.junit.jupiter.api.Assertions.assertEquals
import static org.mockito.ArgumentMatchers.any
import static org.mockito.Mockito.when
import static org.assertj.core.api.Assertions.*

@ExtendWith(MockitoExtension.class)
class CompanyServiceTest {

    @Mock
    private CompanyRepository companyRepository

    @InjectMocks
    private CompanyService companyService

    @Test
    void getGeneralBackground_shouldGetData_whenDataExist() {
        def companyId = 1, companyName = "Company Name"

        when(companyRepository.findById(companyId)).thenReturn(Optional.of(new CompanyEntity(companyName: companyName)))

        def data = companyService.getGeneralBackground(companyId)

        assertThat(data.getCompanyName()).isEqualTo(companyName)
    }

    @Test
    void getGeneralBackground_shouldGetEmptyData_whenDataNotExist() {
        def companyId = 1

        when(companyRepository.findById(companyId)).thenReturn(Optional.empty())

        def data = companyService.getGeneralBackground(companyId)

        assertThat(data).isNotNull()
        assertThat(data.getCompanyName()).isNull()
    }

    @Test
    void calculatePercentage_shouldGetPercentage_whenDataExist() {
        def companyId = 12
        def model = new CustomUserDetailsModel(0, companyId, "", "test", "", [], true)

        when(companyRepository.findById(companyId)).thenReturn(Optional.of(new CompanyEntity()))

        def result = companyService.calculatePercentage(model)

        assert result.generalBackgroundPercentageTotal == 7
        assert result.generalBackgroundPercentageCompleted == 0
        assert result.generalBackgroundMissingFields.size() == 7
        assert result.generalBackgroundPercentage == 0
    }

    @Test
    void calculatePercentage_shouldGetPercentage_whenDataNotExist() {
        def companyId = 12
        def model = new CustomUserDetailsModel(0, companyId, "", "test", "", [], true)

        when(companyRepository.findById(companyId)).thenReturn(Optional.empty())

        def result = companyService.calculatePercentage(model)

        assert result.generalBackgroundPercentageTotal == 7
        assert result.generalBackgroundPercentageCompleted == 0
        assert result.generalBackgroundMissingFields.size() == 7
        assert result.generalBackgroundPercentage == 0
    }

    @Test
    void calculatePercentage_shouldGetPercentage_whenDataExistAndIsStockExchangeListed() {
        def companyId = 12
        def model = new CustomUserDetailsModel(0, companyId, "", "test", "", [], true)

        when(companyRepository.findById(companyId)).thenReturn(Optional.of(new CompanyEntity(stockExchangeListed: true)))

        def result = companyService.calculatePercentage(model)

        assert result.generalBackgroundPercentageTotal == 8
        assert result.generalBackgroundPercentageCompleted == 1
        assert result.generalBackgroundMissingFields.size() == 7
        assert result.generalBackgroundPercentage == 13
    }

    @Test
    void isCompanyStatusAccepted_shouldGetTrue_whenCompanyStatusIsAccepted() {
        def companyId = 12

        when(companyRepository.findByCompanyId(companyId))
                .thenReturn(Optional.of(new CompanyEntity(companyStatus:
                        new CompanyStatusEntity(statusId: DataEntryPortalSubmittedStatusEnum.ACCEPTED.getStatus()))))

        assert companyService.isCompanyStatusAccepted(companyId)
    }

    @Test
    void createCompany() {
        def companyId = 1, companyName = "Company Name"
        def company = new CompanyEntity(companyId: companyId, companyName: companyName)

        when(companyRepository.findByCompanyName(companyName)).thenReturn(Optional.empty() as List<CompanyEntity>)
        when(companyRepository.save(any(CompanyEntity.class))).thenReturn(company)

        def data = companyService.createCompany(companyName)

        assertEquals companyName, data.getCompanyName()
    }
}
