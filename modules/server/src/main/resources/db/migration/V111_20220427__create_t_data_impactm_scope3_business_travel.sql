
CREATE TABLE IF NOT EXISTS impact.t_data_impactm_scope3_business_travel
(
    id serial not null primary key,
    data_emission_id integer,
    facility_id integer,
    employee_id varchar(100),
    transportation_mode_id integer,
    distance_travelled_daily numeric(24,2),
    distance_travelled_yearly numeric(24,2),
    distance_unit_id integer,
    emission_factor_id integer,
    emission_factor_by_user numeric(24,2),
    calc_config_emissions_type_id integer,
    calc_config_emissions_unit_factor_id integer,
    calc_total_distance_converted numeric(24,2),
    calc_tco2 numeric(24,2),
    date_added timestamp without time zone,
    added_by character varying(100) ,
    date_modified timestamp without time zone,
    modified_by character varying(100),
    CONSTRAINT fk_t_data_impactm_buss_travel_calcconfigemissionstypeid FOREIGN KEY (calc_config_emissions_type_id) REFERENCES static.t_ref_config_emissions_type (id),
    CONSTRAINT fk_t_data_impactm_buss_travel_calcconfigemissionsunitfactorid FOREIGN KEY (calc_config_emissions_unit_factor_id) REFERENCES static.t_ref_config_emissions_unit_factor (id),
    CONSTRAINT fk_t_data_impactm_buss_travel_dataemissionid FOREIGN KEY (data_emission_id) REFERENCES impact.t_data_impactm_emission (id),
    CONSTRAINT fk_t_data_impactm_buss_travel_distanceunitid FOREIGN KEY (distance_unit_id) REFERENCES static.t_ref_list (list_id) ,
    CONSTRAINT fk_t_data_impactm_buss_travel_transportation_mode_id FOREIGN KEY (transportation_mode_id) REFERENCES static.t_ref_list (list_id) ,
    CONSTRAINT fk_t_data_impactm_buss_travel_facilityid FOREIGN KEY (facility_id) REFERENCES public.t_company_facilities (facility_id),
    CONSTRAINT fk_t_data_impactm_buss_travel_emissionfactorid FOREIGN KEY (emission_factor_id) REFERENCES static.t_ref_config_emissions_factor (id)
    );