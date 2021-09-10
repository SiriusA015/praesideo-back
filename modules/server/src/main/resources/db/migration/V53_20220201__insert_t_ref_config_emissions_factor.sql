

alter table static.t_ref_config_emissions_factor ADD COLUMN IF NOT EXISTS start_date date;
alter table static.t_ref_config_emissions_factor ADD COLUMN IF NOT EXISTS end_date date;
alter table static.t_ref_config_emissions_factor ADD COLUMN IF NOT EXISTS state_id integer;
alter table static.t_ref_config_emissions_factor DROP CONSTRAINT IF EXISTS fk_t_ref_config_emissions_factor_state_id;
alter table static.t_ref_config_emissions_factor add CONSTRAINT fk_t_ref_config_emissions_factor_state_id FOREIGN KEY (state_id)
    REFERENCES static.t_ref_country_states (id);


INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'impactm_emission_factor_source','UK Government Greenhouse Gas Reporting Factors',now(),'nidhish'
    WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_emission_factor_source' and list_value='UK Government Greenhouse Gas Reporting Factors');

INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'impactm_emission_factor_source','2018, European environment agency',now(),'nidhish'
    WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_emission_factor_source' and list_value='2018, European environment agency');

INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'impactm_emission_factor_source','Dec 2018, Central Electricity Authority',now(),'nidhish'
    WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_emission_factor_source' and list_value='Dec 2018, Central Electricity Authority');

INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'impactm_emission_factor_source','2019, Northern Ireland Carbon Intensity Indicators 2021',now(),'nidhish'
    WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_emission_factor_source' and list_value='2019, Northern Ireland Carbon Intensity Indicators 2021');

INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'impactm_emission_factor_source','Australian Government National Greenhouse Factors',now(),'nidhish'
    WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_emission_factor_source' and list_value='Australian Government National Greenhouse Factors');

