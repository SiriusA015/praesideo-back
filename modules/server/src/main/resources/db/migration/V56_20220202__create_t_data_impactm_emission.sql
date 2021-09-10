--PM-206-BACKEND API Emission Factors
INSERT INTO static.t_ref_list(list_key,list_value,date_added,added_by)
SELECT 'impactm_refrigerator_type','REFRIGERATOR',now(),'nidhish'
    WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_refrigerator_type' and list_value='REFRIGERATOR');

INSERT INTO static.t_ref_list(list_key,list_value,date_added,added_by)
SELECT 'impactm_refrigerator_type','AIR CONDITIONNING',now(),'nidhish'
    WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_refrigerator_type' and list_value='AIR CONDITIONNING');

INSERT INTO static.t_ref_list(list_key,list_value,date_added,added_by)
SELECT 'impactm_refrigerator_type','CHILLERS',now(),'nidhish'
    WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_refrigerator_type' and list_value='CHILLERS');

INSERT INTO static.t_ref_list(list_key,list_value,date_added,added_by)
SELECT 'impactm_extinguisher_type','EXTINGUISHER',now(),'nidhish'
    WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_extinguisher_type' and list_value='EXTINGUISHER');

drop table if exists impact.t_data_impactm_scope1_fuel_combustion;
drop table if exists impact.t_data_impactm_scope1_distance;
drop table if exists impact.t_data_impactm_scope1_refrigerators;
drop table if exists impact.t_data_impactm_scope1_fire_extinguishers;
drop table if exists impact.t_data_impactm_scope2_electricity;
drop table if exists impact.t_data_impactm_emission;

create table if not exists impact.t_data_impactm_emission
(
    id serial not null primary key
    ,company_id 						integer
    ,is_financial_year 					boolean
    ,year_representation_id				integer
    ,start_month						integer
    ,is_measurement						boolean
    ,is_stationary_combustion			boolean
    ,is_mobile_combustion				boolean
    ,is_refrigerators					boolean
    ,is_fire_extinguisher				boolean
    ,date_added							timestamp
    ,added_by							varchar(100)
    ,date_modified						timestamp
    ,modified_by						varchar(100)
    ,CONSTRAINT fk_t_data_impactm_emission_company_id FOREIGN KEY (company_id) REFERENCES public.t_companies (company_id)
    ,CONSTRAINT fk_t_data_impactm_emission_year_representation_id  FOREIGN KEY (year_representation_id) REFERENCES static.t_ref_years (year_representation_id)
    );

create table if not exists impact.t_data_impactm_scope1_fuel_combustion
(
    id 	serial not null primary key
    ,data_emission_id 				integer
    ,fuel_type_id					integer
    ,fuel_amount_raw				numeric(24,2)
    ,fuel_unit_id					integer
    ,emission_factor_id				integer
    ,emission_factor_by_user		numeric(24,2)

    ,calc_emission_type_id					integer
    ,calc_config_emissions_type_id			integer
    ,calc_config_emissions_unit_factor_id	integer
    ,calc_fuel_amount_converted				numeric(24,2)
    ,calc_tco2								numeric(24,2)
    ,date_added								timestamp
    ,added_by								varchar(100)
    ,date_modified							timestamp
    ,modified_by							varchar(100)
    ,CONSTRAINT fk_t_data_impactm_fuel_dataemissionid 					FOREIGN KEY (data_emission_id) REFERENCES impact.t_data_impactm_emission(id)
    ,CONSTRAINT fk_t_data_impactm_fuel_fueltypeid 						FOREIGN KEY (fuel_type_id) REFERENCES static.t_ref_list(list_id)
    ,CONSTRAINT fk_t_data_impactm_fuel_fuelunitid 						FOREIGN KEY (fuel_unit_id) REFERENCES static.t_ref_list(list_id)
    ,CONSTRAINT fk_t_data_impactm_fuel_emissionsfactorid 				FOREIGN KEY (emission_factor_id) REFERENCES static.t_ref_config_emissions_factor(id)
    ,CONSTRAINT fk_t_data_impactm_fuel_calcconfigemissionstypeid 		FOREIGN KEY (calc_config_emissions_type_id) REFERENCES static.t_ref_config_emissions_type(id)
    ,CONSTRAINT fk_t_data_impactm_fuel_calcconfigemissionsunitfactorid	FOREIGN KEY (calc_config_emissions_unit_factor_id) REFERENCES static.t_ref_config_emissions_unit_factor(id)
    ,CONSTRAINT fk_t_data_impactm_fuel_calcemissiontypeid				FOREIGN KEY (calc_emission_type_id) REFERENCES static.t_ref_list(list_id)
    );

