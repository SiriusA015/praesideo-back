package earth.praesideo.enums;

import lombok.AllArgsConstructor;
import lombok.Getter;

@AllArgsConstructor
@Getter
public enum RefEmissionTypeValue {
    SCOPE1_STATIONARY_FUEL_COMBUSTION("Scope1_stationary_fuel_combustion"),
    SCOPE1_MOBILE_FUEL_COMBUSTION("Scope1_mobile_fuel_combustion"),
    SCOPE1_DISTANCE_TRAVELLED("Scope1_distance_travelled"),
    SCOPE1_REFRIGERATORS_CHILLERS("Scope1_refrigerators_chillers"),
    SCOPE1_FIRE_EXTINGUISHERS("Scope1_fire_extinguishers"),
    SCOPE2_GRID_EMISSION("Scope2_grid_emission"),
    SCOPE3_EMPLOYEE_COMMUTE("Scope3_employee_commute"),
    SCOPE3_BUSINESS_TRAVEL("Scope3_business_travel");

    private final String value;
}
