INSERT INTO static.t_ref_config_emissions_factor (config_etype_id,emission_factor,continent_id,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope3_business_travel' and etypeattr1='Car - petrol')
     ,0.1179
     ,(select id from static.t_ref_continent where continent='Europe')
     ,now()
     ,'songjuan'
     ,now()
     ,'songjuan'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope3_business_travel' and etypeattr1='Car - petrol')
and continent_id = (select id from static.t_ref_continent where continent='Europe')
);

INSERT INTO static.t_ref_config_emissions_factor (config_etype_id,emission_factor,continent_id,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope3_business_travel' and etypeattr1='Car - diesel')
     ,0.1223
     ,(select id from static.t_ref_continent where continent='Europe')
     ,now()
     ,'songjuan'
     ,now()
     ,'songjuan'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope3_business_travel' and etypeattr1='Car - diesel')
and continent_id = (select id from static.t_ref_continent where continent='Europe')
);

INSERT INTO static.t_ref_config_emissions_factor (config_etype_id,emission_factor,continent_id,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope3_business_travel' and etypeattr1='Bus')
     ,0.1023
     ,(select id from static.t_ref_continent where continent='Europe')
     ,now()
     ,'songjuan'
     ,now()
     ,'songjuan'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope3_business_travel' and etypeattr1='Bus')
and continent_id = (select id from static.t_ref_continent where continent='Europe')
);

INSERT INTO static.t_ref_config_emissions_factor (config_etype_id,emission_factor,continent_id,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope3_business_travel' and etypeattr1='Subway/Metro/Train')
     ,0.0278
     ,(select id from static.t_ref_continent where continent='Europe')
     ,now()
     ,'songjuan'
     ,now()
     ,'songjuan'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope3_business_travel' and etypeattr1='Subway/Metro/Train')
and continent_id = (select id from static.t_ref_continent where continent='Europe')
);