create table if not exists impact.t_data_impactm_scope1_distance
(
    id 	serial not null primary key
    ,data_emission_id 				integer
    ,vehicle_type_id				integer
    ,vehicle_category_id			integer
    ,distance_amount_raw			numeric(24,2)
    ,distance_unit_id				integer
    ,emission_factor_id				integer
    ,emission_factor_by_user		numeric(24,2)

    ,calc_config_emissions_type_id			integer
    ,calc_config_emissions_unit_factor_id	integer
    ,calc_distance_amount_converted			numeric(24,2)
    ,calc_tco2								numeric(24,2)
    ,date_added								timestamp
    ,added_by								varchar(100)
    ,date_modified							timestamp
    ,modified_by							varchar(100)
    ,CONSTRAINT fk_t_data_impactm_distance_dataemissionid 				FOREIGN KEY (data_emission_id) REFERENCES impact.t_data_impactm_emission(id)
    ,CONSTRAINT fk_t_data_impactm_distance_vehicletypeid 				FOREIGN KEY (vehicle_type_id) REFERENCES static.t_ref_list(list_id)
    ,CONSTRAINT fk_t_data_impactm_distance_vehiclecategoryid 			FOREIGN KEY (vehicle_category_id) REFERENCES static.t_ref_list(list_id)
    ,CONSTRAINT fk_t_data_impactm_distance_distanceunitid 				FOREIGN KEY (distance_unit_id) REFERENCES static.t_ref_list(list_id)
    ,CONSTRAINT fk_t_data_impactm_distance_emissionfactorid 			FOREIGN KEY (emission_factor_id) REFERENCES static.t_ref_config_emissions_factor(id)
    ,CONSTRAINT fk_t_data_impactm_distance_calcconfigemissionstypeid 	FOREIGN KEY (calc_config_emissions_type_id) REFERENCES static.t_ref_config_emissions_type(id)
    ,CONSTRAINT fk_t_data_impactm_distance_calcconfigemissionsunitfactorid	FOREIGN KEY (calc_config_emissions_unit_factor_id) REFERENCES static.t_ref_config_emissions_unit_factor(id)
    );

create table if not exists impact.t_data_impactm_scope1_refrigerators
(
    id 	serial not null primary key
    ,data_emission_id 				integer
    ,appliance_type_id				integer
    ,annual_topup_quantity			Numeric(24,2)
    ,topup_unit_id					integer
    ,identification_number			varchar(200)
    ,capacity						numeric(24,2)
    ,referigerant_type_id			integer
    ,emission_factor_id				integer
    ,emission_factor_by_user		numeric(24,2)

    ,calc_config_emissions_type_id			integer
    ,calc_config_emissions_unit_factor_id	integer
    ,calc_annual_topup_quantity_converted	numeric(24,2)
    ,calc_tco2								numeric(24,2)
    ,date_added								timestamp
    ,added_by								varchar(100)
    ,date_modified							timestamp
    ,modified_by							varchar(100)
    ,CONSTRAINT fk_t_data_impactm_refrig_dataemissionid 				FOREIGN KEY (data_emission_id) REFERENCES impact.t_data_impactm_emission(id)
    ,CONSTRAINT fk_t_data_impactm_refrig_appliancetypeid 				FOREIGN KEY (appliance_type_id) REFERENCES static.t_ref_list(list_id)
    ,CONSTRAINT fk_t_data_impactm_refrig_topupunitid 					FOREIGN KEY (topup_unit_id) REFERENCES static.t_ref_list(list_id)
    ,CONSTRAINT fk_t_data_impactm_refrig_referigeranttypeid 			FOREIGN KEY (referigerant_type_id) REFERENCES static.t_ref_list(list_id)
    ,CONSTRAINT fk_t_data_impactm_refrig_emissionfactorid 				FOREIGN KEY (emission_factor_id) REFERENCES static.t_ref_config_emissions_factor(id)
    ,CONSTRAINT fk_t_data_impactm_refrig_calcconfigemissionstypeid 		FOREIGN KEY (calc_config_emissions_type_id) REFERENCES static.t_ref_config_emissions_type(id)
    ,CONSTRAINT fk_t_data_impactm_refrig_calcconfigemissionsunitfactorid	FOREIGN KEY (calc_config_emissions_unit_factor_id) REFERENCES static.t_ref_config_emissions_unit_factor(id)
    );