INSERT INTO static.t_ref_config_emissions_factor (config_etype_id,emission_factor,emission_source_id,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_stationary_fuel_combustion' and etypeattr1='LNG')
     ,1.30
     ,(SELECT list_id FROM static.t_ref_list Where list_value='EPA & climate registry')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_stationary_fuel_combustion' and etypeattr1='LNG'));

INSERT INTO static.t_ref_config_emissions_factor (config_etype_id,emission_factor,emission_source_id,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_stationary_fuel_combustion' and etypeattr1='Sub Bituminous')
     ,1.80
     ,(SELECT list_id FROM static.t_ref_list Where list_value='IPCC')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_stationary_fuel_combustion' and etypeattr1='Sub Bituminous'));

INSERT INTO static.t_ref_config_emissions_factor (config_etype_id,emission_factor,emission_source_id,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_stationary_fuel_combustion' and etypeattr1='Other Bituminous')
     ,2.40
     ,(SELECT list_id FROM static.t_ref_list Where list_value='IPCC')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_stationary_fuel_combustion' and etypeattr1='Other Bituminous'));

INSERT INTO static.t_ref_config_emissions_factor (config_etype_id,emission_factor,emission_source_id,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_stationary_fuel_combustion' and etypeattr1='Coking Coal')
     ,2.30
     ,(SELECT list_id FROM static.t_ref_list Where list_value='INCCA Report 2007')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_stationary_fuel_combustion' and etypeattr1='Coking Coal'));


INSERT INTO static.t_ref_config_emissions_factor (config_etype_id,emission_factor,emission_source_id,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_stationary_fuel_combustion' and etypeattr1='Anthracite')
     ,2.60
     ,(SELECT list_id FROM static.t_ref_list Where list_value='IPCC')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_stationary_fuel_combustion' and etypeattr1='Anthracite'));


INSERT INTO static.t_ref_config_emissions_factor (config_etype_id,emission_factor,emission_source_id,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_stationary_fuel_combustion' and etypeattr1='Lignite')
     ,1.00
     ,(SELECT list_id FROM static.t_ref_list Where list_value='INCCA Report 2007')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_stationary_fuel_combustion' and etypeattr1='Lignite'));

INSERT INTO static.t_ref_config_emissions_factor (config_etype_id,emission_factor,emission_source_id,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_stationary_fuel_combustion' and etypeattr1='Naptha')
     ,3.3
     ,(SELECT list_id FROM static.t_ref_list Where list_value='IPCC')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_stationary_fuel_combustion' and etypeattr1='Naptha'));


INSERT INTO static.t_ref_config_emissions_factor (config_etype_id,emission_factor,emission_source_id,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_stationary_fuel_combustion' and etypeattr1='Petrol')
     ,2.3
     ,(SELECT list_id FROM static.t_ref_list Where list_value='IPCC')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_stationary_fuel_combustion' and etypeattr1='Petrol'));

INSERT INTO static.t_ref_config_emissions_factor (config_etype_id,emission_factor,emission_source_id,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_stationary_fuel_combustion' and etypeattr1='Diesel')
     ,2.6
     ,(SELECT list_id FROM static.t_ref_list Where list_value='IPCC')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_stationary_fuel_combustion' and etypeattr1='Diesel'));

INSERT INTO static.t_ref_config_emissions_factor (config_etype_id,emission_factor,emission_source_id,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_stationary_fuel_combustion'
                                                         and etypeattr1='Liquefied petroleum gas (LPG)'
                                                         and etype_unit1='tons'
                                                         and etype_unit2='tCO2')
     ,3.0
     ,(SELECT list_id FROM static.t_ref_list Where list_value='IPCC')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_stationary_fuel_combustion'
				 and etypeattr1='Liquefied petroleum gas (LPG)'
				and etype_unit1='tons'
				 and etype_unit2='tCO2'));

INSERT INTO static.t_ref_config_emissions_factor (config_etype_id,emission_factor,emission_source_id,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_stationary_fuel_combustion' and etypeattr1='SKO')
     ,2.5
     ,(SELECT list_id FROM static.t_ref_list Where list_value='IPCC')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_stationary_fuel_combustion' and etypeattr1='SKO'));


INSERT INTO static.t_ref_config_emissions_factor (config_etype_id,emission_factor,emission_source_id,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_stationary_fuel_combustion' and etypeattr1='Petcoke')
     ,3.2
     ,(SELECT list_id FROM static.t_ref_list Where list_value='IPCC')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_stationary_fuel_combustion' and etypeattr1='Petcoke'));

INSERT INTO static.t_ref_config_emissions_factor (config_etype_id,emission_factor,emission_source_id,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_stationary_fuel_combustion' and etypeattr1='Furnace Oil')
     ,2.0
     ,(SELECT list_id FROM static.t_ref_list Where list_value='INCCA Report 2007')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_stationary_fuel_combustion' and etypeattr1='Furnace Oil'));

INSERT INTO static.t_ref_config_emissions_factor (config_etype_id,country_id,emission_factor,emission_source_id,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_distance_travelled' and etypeattr1='Passenger' and etypeattr2='Car - petrol')
     ,(SELECT id FROM static.t_ref_countries Where country='India')
     ,0.19
     ,null
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_distance_travelled' and etypeattr1='Passenger' and etypeattr2='Car - petrol')
and country_id=(SELECT id FROM static.t_ref_countries Where country='India'));

INSERT INTO static.t_ref_config_emissions_factor (config_etype_id,country_id,emission_factor,emission_source_id,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_distance_travelled' and etypeattr1='Passenger' and etypeattr2='Car - diesel')
     ,(SELECT id FROM static.t_ref_countries Where country='India')
     ,0.18
     ,null
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_distance_travelled' and etypeattr1='Passenger' and etypeattr2='Car - diesel')
and country_id=(SELECT id FROM static.t_ref_countries Where country='India'));

INSERT INTO static.t_ref_config_emissions_factor (config_etype_id,country_id,emission_factor,emission_source_id,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_distance_travelled' and etypeattr1='Passenger' and etypeattr2='Car - LPG')
     ,(SELECT id FROM static.t_ref_countries Where country='India')
     ,0.15
     ,null
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_distance_travelled' and etypeattr1='Passenger' and etypeattr2='Car - LPG')
and country_id=(SELECT id FROM static.t_ref_countries Where country='India'));

INSERT INTO static.t_ref_config_emissions_factor (config_etype_id,country_id,emission_factor,emission_source_id,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_distance_travelled' and etypeattr1='Passenger' and etypeattr2='Auto - petrol')
     ,(SELECT id FROM static.t_ref_countries Where country='India')
     ,0.09
     ,null
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_distance_travelled' and etypeattr1='Passenger' and etypeattr2='Auto - petrol')
and country_id=(SELECT id FROM static.t_ref_countries Where country='India'));

INSERT INTO static.t_ref_config_emissions_factor (config_etype_id,country_id,emission_factor,emission_source_id,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_distance_travelled' and etypeattr1='Passenger' and etypeattr2='Auto - CNG')
     ,(SELECT id FROM static.t_ref_countries Where country='India')
     ,0.08
     ,null
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_distance_travelled' and etypeattr1='Passenger' and etypeattr2='Auto - CNG')
and country_id=(SELECT id FROM static.t_ref_countries Where country='India'));

INSERT INTO static.t_ref_config_emissions_factor (config_etype_id,country_id,emission_factor,emission_source_id,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_distance_travelled' and etypeattr1='Passenger' and etypeattr2='Auto - LPG')
     ,(SELECT id FROM static.t_ref_countries Where country='India')
     ,0.15
     ,null
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_distance_travelled' and etypeattr1='Passenger' and etypeattr2='Auto - LPG')
and country_id=(SELECT id FROM static.t_ref_countries Where country='India'));

INSERT INTO static.t_ref_config_emissions_factor (config_etype_id,country_id,emission_factor,emission_source_id,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_distance_travelled' and etypeattr1='Commercial' and etypeattr2='Light Duty Vehicle (<3.5T)')
     ,(SELECT id FROM static.t_ref_countries Where country='India')
     ,0.31
     ,null
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_distance_travelled' and etypeattr1='Commercial' and etypeattr2='Light Duty Vehicle (<3.5T)')
and country_id=(SELECT id FROM static.t_ref_countries Where country='India'));

INSERT INTO static.t_ref_config_emissions_factor (config_etype_id,country_id,emission_factor,emission_source_id,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_distance_travelled' and etypeattr1='Commercial' and etypeattr2='Medium Duty Vehicle (<12T)')
     ,(SELECT id FROM static.t_ref_countries Where country='India')
     ,0.59
     ,null
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_distance_travelled' and etypeattr1='Commercial' and etypeattr2='Medium Duty Vehicle (<12T)')
and country_id=(SELECT id FROM static.t_ref_countries Where country='India'));

INSERT INTO static.t_ref_config_emissions_factor (config_etype_id,country_id,emission_factor,emission_source_id,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_distance_travelled' and etypeattr1='Commercial' and etypeattr2='Heavy Duty Vehicle (>12 T)')
     ,(SELECT id FROM static.t_ref_countries Where country='India')
     ,0.74
     ,null
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_distance_travelled' and etypeattr1='Commercial' and etypeattr2='Heavy Duty Vehicle (>12 T)')
and country_id=(SELECT id FROM static.t_ref_countries Where country='India'));

INSERT INTO static.t_ref_config_emissions_factor (config_etype_id,country_id,emission_factor,emission_source_id,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_distance_travelled' and etypeattr1='Commercial' and etypeattr2='Truck >16T')
     ,(SELECT id FROM static.t_ref_countries Where country='India')
     ,0.88
     ,null
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_distance_travelled' and etypeattr1='Commercial' and etypeattr2='Truck >16T')
and country_id=(SELECT id FROM static.t_ref_countries Where country='India'));

INSERT INTO static.t_ref_config_emissions_factor (config_etype_id,country_id,emission_factor,emission_source_id,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_distance_travelled' and etypeattr1='Commercial' and etypeattr2='Bus')
     ,(SELECT id FROM static.t_ref_countries Where country='India')
     ,0.53
     ,null
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_distance_travelled' and etypeattr1='Commercial' and etypeattr2='Bus')
and country_id=(SELECT id FROM static.t_ref_countries Where country='India'));

INSERT INTO static.t_ref_config_emissions_factor (config_etype_id,country_id,emission_factor,emission_source_id,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_distance_travelled' and etypeattr1='Commercial' and etypeattr2='Van/Omni')
     ,(SELECT id FROM static.t_ref_countries Where country='India')
     ,0.20
     ,null
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_distance_travelled' and etypeattr1='Commercial' and etypeattr2='Van/Omni')
and country_id=(SELECT id FROM static.t_ref_countries Where country='India'));

INSERT INTO static.t_ref_config_emissions_factor (config_etype_id,country_id,emission_factor,emission_source_id,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_distance_travelled' and etypeattr1='Passenger' and etypeattr2='Car - petrol')
     ,(SELECT id FROM static.t_ref_countries Where country='United Kingdom')
     ,0.14
     ,null
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_distance_travelled' and etypeattr1='Passenger' and etypeattr2='Car - petrol')
and country_id=(SELECT id FROM static.t_ref_countries Where country='United Kingdom'));

INSERT INTO static.t_ref_config_emissions_factor (config_etype_id,country_id,emission_factor,emission_source_id,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_distance_travelled' and etypeattr1='Passenger' and etypeattr2='Car - diesel')
     ,(SELECT id FROM static.t_ref_countries Where country='United Kingdom')
     ,0.14
     ,null
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_distance_travelled' and etypeattr1='Passenger' and etypeattr2='Car - diesel')
and country_id=(SELECT id FROM static.t_ref_countries Where country='United Kingdom'));

INSERT INTO static.t_ref_config_emissions_factor (config_etype_id,country_id,emission_factor,emission_source_id,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_distance_travelled' and etypeattr1='Commercial' and etypeattr2='Light Duty Vehicle (<3.5T)')
     ,(SELECT id FROM static.t_ref_countries Where country='United Kingdom')
     ,0.24
     ,null
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_distance_travelled' and etypeattr1='Commercial' and etypeattr2='Light Duty Vehicle (<3.5T)')
and country_id=(SELECT id FROM static.t_ref_countries Where country='United Kingdom'));

INSERT INTO static.t_ref_config_emissions_factor (config_etype_id,country_id,emission_factor,emission_source_id,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_distance_travelled' and etypeattr1='Commercial' and etypeattr2='Medium Duty Vehicle (<12T)')
     ,(SELECT id FROM static.t_ref_countries Where country='United Kingdom')
     ,0.48
     ,null
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_distance_travelled' and etypeattr1='Commercial' and etypeattr2='Medium Duty Vehicle (<12T)')
and country_id=(SELECT id FROM static.t_ref_countries Where country='United Kingdom'));

INSERT INTO static.t_ref_config_emissions_factor (config_etype_id,country_id,emission_factor,emission_source_id,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_distance_travelled' and etypeattr1='Commercial' and etypeattr2='Heavy Duty Vehicle (>12 T)')
     ,(SELECT id FROM static.t_ref_countries Where country='United Kingdom')
     ,0.59
     ,null
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_distance_travelled' and etypeattr1='Commercial' and etypeattr2='Heavy Duty Vehicle (>12 T)')
and country_id=(SELECT id FROM static.t_ref_countries Where country='United Kingdom'));

INSERT INTO static.t_ref_config_emissions_factor (config_etype_id,country_id,emission_factor,emission_source_id,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_distance_travelled' and etypeattr1='Commercial' and etypeattr2='Truck >16T')
     ,(SELECT id FROM static.t_ref_countries Where country='United Kingdom')
     ,0.96
     ,null
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_distance_travelled' and etypeattr1='Commercial' and etypeattr2='Truck >16T')
and country_id=(SELECT id FROM static.t_ref_countries Where country='United Kingdom'));

INSERT INTO static.t_ref_config_emissions_factor (config_etype_id,country_id,emission_factor,emission_source_id,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_distance_travelled' and etypeattr1='Commercial' and etypeattr2='Bus')
     ,(SELECT id FROM static.t_ref_countries Where country='United Kingdom')
     ,0.10
     ,null
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_distance_travelled' and etypeattr1='Commercial' and etypeattr2='Bus')
and country_id=(SELECT id FROM static.t_ref_countries Where country='United Kingdom'));

INSERT INTO static.t_ref_config_emissions_factor (config_etype_id,country_id,emission_factor,emission_source_id,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_distance_travelled' and etypeattr1='Commercial' and etypeattr2='Van/Omni')
     ,(SELECT id FROM static.t_ref_countries Where country='United Kingdom')
     ,0.24
     ,null
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_distance_travelled' and etypeattr1='Commercial' and etypeattr2='Van/Omni')
and country_id=(SELECT id FROM static.t_ref_countries Where country='United Kingdom'));


INSERT INTO static.t_ref_config_emissions_factor (config_etype_id,country_id,emission_factor,emission_source_id,date_added,added_by,date_modified,modified_by,start_date,end_date)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope2_grid_emission')
     ,(SELECT id FROM static.t_ref_countries Where country='United Kingdom')
     ,0.21
     ,(select list_id from static.t_ref_list WHERE list_key='impactm_emission_factor_source' and list_value='UK Government Greenhouse Gas Reporting Factors')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
     ,'2020-07-01'
     ,'2021-06-30'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope2_grid_emission')
and country_id=(SELECT id FROM static.t_ref_countries Where country='United Kingdom')
and start_date='2020-07-01'
and end_date ='2021-06-30');

INSERT INTO static.t_ref_config_emissions_factor (config_etype_id,continent_id,emission_factor,emission_source_id,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope2_grid_emission')
     ,(SELECT id FROM static.t_ref_continent Where continent='Europe')
     ,0.28
     ,(select list_id from static.t_ref_list WHERE list_key='impactm_emission_factor_source' and list_value='2018, European environment agency')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope2_grid_emission')
and continent_id=(SELECT id FROM static.t_ref_continent Where continent='Europe'));

INSERT INTO static.t_ref_config_emissions_factor (config_etype_id,country_id,emission_factor,emission_source_id,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope2_grid_emission')
     ,(SELECT id FROM static.t_ref_countries Where country='India')
     ,0.82
     ,(select list_id from static.t_ref_list WHERE list_key='impactm_emission_factor_source' and list_value='Dec 2018, Central Electricity Authority')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope2_grid_emission')
and country_id=(SELECT id FROM static.t_ref_countries Where country='India'));

INSERT INTO static.t_ref_config_emissions_factor (config_etype_id,country_id,emission_factor,emission_source_id,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope2_grid_emission')
     ,(SELECT id FROM static.t_ref_countries Where country='Northern Ireland')
     ,0.33
     ,(select list_id from static.t_ref_list WHERE list_key='impactm_emission_factor_source' and list_value='2019, Northern Ireland Carbon Intensity Indicators 2021')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope2_grid_emission')
and country_id=(SELECT id FROM static.t_ref_countries Where country='Northern Ireland'));

INSERT INTO static.t_ref_config_emissions_factor (config_etype_id,country_id,emission_factor,emission_source_id,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope2_grid_emission')
     ,(SELECT id FROM static.t_ref_countries Where country='Ireland')
     ,0.28
     ,null
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope2_grid_emission')
and country_id=(SELECT id FROM static.t_ref_countries Where country='Ireland'));

INSERT INTO static.t_ref_config_emissions_factor (config_etype_id,country_id,emission_factor,emission_source_id,date_added,added_by,date_modified,modified_by,start_date,end_date)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope2_grid_emission')
     ,(SELECT id FROM static.t_ref_countries Where country='Australia')
     ,0.77
     ,(select list_id from static.t_ref_list WHERE list_key='impactm_emission_factor_source' and list_value='Australian Government National Greenhouse Factors')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
     ,'2019-07-01'
     ,'2022-06-30'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope2_grid_emission')
and country_id=(SELECT id FROM static.t_ref_countries Where country='Australia')
and start_date='2019-07-01'
and end_date ='2022-06-30');


INSERT INTO static.t_ref_config_emissions_factor (config_etype_id,state_id,emission_factor,emission_source_id,date_added,added_by,date_modified,modified_by,start_date,end_date)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope2_grid_emission')
     ,(select id from static.t_ref_country_states where state_name='New South Wales')
     ,0.81
     ,(select list_id from static.t_ref_list WHERE list_key='impactm_emission_factor_source' and list_value='Australian Government National Greenhouse Factors')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
     ,'2019-07-01'
     ,'2022-06-30'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope2_grid_emission')
and state_id=(select id from static.t_ref_country_states where state_name='New South Wales')
and start_date='2019-07-01'
and end_date ='2022-06-30');

INSERT INTO static.t_ref_config_emissions_factor (config_etype_id,state_id,emission_factor,emission_source_id,date_added,added_by,date_modified,modified_by,start_date,end_date)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope2_grid_emission')
     ,(select id from static.t_ref_country_states where state_name='Victoria')
     ,0.98
     ,(select list_id from static.t_ref_list WHERE list_key='impactm_emission_factor_source' and list_value='Australian Government National Greenhouse Factors')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
     ,'2019-07-01'
     ,'2022-06-30'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope2_grid_emission')
and state_id=(select id from static.t_ref_country_states where state_name='Victoria')
and start_date='2019-07-01'
and end_date ='2022-06-30');

INSERT INTO static.t_ref_config_emissions_factor (config_etype_id,state_id,emission_factor,emission_source_id,date_added,added_by,date_modified,modified_by,start_date,end_date)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope2_grid_emission')
     ,(select id from static.t_ref_country_states where state_name='Queensland')
     ,0.81
     ,(select list_id from static.t_ref_list WHERE list_key='impactm_emission_factor_source' and list_value='Australian Government National Greenhouse Factors')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
     ,'2019-07-01'
     ,'2022-06-30'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope2_grid_emission')
and state_id=(select id from static.t_ref_country_states where state_name='Queensland')
and start_date='2019-07-01'
and end_date ='2022-06-30');

INSERT INTO static.t_ref_config_emissions_factor (config_etype_id,state_id,emission_factor,emission_source_id,date_added,added_by,date_modified,modified_by,start_date,end_date)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope2_grid_emission')
     ,(select id from static.t_ref_country_states where state_name='South Australia')
     ,0.43
     ,(select list_id from static.t_ref_list WHERE list_key='impactm_emission_factor_source' and list_value='Australian Government National Greenhouse Factors')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
     ,'2019-07-01'
     ,'2022-06-30'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope2_grid_emission')
and state_id=(select id from static.t_ref_country_states where state_name='South Australia')
and start_date='2019-07-01'
and end_date ='2022-06-30');

INSERT INTO static.t_ref_config_emissions_factor (config_etype_id,state_id,emission_factor,emission_source_id,date_added,added_by,date_modified,modified_by,start_date,end_date)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope2_grid_emission')
     ,(select id from static.t_ref_country_states where state_name='Western Australia')
     ,0.68
     ,(select list_id from static.t_ref_list WHERE list_key='impactm_emission_factor_source' and list_value='Australian Government National Greenhouse Factors')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
     ,'2019-07-01'
     ,'2022-06-30'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope2_grid_emission')
and state_id=(select id from static.t_ref_country_states where state_name='Western Australia')
and start_date='2019-07-01'
and end_date ='2022-06-30');

INSERT INTO static.t_ref_config_emissions_factor (config_etype_id,state_id,emission_factor,emission_source_id,date_added,added_by,date_modified,modified_by,start_date,end_date)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope2_grid_emission')
     ,(select id from static.t_ref_country_states where state_name='Tasmania')
     ,0.17
     ,(select list_id from static.t_ref_list WHERE list_key='impactm_emission_factor_source' and list_value='Australian Government National Greenhouse Factors')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
     ,'2019-07-01'
     ,'2022-06-30'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope2_grid_emission')
and state_id=(select id from static.t_ref_country_states where state_name='Tasmania')
and start_date='2019-07-01'
and end_date ='2022-06-30');

INSERT INTO static.t_ref_config_emissions_factor (config_etype_id,state_id,emission_factor,emission_source_id,date_added,added_by,date_modified,modified_by,start_date,end_date)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope2_grid_emission')
     ,(select id from static.t_ref_country_states where state_name='Northern Territory')
     ,0.62
     ,(select list_id from static.t_ref_list WHERE list_key='impactm_emission_factor_source' and list_value='Australian Government National Greenhouse Factors')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
     ,'2019-07-01'
     ,'2022-06-30'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope2_grid_emission')
and state_id=(select id from static.t_ref_country_states where state_name='Northern Territory')
and start_date='2019-07-01'
and end_date ='2022-06-30');

INSERT INTO static.t_ref_config_emissions_factor (config_etype_id,state_id,emission_factor,emission_source_id,date_added,added_by,date_modified,modified_by,start_date,end_date)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope2_grid_emission')
     ,(select id from static.t_ref_country_states where state_name='Australian Capital Territory')
     ,0.81
     ,(select list_id from static.t_ref_list WHERE list_key='impactm_emission_factor_source' and list_value='Australian Government National Greenhouse Factors')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
     ,'2019-07-01'
     ,'2022-06-30'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope2_grid_emission')
and state_id=(select id from static.t_ref_country_states where state_name='Australian Capital Territory')
and start_date='2019-07-01'
and end_date ='2022-06-30');


