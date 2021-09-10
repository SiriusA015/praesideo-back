package earth.praesideo.models.restapi.datasets;

import java.util.List;

import lombok.Data;

@Data
public class DataSetPercentageModel {

    private Integer generalBackgroundPercentage;
    private Integer generalBackgroundPercentageTotal;
    private Integer generalBackgroundPercentageCompleted;
    private List<String> generalBackgroundMissingFields;

    private Integer financialInformationPercentage;
    private Integer financialInformationPercentageTotal;
    private Integer financialInformationPercentageCompleted;
    private List<String> financialInformationMissingFields;

    private Integer ghgInventoryMethodPercentage;
    private Integer ghgInventoryMethodPercentageTotal;
    private Integer ghgInventoryMethodPercentageCompleted;
    private List<String> ghgInventoryMethodMissingFields;

    private Integer inventoryEmissionsPercentage;
    private Integer inventoryEmissionsPercentageTotal;
    private Integer inventoryEmissionsPercentageCompleted;
    private List<String> inventoryEmissionsMissingFields;

    private Integer ghgTargetSettingPercentage;
    private Integer ghgTargetSettingPercentageTotal;
    private Integer ghgTargetSettingPercentageCompleted;
    private List<String> ghgTargetSettingMissingFields;

    private Integer climateMetricsPercentage;
    private Integer climateMetricsPercentageTotal;
    private Integer climateMetricsPercentageCompleted;
    private List<String> climateMetricsMissingFields;

    private Integer supportingDocumentsPercentage;
    private Integer supportingDocumentsPercentageTotal;
    private Integer supportingDocumentsPercentageCompleted;
    private List<String> supportingDocumentsMissingFields;

    public DataSetPercentageModel() {
        generalBackgroundPercentage = 0;
        generalBackgroundPercentageTotal = 0;
        generalBackgroundPercentageCompleted = 0;

        financialInformationPercentage = 0;
        financialInformationPercentageTotal = 0;
        financialInformationPercentageCompleted = 0;

        ghgInventoryMethodPercentage = 0;
        ghgInventoryMethodPercentageTotal = 0;
        ghgInventoryMethodPercentageCompleted = 0;

        inventoryEmissionsPercentage = 0;
        inventoryEmissionsPercentageTotal = 0;
        inventoryEmissionsPercentageCompleted = 0;

        ghgTargetSettingPercentage = 0;
        ghgTargetSettingPercentageTotal = 0;
        ghgTargetSettingPercentageCompleted = 0;

        climateMetricsPercentage = 0;
        climateMetricsPercentageTotal = 0;
        climateMetricsPercentageCompleted = 0;

        supportingDocumentsPercentage = 0;
        supportingDocumentsPercentageTotal = 0;
        supportingDocumentsPercentageCompleted = 0;

    }
}
