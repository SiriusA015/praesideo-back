INSERT INTO static.t_ref_config_emissions_factor (config_etype_id,emission_factor,country_id,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope3_employee_commute' and etypeattr1='Motorcycle/Scooter')
     ,0.0325
     ,(select id from static.t_ref_countries where country='India')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope3_employee_commute' and etypeattr1='Motorcycle/Scooter')
and country_id = (select id from static.t_ref_countries where country='India')
);

INSERT INTO static.t_ref_config_emissions_factor (config_etype_id,emission_factor,country_id,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope3_employee_commute' and etypeattr1='Three wheeler')
     ,0.1178
     ,(select id from static.t_ref_countries where country='India')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope3_employee_commute' and etypeattr1='Three wheeler')
and country_id = (select id from static.t_ref_countries where country='India')
);

INSERT INTO static.t_ref_config_emissions_factor (config_etype_id,emission_factor,country_id,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope3_employee_commute' and etypeattr1='Car - petrol')
     ,0.1893
     ,(select id from static.t_ref_countries where country='India')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope3_employee_commute' and etypeattr1='Car - petrol')
and country_id = (select id from static.t_ref_countries where country='India')
);

INSERT INTO static.t_ref_config_emissions_factor (config_etype_id,emission_factor,country_id,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope3_employee_commute' and etypeattr1='Car - diesel')
     ,0.1763
     ,(select id from static.t_ref_countries where country='India')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope3_employee_commute' and etypeattr1='Car - diesel')
and country_id = (select id from static.t_ref_countries where country='India')
);

INSERT INTO static.t_ref_config_emissions_factor (config_etype_id,emission_factor,country_id,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope3_employee_commute' and etypeattr1='Bus')
     ,0.0152
     ,(select id from static.t_ref_countries where country='India')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope3_employee_commute' and etypeattr1='Bus')
and country_id = (select id from static.t_ref_countries where country='India')
);

INSERT INTO static.t_ref_config_emissions_factor (config_etype_id,emission_factor,country_id,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope3_business_travel' and etypeattr1='Air Travel - Short Haul')
     ,0.1210
     ,(select id from static.t_ref_countries where country='India')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope3_business_travel' and etypeattr1='Air Travel - Short Haul')
and country_id = (select id from static.t_ref_countries where country='India')
);

INSERT INTO static.t_ref_config_emissions_factor (config_etype_id,emission_factor,country_id,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope3_business_travel' and etypeattr1='Air Travel - Medium Haul')
     ,0.1210
     ,(select id from static.t_ref_countries where country='India')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope3_business_travel' and etypeattr1='Air Travel - Medium Haul')
and country_id = (select id from static.t_ref_countries where country='India')
);

INSERT INTO static.t_ref_config_emissions_factor (config_etype_id,emission_factor,country_id,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope3_business_travel' and etypeattr1='Air Travel - Long Haul')
     ,0.1210
     ,(select id from static.t_ref_countries where country='India')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope3_business_travel' and etypeattr1='Air Travel - Long Haul')
and country_id = (select id from static.t_ref_countries where country='India')
);


INSERT INTO static.t_ref_config_emissions_factor (config_etype_id,emission_factor,country_id,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope3_employee_commute' and etypeattr1='Motorcycle/Scooter')
     ,0.1169
     ,(select id from static.t_ref_countries where country='United Kingdom')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope3_employee_commute' and etypeattr1='Motorcycle/Scooter')
and country_id = (select id from static.t_ref_countries where country='United Kingdom')
);


INSERT INTO static.t_ref_config_emissions_factor (config_etype_id,emission_factor,country_id,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope3_employee_commute' and etypeattr1='Car - petrol')
     ,0.1421
     ,(select id from static.t_ref_countries where country='United Kingdom')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope3_employee_commute' and etypeattr1='Car - petrol')
and country_id = (select id from static.t_ref_countries where country='United Kingdom')
);

INSERT INTO static.t_ref_config_emissions_factor (config_etype_id,emission_factor,country_id,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope3_employee_commute' and etypeattr1='Car - diesel')
     ,0.1365
     ,(select id from static.t_ref_countries where country='United Kingdom')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope3_employee_commute' and etypeattr1='Car - diesel')
and country_id = (select id from static.t_ref_countries where country='United Kingdom')
);

INSERT INTO static.t_ref_config_emissions_factor (config_etype_id,emission_factor,country_id,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope3_employee_commute' and etypeattr1='Bus')
     ,0.1023
     ,(select id from static.t_ref_countries where country='United Kingdom')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope3_employee_commute' and etypeattr1='Bus')
and country_id = (select id from static.t_ref_countries where country='United Kingdom')
);

INSERT INTO static.t_ref_config_emissions_factor (config_etype_id,emission_factor,country_id,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope3_employee_commute' and etypeattr1='Subway/Metro/Train')
     ,0.2861
     ,(select id from static.t_ref_countries where country='United Kingdom')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope3_employee_commute' and etypeattr1='Subway/Metro/Train')
and country_id = (select id from static.t_ref_countries where country='United Kingdom')
);

INSERT INTO static.t_ref_config_emissions_factor (config_etype_id,emission_factor,country_id,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope3_business_travel' and etypeattr1='Air Travel - Short Haul')
     ,0.1192
     ,(select id from static.t_ref_countries where country='United Kingdom')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope3_business_travel' and etypeattr1='Air Travel - Short Haul')
and country_id = (select id from static.t_ref_countries where country='United Kingdom')
);