INSERT INTO static.t_ref_config_emissions_factor (config_etype_id,country_id,emission_factor,emission_source_id,date_added,added_by,date_modified,modified_by,start_date,end_date)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope2_grid_emission')
     ,(SELECT id FROM static.t_ref_countries Where country='Australia')
     ,0.77
     ,(select list_id from static.t_ref_list WHERE list_key='impactm_emission_factor_source' and list_value='Australian Government National Greenhouse Factors')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
     ,'2020-07-01'
     ,'2021-06-30'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope2_grid_emission')
and country_id=(SELECT id FROM static.t_ref_countries Where country='Australia')
and start_date='2020-07-01'
and end_date ='2021-06-30');

INSERT INTO static.t_ref_config_emissions_factor (config_etype_id,state_id,emission_factor,emission_source_id,date_added,added_by,date_modified,modified_by,start_date,end_date)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope2_grid_emission')
     ,(select id from static.t_ref_country_states where state_name='New South Wales')
     ,0.79
     ,(select list_id from static.t_ref_list WHERE list_key='impactm_emission_factor_source' and list_value='Australian Government National Greenhouse Factors')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
     ,'2020-07-01'
     ,'2021-06-30'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope2_grid_emission')
and state_id=(select id from static.t_ref_country_states where state_name='New South Wales')
and start_date='2020-07-01'
and end_date ='2021-06-30');