create table if not exists impact.t_data_impactm_scope1_fire_extinguishers
(
    id 	serial not null primary key
    ,data_emission_id 				integer
    ,appliance_type_id				integer
    ,annual_topup_quantity			Numeric(24,2)
    ,topup_unit_id					integer
    ,identification_number			varchar(200)
    ,emission_factor_id				integer
    ,emission_factor_by_user		numeric(24,2)

    ,calc_config_emissions_type_id			integer
    ,calc_config_emissions_unit_factor_id	integer
    ,calc_annual_topup_quantity_converted	numeric(24,2)
    ,calc_tco2								numeric(24,2)
    ,date_added								timestamp
    ,added_by								varchar(100)
    ,date_modified							timestamp
    ,modified_by							varchar(100)
    ,CONSTRAINT fk_t_data_impactm_exting_dataemissionid 				FOREIGN KEY (data_emission_id) REFERENCES impact.t_data_impactm_emission(id)
    ,CONSTRAINT fk_t_data_impactm_exting_appliancetypeid 				FOREIGN KEY (appliance_type_id) REFERENCES static.t_ref_list(list_id)
    ,CONSTRAINT fk_t_data_impactm_exting_topupunitid 					FOREIGN KEY (topup_unit_id) REFERENCES static.t_ref_list(list_id)
    ,CONSTRAINT fk_t_data_impactm_exting_emissionfactorid 				FOREIGN KEY (emission_factor_id) REFERENCES static.t_ref_config_emissions_factor(id)
    ,CONSTRAINT fk_t_data_impactm_exting_calcconfigemissionstypeid 		FOREIGN KEY (calc_config_emissions_type_id) REFERENCES static.t_ref_config_emissions_type(id)
    ,CONSTRAINT fk_t_data_impactm_exting_calcconfigemissionsunitfactorid	FOREIGN KEY (calc_config_emissions_unit_factor_id) REFERENCES static.t_ref_config_emissions_unit_factor(id)
    );

create table if not exists impact.t_data_impactm_scope2_electricity
(
    id 	serial not null primary key
    ,data_emission_id 				integer
    ,facility_id					integer
    ,total_electricity_amount_raw	numeric(24,2)
    ,total_electricity_unit_id		integer
    ,total_renewable_amount_raw		numeric(24,2)
    ,total_renewable_unit_id		integer

    ,calc_config_emissions_type_id			integer
    ,calc_config_emissions_unit_factor_id	integer
    ,calc_total_electricity_amount_converted	numeric(24,2)
    ,calc_tco2								numeric(24,2)
    ,date_added								timestamp
    ,added_by								varchar(100)
    ,date_modified							timestamp
    ,modified_by							varchar(100)
    ,CONSTRAINT fk_t_data_impactm_elect_dataemissionid 				FOREIGN KEY (data_emission_id) REFERENCES impact.t_data_impactm_emission(id)
    ,CONSTRAINT fk_t_data_impactm_elect_facilityid 					FOREIGN KEY (facility_id) REFERENCES public.t_company_facilities(facility_id)
    ,CONSTRAINT fk_t_data_impactm_elect_totalelectricityunitid 		FOREIGN KEY (total_electricity_unit_id) REFERENCES static.t_ref_list(list_id)
    ,CONSTRAINT fk_t_data_impactm_elect_totalrenewableunitid 		FOREIGN KEY (total_renewable_unit_id) REFERENCES static.t_ref_list(list_id)
    ,CONSTRAINT fk_t_data_impactm_elect_calcconfigemissionstypeid 	FOREIGN KEY (calc_config_emissions_type_id) REFERENCES static.t_ref_config_emissions_type(id)
    ,CONSTRAINT fk_t_data_impactm_elect_calcconfigemissionsunitfactorid	FOREIGN KEY (calc_config_emissions_unit_factor_id) REFERENCES static.t_ref_config_emissions_unit_factor(id)
    );