INSERT INTO static.t_ref_config_emissions_factor (config_etype_id,emission_factor,country_id,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope3_business_travel' and etypeattr1='Air Travel - Medium Haul')
     ,0.0744
     ,(select id from static.t_ref_countries where country='United Kingdom')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope3_business_travel' and etypeattr1='Air Travel - Medium Haul')
and country_id = (select id from static.t_ref_countries where country='United Kingdom')
);

INSERT INTO static.t_ref_config_emissions_factor (config_etype_id,emission_factor,country_id,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope3_business_travel' and etypeattr1='Air Travel - Long Haul')
     ,0.0936
     ,(select id from static.t_ref_countries where country='United Kingdom')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope3_business_travel' and etypeattr1='Air Travel - Long Haul')
and country_id = (select id from static.t_ref_countries where country='United Kingdom')
);

INSERT INTO static.t_ref_config_emissions_factor (config_etype_id,emission_factor,country_id,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope3_employee_commute' and etypeattr1='Motorcycle/Scooter')
     ,0.1928
     ,(select id from static.t_ref_countries where country='United States of America')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope3_employee_commute' and etypeattr1='Motorcycle/Scooter')
and country_id = (select id from static.t_ref_countries where country='United States of America')
);

INSERT INTO static.t_ref_config_emissions_factor (config_etype_id,emission_factor,country_id,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope3_employee_commute' and etypeattr1='Car - petrol')
     ,0.3468
     ,(select id from static.t_ref_countries where country='United States of America')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope3_employee_commute' and etypeattr1='Car - petrol')
and country_id = (select id from static.t_ref_countries where country='United States of America')
);

INSERT INTO static.t_ref_config_emissions_factor (config_etype_id,emission_factor,country_id,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope3_employee_commute' and etypeattr1='Bus')
     ,0.0563
     ,(select id from static.t_ref_countries where country='United States of America')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope3_employee_commute' and etypeattr1='Bus')
and country_id = (select id from static.t_ref_countries where country='United States of America')
);

INSERT INTO static.t_ref_config_emissions_factor (config_etype_id,emission_factor,country_id,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope3_employee_commute' and etypeattr1='Subway/Metro/Train')
     ,0.1622
     ,(select id from static.t_ref_countries where country='United States of America')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope3_employee_commute' and etypeattr1='Subway/Metro/Train')
and country_id = (select id from static.t_ref_countries where country='United States of America')
);

INSERT INTO static.t_ref_config_emissions_factor (config_etype_id,emission_factor,country_id,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope3_business_travel' and etypeattr1='Transit Rail (i.e. Subway, Tram)')
     ,0.1196
     ,(select id from static.t_ref_countries where country='United States of America')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope3_business_travel' and etypeattr1='Transit Rail (i.e. Subway, Tram)')
and country_id = (select id from static.t_ref_countries where country='United States of America')
);

INSERT INTO static.t_ref_config_emissions_factor (config_etype_id,emission_factor,country_id,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope3_business_travel' and etypeattr1='Intercity Rail (i.e. Amtrak)')
     ,0.1411
     ,(select id from static.t_ref_countries where country='United States of America')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope3_business_travel' and etypeattr1='Intercity Rail (i.e. Amtrak)')
and country_id = (select id from static.t_ref_countries where country='United States of America')
);

INSERT INTO static.t_ref_config_emissions_factor (config_etype_id,emission_factor,country_id,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope3_business_travel' and etypeattr1='Air Travel - Short Haul')
     ,0.2272
     ,(select id from static.t_ref_countries where country='United States of America')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope3_business_travel' and etypeattr1='Air Travel - Short Haul')
and country_id = (select id from static.t_ref_countries where country='United States of America')
);

INSERT INTO static.t_ref_config_emissions_factor (config_etype_id,emission_factor,country_id,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope3_business_travel' and etypeattr1='Air Travel - Medium Haul')
     ,0.1373
     ,(select id from static.t_ref_countries where country='United States of America')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope3_business_travel' and etypeattr1='Air Travel - Medium Haul')
and country_id = (select id from static.t_ref_countries where country='United States of America')
);

INSERT INTO static.t_ref_config_emissions_factor (config_etype_id,emission_factor,country_id,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope3_business_travel' and etypeattr1='Air Travel - Long Haul')
     ,0.1676
     ,(select id from static.t_ref_countries where country='United States of America')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope3_business_travel' and etypeattr1='Air Travel - Long Haul')
and country_id = (select id from static.t_ref_countries where country='United States of America')
);

INSERT INTO static.t_ref_config_emissions_factor (config_etype_id,emission_factor,continent_id,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope3_employee_commute' and etypeattr1='Car - petrol')
     ,0.1179
     ,(select id from static.t_ref_continent where continent='Europe')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope3_employee_commute' and etypeattr1='Car - petrol')
and continent_id = (select id from static.t_ref_continent where continent='Europe')
);

INSERT INTO static.t_ref_config_emissions_factor (config_etype_id,emission_factor,continent_id,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope3_employee_commute' and etypeattr1='Car - diesel')
     ,0.1223
     ,(select id from static.t_ref_continent where continent='Europe')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope3_employee_commute' and etypeattr1='Car - diesel')
and continent_id = (select id from static.t_ref_continent where continent='Europe')
);