INSERT INTO static.t_ref_config_emissions_factor (config_etype_id,state_id,emission_factor,emission_source_id,date_added,added_by,date_modified,modified_by,start_date,end_date)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope2_grid_emission')
     ,(select id from static.t_ref_country_states where state_name='Victoria')
     ,0.96
     ,(select list_id from static.t_ref_list WHERE list_key='impactm_emission_factor_source' and list_value='Australian Government National Greenhouse Factors')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
     ,'2020-07-01'
     ,'2021-06-30'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope2_grid_emission')
and state_id=(select id from static.t_ref_country_states where state_name='Victoria')
and start_date='2020-07-01'
and end_date ='2021-06-30');

INSERT INTO static.t_ref_config_emissions_factor (config_etype_id,state_id,emission_factor,emission_source_id,date_added,added_by,date_modified,modified_by,start_date,end_date)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope2_grid_emission')
     ,(select id from static.t_ref_country_states where state_name='Queensland')
     ,0.80
     ,(select list_id from static.t_ref_list WHERE list_key='impactm_emission_factor_source' and list_value='Australian Government National Greenhouse Factors')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
     ,'2020-07-01'
     ,'2021-06-30'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope2_grid_emission')
and state_id=(select id from static.t_ref_country_states where state_name='Queensland')
and start_date='2020-07-01'
and end_date ='2021-06-30');


INSERT INTO static.t_ref_config_emissions_factor (config_etype_id,state_id,emission_factor,emission_source_id,date_added,added_by,date_modified,modified_by,start_date,end_date)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope2_grid_emission')
     ,(select id from static.t_ref_country_states where state_name='South Australia')
     ,0.35
     ,(select list_id from static.t_ref_list WHERE list_key='impactm_emission_factor_source' and list_value='Australian Government National Greenhouse Factors')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
     ,'2020-07-01'
     ,'2021-06-30'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope2_grid_emission')
and state_id=(select id from static.t_ref_country_states where state_name='South Australia')
and start_date='2020-07-01'
and end_date ='2021-06-30');

