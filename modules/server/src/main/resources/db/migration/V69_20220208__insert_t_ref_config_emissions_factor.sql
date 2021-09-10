
INSERT INTO static.t_ref_config_emissions_factor (config_etype_id,emission_factor,emission_source_id,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_mobile_fuel_combustion' and etypeattr1='LNG')
     ,1.30
     ,(SELECT list_id FROM static.t_ref_list Where list_value='EPA & climate registry')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_mobile_fuel_combustion' and etypeattr1='LNG'));

INSERT INTO static.t_ref_config_emissions_factor (config_etype_id,emission_factor,emission_source_id,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_mobile_fuel_combustion' and etypeattr1='Petrol')
     ,2.3
     ,(SELECT list_id FROM static.t_ref_list Where list_value='IPCC')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_mobile_fuel_combustion' and etypeattr1='Petrol'));

INSERT INTO static.t_ref_config_emissions_factor (config_etype_id,emission_factor,emission_source_id,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_mobile_fuel_combustion' and etypeattr1='Diesel')
     ,2.6
     ,(SELECT list_id FROM static.t_ref_list Where list_value='IPCC')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_mobile_fuel_combustion' and etypeattr1='Diesel'));

INSERT INTO static.t_ref_config_emissions_factor (config_etype_id,emission_factor,emission_source_id,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_mobile_fuel_combustion'
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
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_mobile_fuel_combustion'
             and etypeattr1='Liquefied petroleum gas (LPG)'
            and etype_unit1='tons'
             and etype_unit2='tCO2'));

