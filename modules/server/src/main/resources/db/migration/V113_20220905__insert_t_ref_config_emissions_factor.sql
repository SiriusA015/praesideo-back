INSERT INTO static.t_ref_config_emissions_factor (config_etype_id,emission_factor,continent_id,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope3_employee_commute' and etypeattr1='Bus')
     ,0.1023
     ,(select id from static.t_ref_continent where continent='Europe')
     ,now()
     ,'song'
     ,now()
     ,'song'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope3_employee_commute' and etypeattr1='Bus')
and continent_id = (select id from static.t_ref_continent where continent='Europe')
);

INSERT INTO static.t_ref_config_emissions_factor (config_etype_id,emission_factor,continent_id,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope3_employee_commute' and etypeattr1='Subway/Metro/Train')
     ,0.0278
     ,(select id from static.t_ref_continent where continent='Europe')
     ,now()
     ,'song'
     ,now()
     ,'song'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope3_employee_commute' and etypeattr1='Subway/Metro/Train')
and continent_id = (select id from static.t_ref_continent where continent='Europe')
);

--INSERT INTO static.t_ref_config_emissions_factor (config_etype_id,emission_factor,continent_id,date_added,added_by,date_modified,modified_by)
--SELECT
--    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope3_business_travel' and etypeattr1='Car - petrol')
--     ,0.1179
--     ,(select id from static.t_ref_continent where continent='Europe')
--     ,now()
--     ,'song'
--     ,now()
--     ,'song'
--    WHERE NOT EXISTS
--(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
--config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope3_business_travel' and etypeattr1='Car - petrol')
--and continent_id = (select id from static.t_ref_continent where continent='Europe')
--);
--
--INSERT INTO static.t_ref_config_emissions_factor (config_etype_id,emission_factor,continent_id,date_added,added_by,date_modified,modified_by)
--SELECT
--    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope3_business_travel' and etypeattr1='Car - diesel')
--     ,0.1223
--     ,(select id from static.t_ref_continent where continent='Europe')
--     ,now()
--     ,'song'
--     ,now()
--     ,'song'
--    WHERE NOT EXISTS
--(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
--config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope3_business_travel' and etypeattr1='Car - diesel')
--and continent_id = (select id from static.t_ref_continent where continent='Europe')
--);
--
--INSERT INTO static.t_ref_config_emissions_factor (config_etype_id,emission_factor,continent_id,date_added,added_by,date_modified,modified_by)
--SELECT
--    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope3_business_travel' and etypeattr1='Bus')
--     ,0.1023
--     ,(select id from static.t_ref_continent where continent='Europe')
--     ,now()
--     ,'song'
--     ,now()
--     ,'song'
--    WHERE NOT EXISTS
--(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
--config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope3_business_travel' and etypeattr1='Bus')
--and continent_id = (select id from static.t_ref_continent where continent='Europe')
--);

--INSERT INTO static.t_ref_config_emissions_factor (config_etype_id,emission_factor,continent_id,date_added,added_by,date_modified,modified_by)
--SELECT
--    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope3_business_travel' and etypeattr1='Subway /Metro/Train')
--     ,0.0278
--     ,(select id from static.t_ref_continent where continent='Europe')
--     ,now()
--     ,'song'
--     ,now()
--     ,'song'
--    WHERE NOT EXISTS
--(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
--config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope3_business_travel' and etypeattr1='Subway /Metro/Train')
--and continent_id = (select id from static.t_ref_continent where continent='Europe')
--);

INSERT INTO static.t_ref_config_emissions_factor (config_etype_id,emission_factor,continent_id,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope3_business_travel' and etypeattr1='Intercity Rail (i.e. Amtrak)')
     ,0.0355
     ,(select id from static.t_ref_continent where continent='Europe')
     ,now()
     ,'song'
     ,now()
     ,'song'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope3_business_travel' and etypeattr1='Intercity Rail (i.e. Amtrak)')
and continent_id = (select id from static.t_ref_continent where continent='Europe')
);

INSERT INTO static.t_ref_config_emissions_factor (config_etype_id,emission_factor,continent_id,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope3_business_travel' and etypeattr1='Transit Rail (i.e. Subway, Tram)')
     ,0.0286
     ,(select id from static.t_ref_continent where continent='Europe')
     ,now()
     ,'song'
     ,now()
     ,'song'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope3_business_travel' and etypeattr1='Transit Rail (i.e. Subway, Tram)')
and continent_id = (select id from static.t_ref_continent where continent='Europe')
);

INSERT INTO static.t_ref_config_emissions_factor (config_etype_id,emission_factor,continent_id,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope3_business_travel' and etypeattr1='Intercity Rail (i.e. Amtrak)')
     ,0.0355
     ,(select id from static.t_ref_continent where continent='Europe')
     ,now()
     ,'song'
     ,now()
     ,'song'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope3_business_travel' and etypeattr1='Intercity Rail (i.e. Amtrak)')
and continent_id = (select id from static.t_ref_continent where continent='Europe')
);

INSERT INTO static.t_ref_config_emissions_factor (config_etype_id,emission_factor,continent_id,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope3_business_travel' and etypeattr1='Air Travel - Short Haul')
     ,0.1192
     ,(select id from static.t_ref_continent where continent='Europe')
     ,now()
     ,'song'
     ,now()
     ,'song'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope3_business_travel' and etypeattr1='Air Travel - Short Haul')
and continent_id = (select id from static.t_ref_continent where continent='Europe')
);

INSERT INTO static.t_ref_config_emissions_factor (config_etype_id,emission_factor,continent_id,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope3_business_travel' and etypeattr1='Air Travel - Medium Haul')
     ,0.0744
     ,(select id from static.t_ref_continent where continent='Europe')
     ,now()
     ,'song'
     ,now()
     ,'song'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope3_business_travel' and etypeattr1='Air Travel - Medium Haul')
and continent_id = (select id from static.t_ref_continent where continent='Europe')
);

INSERT INTO static.t_ref_config_emissions_factor (config_etype_id,emission_factor,continent_id,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope3_business_travel' and etypeattr1='Air Travel - Long Haul')
     ,0.1836
     ,(select id from static.t_ref_continent where continent='Europe')
     ,now()
     ,'song'
     ,now()
     ,'song'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope3_business_travel' and etypeattr1='Air Travel - Long Haul')
and continent_id = (select id from static.t_ref_continent where continent='Europe')
);