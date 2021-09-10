insert into static.t_ref_config_emissions_unit_factor (
                                                       config_emission_type_id
                                                      ,etype_unit_id1
                                                      ,etype_unit_id2
                                                      ,etype_unit_factor1
                                                      ,etype_unit_factor2
                                                      ,date_added
                                                      ,added_by
                                                      ,date_modified
                                                      ,modified_by)
select
    (select id from static.v_ref_config_emissions_type where etype like '%Scope1_distance_travelled%' and etypeattr2='Car - petrol')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='miles')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,1.0
     ,0.001
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    where not exists
	(select 1 from static.t_ref_config_emissions_unit_factor where
	 config_emission_type_id=(select id from static.v_ref_config_emissions_type where etype like '%Scope1_distance_travelled%' and etypeattr2='Car - petrol')
		AND etype_unit_id1 = (select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='miles')
	 	AND etype_unit_id2 = (select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
	);

INSERT INTO static.t_ref_config_emissions_factor (config_etype_id,country_id,emission_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (select id from static.v_ref_config_emissions_type where etype='Scope1_distance_travelled' and etypeattr1='Passenger' and etypeattr2='Car - petrol')
     ,(select id from static.t_ref_countries where country='United States of America')
     ,0.3468
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(select id from static.v_ref_config_emissions_type where etype='Scope1_distance_travelled' and etypeattr1='Passenger' and etypeattr2='Car - petrol')
and country_id = (select id from static.t_ref_countries where country='United States of America')
);

INSERT INTO static.t_ref_config_emissions_factor (config_etype_id,country_id,emission_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (select id from static.v_ref_config_emissions_type where etype='Scope1_distance_travelled' and etypeattr1='Commercial' and etypeattr2='Light Duty Vehicle (<3.5T)')
     ,(select id from static.t_ref_countries where country='United States of America')
     ,0.477839
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(select id from static.v_ref_config_emissions_type where etype='Scope1_distance_travelled' and etypeattr1='Commercial' and etypeattr2='Light Duty Vehicle (<3.5T)')
and country_id = (select id from static.t_ref_countries where country='United States of America')
);

INSERT INTO static.t_ref_config_emissions_factor (config_etype_id,country_id,emission_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (select id from static.v_ref_config_emissions_type where etype='Scope1_distance_travelled' and etypeattr1='Commercial' and etypeattr2='Medium Duty Vehicle (<12T)')
     ,(select id from static.t_ref_countries where country='United States of America')
     ,0.2025
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(select id from static.v_ref_config_emissions_type where etype='Scope1_distance_travelled' and etypeattr1='Commercial' and etypeattr2='Medium Duty Vehicle (<12T)')
and country_id = (select id from static.t_ref_countries where country='United States of America')
);

INSERT INTO static.t_ref_config_emissions_factor (config_etype_id,country_id,emission_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (select id from static.v_ref_config_emissions_type where etype='Scope1_distance_travelled' and etypeattr1='Commercial' and etypeattr2='Heavy Duty Vehicle (>12 T)')
     ,(select id from static.t_ref_countries where country='United States of America')
     ,0.2025
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(select id from static.v_ref_config_emissions_type where etype='Scope1_distance_travelled' and etypeattr1='Commercial' and etypeattr2='Heavy Duty Vehicle (>12 T)')
and country_id = (select id from static.t_ref_countries where country='United States of America')
);

INSERT INTO static.t_ref_config_emissions_factor (config_etype_id,country_id,emission_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (select id from static.v_ref_config_emissions_type where etype='Scope1_distance_travelled' and etypeattr1='Commercial' and etypeattr2='Bus')
     ,(select id from static.t_ref_countries where country='United States of America')
     ,0.0563
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(select id from static.v_ref_config_emissions_type where etype='Scope1_distance_travelled' and etypeattr1='Commercial' and etypeattr2='Bus')
and country_id = (select id from static.t_ref_countries where country='United States of America')
);

update static.t_ref_list set list_value ='Dec 2018, Central Electricity Authority India' where list_value='Dec 2018, Central Electricity Authority';

INSERT INTO static.t_ref_list (list_key, list_value,date_added,added_by,date_modified,modified_by)
select 'impactm_emission_factor_source','March 2021, Central Electricity Authority India',now(),'nidhish',now(),'nidhish'
    where not exists (select 1 from static.t_ref_list  where list_key = 'impactm_emission_factor_source' and list_value='March 2021, Central Electricity Authority India');


INSERT INTO static.t_ref_config_emissions_factor (config_etype_id,country_id,emission_factor,emission_source_id,start_date,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope2_grid_emission')
     ,(SELECT id FROM static.t_ref_countries Where country='India')
     ,0.79
     ,(select list_id from static.t_ref_list WHERE list_key='impactm_emission_factor_source' and list_value='March 2021, Central Electricity Authority India')
     ,'2021-04-01'
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope2_grid_emission')
and country_id=(SELECT id FROM static.t_ref_countries Where country='India')
and start_date='2021-04-01'
);

update static.t_ref_config_emissions_factor set end_date='2021-03-01' WHERE
        config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope2_grid_emission')
                                                                        and country_id=(SELECT id FROM static.t_ref_countries Where country='India')
                                                                        and start_date is null and end_date is null;

INSERT INTO static.t_ref_list (list_key, list_value,date_added,added_by,date_modified,modified_by)
select 'impactm_emission_factor_source','2020, U.S. Energy Information Administration (EIA)',now(),'nidhish',now(),'nidhish'
    where not exists (select 1 from static.t_ref_list  where list_key = 'impactm_emission_factor_source' and list_value='2020, U.S. Energy Information Administration (EIA)');

INSERT INTO static.t_ref_config_emissions_factor (config_etype_id,country_id,emission_factor,emission_source_id,date_added,added_by,date_modified,modified_by)
SELECT
    (select id from static.v_ref_config_emissions_type where etype='Scope2_grid_emission' and etypeattr1='Scope2_grid_emission')
     ,(select id from static.t_ref_countries where country='United States of America')
     ,0.3855535
     ,(select list_id from static.t_ref_list WHERE list_key='impactm_emission_factor_source' and list_value='2020, U.S. Energy Information Administration (EIA)')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(select id from static.v_ref_config_emissions_type where etype='Scope2_grid_emission' and etypeattr1='Scope2_grid_emission')
and country_id = (select id from static.t_ref_countries where country='United States of America')
);