INSERT INTO static.t_ref_config_emissions_factor (config_etype_id,state_id,emission_factor,emission_source_id,date_added,added_by,date_modified,modified_by,start_date,end_date)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope2_grid_emission')
     ,(select id from static.t_ref_country_states where state_name='Western Australia')
     ,0.58
     ,(select list_id from static.t_ref_list WHERE list_key='impactm_emission_factor_source' and list_value='Australian Government National Greenhouse Factors')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
     ,'2020-07-01'
     ,'2021-06-30'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope2_grid_emission')
and state_id=(select id from static.t_ref_country_states where state_name='Western Australia')
and start_date='2020-07-01'
and end_date ='2021-06-30');

INSERT INTO static.t_ref_config_emissions_factor (config_etype_id,state_id,emission_factor,emission_source_id,date_added,added_by,date_modified,modified_by,start_date,end_date)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope2_grid_emission')
     ,(select id from static.t_ref_country_states where state_name='Tasmania')
     ,0.16
     ,(select list_id from static.t_ref_list WHERE list_key='impactm_emission_factor_source' and list_value='Australian Government National Greenhouse Factors')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
     ,'2020-07-01'
     ,'2021-06-30'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope2_grid_emission')
and state_id=(select id from static.t_ref_country_states where state_name='Tasmania')
and start_date='2020-07-01'
and end_date ='2021-06-30');

INSERT INTO static.t_ref_config_emissions_factor (config_etype_id,state_id,emission_factor,emission_source_id,date_added,added_by,date_modified,modified_by,start_date,end_date)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope2_grid_emission')
     ,(select id from static.t_ref_country_states where state_name='Northern Territory')
     ,0.57
     ,(select list_id from static.t_ref_list WHERE list_key='impactm_emission_factor_source' and list_value='Australian Government National Greenhouse Factors')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
     ,'2020-07-01'
     ,'2021-06-30'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope2_grid_emission')
and state_id=(select id from static.t_ref_country_states where state_name='Northern Territory')
and start_date='2020-07-01'
and end_date ='2021-06-30');

INSERT INTO static.t_ref_config_emissions_factor (config_etype_id,state_id,emission_factor,emission_source_id,date_added,added_by,date_modified,modified_by,start_date,end_date)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope2_grid_emission')
     ,(select id from static.t_ref_country_states where state_name='Australian Capital Territory')
     ,0.79
     ,(select list_id from static.t_ref_list WHERE list_key='impactm_emission_factor_source' and list_value='Australian Government National Greenhouse Factors')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
     ,'2020-07-01'
     ,'2021-06-30'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope2_grid_emission')
and state_id=(select id from static.t_ref_country_states where state_name='Australian Capital Territory')
and start_date='2020-07-01'
and end_date ='2021-06-30');

INSERT INTO static.t_ref_config_emissions_factor
(config_etype_id,country_id,emission_factor,emission_source_id,date_added,added_by,date_modified,modified_by,start_date,end_date)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_stationary_fuel_combustion' and etypeattr1='Gasoline')
     ,(SELECT id FROM static.t_ref_countries Where country='Australia')
     ,67.80
     ,(select list_id from static.t_ref_list WHERE list_key='impactm_emission_factor_source' and list_value='Australian Government National Greenhouse Factors')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
     ,'2020-07-01'
     ,'2021-06-30'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_stationary_fuel_combustion' and etypeattr1='Gasoline')
and country_id=(SELECT id FROM static.t_ref_countries Where country='Australia')
and start_date='2020-07-01'
 and end_date='2021-06-30'
);

INSERT INTO static.t_ref_config_emissions_factor
(config_etype_id,country_id,emission_factor,emission_source_id,date_added,added_by,date_modified,modified_by,start_date,end_date)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_stationary_fuel_combustion' and etypeattr1='Kerosene')
     ,(SELECT id FROM static.t_ref_countries Where country='Australia')
     ,69.11
     ,(select list_id from static.t_ref_list WHERE list_key='impactm_emission_factor_source' and list_value='Australian Government National Greenhouse Factors')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
     ,'2020-07-01'
     ,'2021-06-30'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_stationary_fuel_combustion' and etypeattr1='Kerosene')
and country_id=(SELECT id FROM static.t_ref_countries Where country='Australia')
and start_date='2020-07-01'
 and end_date='2021-06-30'
);

INSERT INTO static.t_ref_config_emissions_factor
(config_etype_id,country_id,emission_factor,emission_source_id,date_added,added_by,date_modified,modified_by,start_date,end_date)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_stationary_fuel_combustion' and etypeattr1='Heating oil')
     ,(SELECT id FROM static.t_ref_countries Where country='Australia')
     ,69.73
     ,(select list_id from static.t_ref_list WHERE list_key='impactm_emission_factor_source' and list_value='Australian Government National Greenhouse Factors')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
     ,'2020-07-01'
     ,'2021-06-30'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_stationary_fuel_combustion' and etypeattr1='Heating oil')
and country_id=(SELECT id FROM static.t_ref_countries Where country='Australia')
and start_date='2020-07-01'
 and end_date='2021-06-30'
);

INSERT INTO static.t_ref_config_emissions_factor
(config_etype_id,country_id,emission_factor,emission_source_id,date_added,added_by,date_modified,modified_by,start_date,end_date)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_stationary_fuel_combustion' and etypeattr1='Diesel oil')
     ,(SELECT id FROM static.t_ref_countries Where country='Australia')
     ,70.20
     ,(select list_id from static.t_ref_list WHERE list_key='impactm_emission_factor_source' and list_value='Australian Government National Greenhouse Factors')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
     ,'2020-07-01'
     ,'2021-06-30'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_stationary_fuel_combustion' and etypeattr1='Diesel oil')
and country_id=(SELECT id FROM static.t_ref_countries Where country='Australia')
and start_date='2020-07-01'
 and end_date='2021-06-30'
);

INSERT INTO static.t_ref_config_emissions_factor
(config_etype_id,country_id,emission_factor,emission_source_id,date_added,added_by,date_modified,modified_by,start_date,end_date)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_stationary_fuel_combustion' and etypeattr1='Fuel oil')
     ,(SELECT id FROM static.t_ref_countries Where country='Australia')
     ,73.84
     ,(select list_id from static.t_ref_list WHERE list_key='impactm_emission_factor_source' and list_value='Australian Government National Greenhouse Factors')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
     ,'2020-07-01'
     ,'2021-06-30'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_stationary_fuel_combustion' and etypeattr1='Fuel oil')
and country_id=(SELECT id FROM static.t_ref_countries Where country='Australia')
and start_date='2020-07-01'
 and end_date='2021-06-30'
);

INSERT INTO static.t_ref_config_emissions_factor
(config_etype_id,country_id,emission_factor,emission_source_id,date_added,added_by,date_modified,modified_by,start_date,end_date)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_stationary_fuel_combustion' and etypeattr1='Liquefied petroleum gas (LPG)' and etype_unit1='GJ')
     ,(SELECT id FROM static.t_ref_countries Where country='Australia')
     ,60.60
     ,(select list_id from static.t_ref_list WHERE list_key='impactm_emission_factor_source' and list_value='Australian Government National Greenhouse Factors')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
     ,'2020-07-01'
     ,'2021-06-30'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_stationary_fuel_combustion' and etypeattr1='Liquefied petroleum gas (LPG)' and etype_unit1='GJ')
and country_id=(SELECT id FROM static.t_ref_countries Where country='Australia')
and start_date='2020-07-01'
 and end_date='2021-06-30'
);
INSERT INTO static.t_ref_config_emissions_factor
(config_etype_id,country_id,emission_factor,emission_source_id,date_added,added_by,date_modified,modified_by,start_date,end_date)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_mobile_fuel_combustion' and etypeattr1='Gasoline')
     ,(SELECT id FROM static.t_ref_countries Where country='Australia')
     ,2318.76
     ,(select list_id from static.t_ref_list WHERE list_key='impactm_emission_factor_source' and list_value='Australian Government National Greenhouse Factors')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
     ,'2020-07-01'
     ,'2021-06-30'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_mobile_fuel_combustion' and etypeattr1='Gasoline')
and country_id=(SELECT id FROM static.t_ref_countries Where country='Australia')
and start_date='2020-07-01'
 and end_date='2021-06-30'
);

INSERT INTO static.t_ref_config_emissions_factor
(config_etype_id,country_id,emission_factor,emission_source_id,date_added,added_by,date_modified,modified_by,start_date,end_date)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_mobile_fuel_combustion' and etypeattr1='Diesel oil')
     ,(SELECT id FROM static.t_ref_countries Where country='Australia')
     ,2591.63
     ,(select list_id from static.t_ref_list WHERE list_key='impactm_emission_factor_source' and list_value='Australian Government National Greenhouse Factors')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
     ,'2020-07-01'
     ,'2021-06-30'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_mobile_fuel_combustion' and etypeattr1='Diesel oil')
and country_id=(SELECT id FROM static.t_ref_countries Where country='Australia')
and start_date='2020-07-01'
 and end_date='2021-06-30'
);

INSERT INTO static.t_ref_config_emissions_factor
(config_etype_id,country_id,emission_factor,emission_source_id,date_added,added_by,date_modified,modified_by,start_date,end_date)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_mobile_fuel_combustion' and etypeattr1='Ethanol')
     ,(SELECT id FROM static.t_ref_countries Where country='Australia')
     ,2709.72
     ,(select list_id from static.t_ref_list WHERE list_key='impactm_emission_factor_source' and list_value='Australian Government National Greenhouse Factors')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
     ,'2020-07-01'
     ,'2021-06-30'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_mobile_fuel_combustion' and etypeattr1='Ethanol')
and country_id=(SELECT id FROM static.t_ref_countries Where country='Australia')
and start_date='2020-07-01'
 and end_date='2021-06-30'
);

INSERT INTO static.t_ref_config_emissions_factor
(config_etype_id,country_id,emission_factor,emission_source_id,date_added,added_by,date_modified,modified_by,start_date,end_date)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_mobile_fuel_combustion' and etypeattr1='Liquefied petroleum gas (LPG)' and etype_unit1='GJ')
     ,(SELECT id FROM static.t_ref_countries Where country='Australia')
     ,2600.93
     ,(select list_id from static.t_ref_list WHERE list_key='impactm_emission_factor_source' and list_value='Australian Government National Greenhouse Factors')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
     ,'2020-07-01'
     ,'2021-06-30'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_mobile_fuel_combustion' and etypeattr1='Liquefied petroleum gas (LPG)'  and etype_unit1='GJ')
and country_id=(SELECT id FROM static.t_ref_countries Where country='Australia')
and start_date='2020-07-01'
 and end_date='2021-06-30'
);

INSERT INTO static.t_ref_config_emissions_factor
(config_etype_id,emission_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='Carbon dioxide'),1,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='Carbon dioxide')
);
INSERT INTO static.t_ref_config_emissions_factor
(config_etype_id,emission_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='Methane'),25,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='Methane')
);
INSERT INTO static.t_ref_config_emissions_factor
(config_etype_id,emission_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='Nitrous oxide'),298,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='Nitrous oxide')
);
INSERT INTO static.t_ref_config_emissions_factor
(config_etype_id,emission_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='HFC-23'),14800,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='HFC-23')
);
INSERT INTO static.t_ref_config_emissions_factor
(config_etype_id,emission_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='HFC-32'),675,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='HFC-32')
);
INSERT INTO static.t_ref_config_emissions_factor
(config_etype_id,emission_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='HFC-41'),92,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='HFC-41')
);
INSERT INTO static.t_ref_config_emissions_factor
(config_etype_id,emission_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='HFC-125'),3500,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='HFC-125')
);
INSERT INTO static.t_ref_config_emissions_factor
(config_etype_id,emission_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='HFC-134'),1100,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='HFC-134')
);
INSERT INTO static.t_ref_config_emissions_factor
(config_etype_id,emission_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='HFC-134a'),1430,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='HFC-134a')
);
INSERT INTO static.t_ref_config_emissions_factor
(config_etype_id,emission_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='HFC-143'),353,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='HFC-143')
);
INSERT INTO static.t_ref_config_emissions_factor
(config_etype_id,emission_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='HFC-143a'),4470,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='HFC-143a')
);
INSERT INTO static.t_ref_config_emissions_factor
(config_etype_id,emission_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='HFC-152a'),124,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='HFC-152a')
);
INSERT INTO static.t_ref_config_emissions_factor
(config_etype_id,emission_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='HFC-227ea'),3220,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='HFC-227ea')
);
INSERT INTO static.t_ref_config_emissions_factor
(config_etype_id,emission_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='HFC-236fa'),9810,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='HFC-236fa')
);
INSERT INTO static.t_ref_config_emissions_factor
(config_etype_id,emission_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='HFC-245fa'),1030,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='HFC-245fa')
);
INSERT INTO static.t_ref_config_emissions_factor
(config_etype_id,emission_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='HFC-43-I0mee'),1640,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='HFC-43-I0mee')
);
INSERT INTO static.t_ref_config_emissions_factor
(config_etype_id,emission_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='Perfluoromethane (PFC-14)'),7390,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='Perfluoromethane (PFC-14)')
);
INSERT INTO static.t_ref_config_emissions_factor
(config_etype_id,emission_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='Perfluoroethane (PFC-116)'),12200,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='Perfluoroethane (PFC-116)')
);
INSERT INTO static.t_ref_config_emissions_factor
(config_etype_id,emission_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='Perfluoropropane (PFC-218)'),8830,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='Perfluoropropane (PFC-218)')
);
INSERT INTO static.t_ref_config_emissions_factor
(config_etype_id,emission_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='Perfluorocyclobutane (PFC-318)'),10300,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='Perfluorocyclobutane (PFC-318)')
);
INSERT INTO static.t_ref_config_emissions_factor
(config_etype_id,emission_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='Perfluorobutane (PFC-3-1-10)'),8860,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='Perfluorobutane (PFC-3-1-10)')
);
INSERT INTO static.t_ref_config_emissions_factor
(config_etype_id,emission_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='Perfluoropentane (PFC-4-1-12)'),9160,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='Perfluoropentane (PFC-4-1-12)')
);
INSERT INTO static.t_ref_config_emissions_factor
(config_etype_id,emission_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='Perfluorohexane (PFC-5-1-14)'),9300,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='Perfluorohexane (PFC-5-1-14)')
);
INSERT INTO static.t_ref_config_emissions_factor
(config_etype_id,emission_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='Sulphur hexafluoride (SF6)'),22800,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='Sulphur hexafluoride (SF6)')
);
INSERT INTO static.t_ref_config_emissions_factor
(config_etype_id,emission_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='HFC-152'),53,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='HFC-152')
);
INSERT INTO static.t_ref_config_emissions_factor
(config_etype_id,emission_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='HFC-161'),12,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='HFC-161')
);
INSERT INTO static.t_ref_config_emissions_factor
(config_etype_id,emission_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='HFC-236cb'),1340,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='HFC-236cb')
);
INSERT INTO static.t_ref_config_emissions_factor
(config_etype_id,emission_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='HFC-236ea'),1370,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='HFC-236ea')
);
INSERT INTO static.t_ref_config_emissions_factor
(config_etype_id,emission_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='HFC-245ca'),693,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='HFC-245ca')
);
INSERT INTO static.t_ref_config_emissions_factor
(config_etype_id,emission_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='HFC-365mfc'),794,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='HFC-365mfc')
);
INSERT INTO static.t_ref_config_emissions_factor
(config_etype_id,emission_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='HFC-23 (R-23)'),12400,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='HFC-23 (R-23)')
);
INSERT INTO static.t_ref_config_emissions_factor
(config_etype_id,emission_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='HFC-32 (R-32)'),677,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='HFC-32 (R-32)')
);
INSERT INTO static.t_ref_config_emissions_factor
(config_etype_id,emission_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='HFC-41 (R-41)'),116,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='HFC-41 (R-41)')
);
INSERT INTO static.t_ref_config_emissions_factor
(config_etype_id,emission_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='HFC-125 (R-125)'),3170,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='HFC-125 (R-125)')
);
INSERT INTO static.t_ref_config_emissions_factor
(config_etype_id,emission_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='HFC-134 (R-134)'),1120,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='HFC-134 (R-134)')
);
INSERT INTO static.t_ref_config_emissions_factor
(config_etype_id,emission_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='HFC-134a (R-134a)'),1300,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='HFC-134a (R-134a)')
);
INSERT INTO static.t_ref_config_emissions_factor
(config_etype_id,emission_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='HFC-143 (R-143)'),328,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='HFC-143 (R-143)')
);
INSERT INTO static.t_ref_config_emissions_factor
(config_etype_id,emission_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='HFC-143a (R-143a)'),4800,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='HFC-143a (R-143a)')
);
INSERT INTO static.t_ref_config_emissions_factor
(config_etype_id,emission_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='HFC-152 (R-152)'),16,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='HFC-152 (R-152)')
);
INSERT INTO static.t_ref_config_emissions_factor
(config_etype_id,emission_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='HFC-152a (R-152a)'),138,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='HFC-152a (R-152a)')
);
INSERT INTO static.t_ref_config_emissions_factor
(config_etype_id,emission_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='HFC-161 (R-161)'),4,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='HFC-161 (R-161)')
);
INSERT INTO static.t_ref_config_emissions_factor
(config_etype_id,emission_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='HFC-227ea (R-227ea)'),3350,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='HFC-227ea (R-227ea)')
);
INSERT INTO static.t_ref_config_emissions_factor
(config_etype_id,emission_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='HFC-236cb (R-236cb)'),1120,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='HFC-236cb (R-236cb)')
);
INSERT INTO static.t_ref_config_emissions_factor
(config_etype_id,emission_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='HFC-236ea (R-236ea)'),1330,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='HFC-236ea (R-236ea)')
);
INSERT INTO static.t_ref_config_emissions_factor
(config_etype_id,emission_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='HFC-236fa (R-236fa)'),8060,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='HFC-236fa (R-236fa)')
);
INSERT INTO static.t_ref_config_emissions_factor
(config_etype_id,emission_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='HFC-245ca (R-245ca)'),716,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='HFC-245ca (R-245ca)')
);
INSERT INTO static.t_ref_config_emissions_factor
(config_etype_id,emission_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='HFC-245fa (R-245fa)'),858,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='HFC-245fa (R-245fa)')
);
INSERT INTO static.t_ref_config_emissions_factor
(config_etype_id,emission_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='HFC-365mfc  '),804,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='HFC-365mfc  ')
);
INSERT INTO static.t_ref_config_emissions_factor
(config_etype_id,emission_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='HFC-43-10mee (R-4310)'),1650,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='HFC-43-10mee (R-4310)')
);
INSERT INTO static.t_ref_config_emissions_factor
(config_etype_id,emission_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='PFC-14 (Perfluoromethane)'),6630,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='PFC-14 (Perfluoromethane)')
);
INSERT INTO static.t_ref_config_emissions_factor
(config_etype_id,emission_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='PFC-116 (Perfluoroethane)  '),11100,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='PFC-116 (Perfluoroethane)  ')
);
INSERT INTO static.t_ref_config_emissions_factor
(config_etype_id,emission_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='PFC-218 (Perfluoropropane)  '),8900,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='PFC-218 (Perfluoropropane)  ')
);
INSERT INTO static.t_ref_config_emissions_factor
(config_etype_id,emission_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='PFC-318 (Perfluorocyclobutane)'),9540,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='PFC-318 (Perfluorocyclobutane)')
);
INSERT INTO static.t_ref_config_emissions_factor
(config_etype_id,emission_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='PFC-3-1-10 (Perfluorobutane)  '),9200,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='PFC-3-1-10 (Perfluorobutane)  ')
);
INSERT INTO static.t_ref_config_emissions_factor
(config_etype_id,emission_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='PFC-4-1-12 (Perfluoropentane)  '),8550,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='PFC-4-1-12 (Perfluoropentane)  ')
);
INSERT INTO static.t_ref_config_emissions_factor
(config_etype_id,emission_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='PFC-5-1-14 (Perfluorohexane)  '),7910,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='PFC-5-1-14 (Perfluorohexane)  ')
);
INSERT INTO static.t_ref_config_emissions_factor
(config_etype_id,emission_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='PFC-9-1-18 (Perfluorodecalin)  '),7190,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='PFC-9-1-18 (Perfluorodecalin)  ')
);
INSERT INTO static.t_ref_config_emissions_factor
(config_etype_id,emission_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='R-401A'),17.94,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='R-401A')
);
INSERT INTO static.t_ref_config_emissions_factor
(config_etype_id,emission_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='R-401B'),15,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='R-401B')
);
INSERT INTO static.t_ref_config_emissions_factor
(config_etype_id,emission_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='R-401C'),20.7,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='R-401C')
);
INSERT INTO static.t_ref_config_emissions_factor
(config_etype_id,emission_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='R-402A'),1902,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='R-402A')
);
INSERT INTO static.t_ref_config_emissions_factor
(config_etype_id,emission_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='R-402B'),1205,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='R-402B')
);
INSERT INTO static.t_ref_config_emissions_factor
(config_etype_id,emission_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='R-403A'),1780,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='R-403A')
);
INSERT INTO static.t_ref_config_emissions_factor
(config_etype_id,emission_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='R-403B'),3471,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='R-403B')
);
INSERT INTO static.t_ref_config_emissions_factor
(config_etype_id,emission_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='R-404A'),3943,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='R-404A')
);
INSERT INTO static.t_ref_config_emissions_factor
(config_etype_id,emission_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='R-407A'),1923,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='R-407A')
);
INSERT INTO static.t_ref_config_emissions_factor
(config_etype_id,emission_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='R-407B'),2547,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='R-407B')
);
INSERT INTO static.t_ref_config_emissions_factor
(config_etype_id,emission_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='R-407C'),1624,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='R-407C')
);
INSERT INTO static.t_ref_config_emissions_factor
(config_etype_id,emission_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='R-407D'),1487,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='R-407D')
);
INSERT INTO static.t_ref_config_emissions_factor
(config_etype_id,emission_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='R-407E'),1425,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='R-407E')
);
INSERT INTO static.t_ref_config_emissions_factor
(config_etype_id,emission_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='R-407F'),1674,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='R-407F')
);
INSERT INTO static.t_ref_config_emissions_factor
(config_etype_id,emission_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='R-408A'),2430,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='R-408A')
);
INSERT INTO static.t_ref_config_emissions_factor
(config_etype_id,emission_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='R-410A'),1924,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='R-410A')
);
INSERT INTO static.t_ref_config_emissions_factor
(config_etype_id,emission_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='R-410B'),2048,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='R-410B')
);
INSERT INTO static.t_ref_config_emissions_factor
(config_etype_id,emission_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='R-411A'),15,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='R-411A')
);
INSERT INTO static.t_ref_config_emissions_factor
(config_etype_id,emission_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='R-411B'),4.14,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='R-411B')
);
INSERT INTO static.t_ref_config_emissions_factor
(config_etype_id,emission_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='R-412A'),445,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='R-412A')
);
INSERT INTO static.t_ref_config_emissions_factor
(config_etype_id,emission_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='R-415A'),24.84,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='R-415A')
);
INSERT INTO static.t_ref_config_emissions_factor
(config_etype_id,emission_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='R-415B'),104,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='R-415B')
);
INSERT INTO static.t_ref_config_emissions_factor
(config_etype_id,emission_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='R-416A'),767,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='R-416A')
);
INSERT INTO static.t_ref_config_emissions_factor
(config_etype_id,emission_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='R-417A'),2127,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='R-417A')
);
INSERT INTO static.t_ref_config_emissions_factor
(config_etype_id,emission_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='R-417B'),2742,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='R-417B')
);
INSERT INTO static.t_ref_config_emissions_factor
(config_etype_id,emission_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='R-417C'),1643,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='R-417C')
);
INSERT INTO static.t_ref_config_emissions_factor
(config_etype_id,emission_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='R-418A'),3.45,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='R-418A')
);
INSERT INTO static.t_ref_config_emissions_factor
(config_etype_id,emission_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='R-419A'),2688,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='R-419A')
);
INSERT INTO static.t_ref_config_emissions_factor
(config_etype_id,emission_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='R-419B'),2161,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='R-419B')
);
INSERT INTO static.t_ref_config_emissions_factor
(config_etype_id,emission_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='R-420A'),1144,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='R-420A')
);
INSERT INTO static.t_ref_config_emissions_factor
(config_etype_id,emission_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='R-421A'),2385,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='R-421A')
);
INSERT INTO static.t_ref_config_emissions_factor
(config_etype_id,emission_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='R-421B'),2890,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='R-421B')
);
INSERT INTO static.t_ref_config_emissions_factor
(config_etype_id,emission_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='R-422A'),2847,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='R-422A')
);
INSERT INTO static.t_ref_config_emissions_factor
(config_etype_id,emission_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='R-422B'),2290,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='R-422B')
);
INSERT INTO static.t_ref_config_emissions_factor
(config_etype_id,emission_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='R-422C'),2794,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='R-422C')
);
INSERT INTO static.t_ref_config_emissions_factor
(config_etype_id,emission_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='R-422D'),2473,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='R-422D')
);
INSERT INTO static.t_ref_config_emissions_factor
(config_etype_id,emission_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='R-422E'),2350,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='R-422E')
);
INSERT INTO static.t_ref_config_emissions_factor
(config_etype_id,emission_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='R-423A'),2274,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='R-423A')
);
INSERT INTO static.t_ref_config_emissions_factor
(config_etype_id,emission_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='R-424A'),2212,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='R-424A')
);
INSERT INTO static.t_ref_config_emissions_factor
(config_etype_id,emission_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='R-425A'),1431,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='R-425A')
);
INSERT INTO static.t_ref_config_emissions_factor
(config_etype_id,emission_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='R-426A'),1371,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='R-426A')
);
INSERT INTO static.t_ref_config_emissions_factor
(config_etype_id,emission_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='R-427A'),2024,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='R-427A')
);
INSERT INTO static.t_ref_config_emissions_factor
(config_etype_id,emission_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='R-428A'),3417,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='R-428A')
);
INSERT INTO static.t_ref_config_emissions_factor
(config_etype_id,emission_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='R-429A'),14,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='R-429A')
);
INSERT INTO static.t_ref_config_emissions_factor
(config_etype_id,emission_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='R-430A'),104.88,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='R-430A')
);
INSERT INTO static.t_ref_config_emissions_factor
(config_etype_id,emission_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='R-431A'),40,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='R-431A')
);
INSERT INTO static.t_ref_config_emissions_factor
(config_etype_id,emission_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='R-434A'),3075,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='R-434A')
);
INSERT INTO static.t_ref_config_emissions_factor
(config_etype_id,emission_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='R-435A'),28,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='R-435A')
);
INSERT INTO static.t_ref_config_emissions_factor
(config_etype_id,emission_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='R-437A'),1639,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='R-437A')
);
INSERT INTO static.t_ref_config_emissions_factor
(config_etype_id,emission_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='R-438A'),2059,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='R-438A')
);
INSERT INTO static.t_ref_config_emissions_factor
(config_etype_id,emission_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='R-439A'),1828,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='R-439A')
);
INSERT INTO static.t_ref_config_emissions_factor
(config_etype_id,emission_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='R-439A'),1828,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='R-439A')
);
INSERT INTO static.t_ref_config_emissions_factor
(config_etype_id,emission_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='R-439A'),1828,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='R-439A')
);
INSERT INTO static.t_ref_config_emissions_factor
(config_etype_id,emission_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='R-444A'),88,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='R-444A')
);
INSERT INTO static.t_ref_config_emissions_factor
(config_etype_id,emission_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='R-445A'),117,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='R-445A')
);
INSERT INTO static.t_ref_config_emissions_factor
(config_etype_id,emission_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='R-500'),36,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='R-500')
);
INSERT INTO static.t_ref_config_emissions_factor
(config_etype_id,emission_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='R-503'),4972,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='R-503')
);
INSERT INTO static.t_ref_config_emissions_factor
(config_etype_id,emission_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='R-504'),326,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='R-504')
);
INSERT INTO static.t_ref_config_emissions_factor
(config_etype_id,emission_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='R-507'),3985,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='R-507')
);
INSERT INTO static.t_ref_config_emissions_factor
(config_etype_id,emission_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='R-507A'),3985,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='R-507A')
);
INSERT INTO static.t_ref_config_emissions_factor
(config_etype_id,emission_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='R-509'),4984,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='R-509')
);
INSERT INTO static.t_ref_config_emissions_factor
(config_etype_id,emission_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='R-509A'),4984,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='R-509A')
);
INSERT INTO static.t_ref_config_emissions_factor
(config_etype_id,emission_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='R-512A'),196.1,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_refrigerators_chillers' and etypeattr1='R-512A')
);



