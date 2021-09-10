
INSERT INTO static.t_ref_config_emissions_factor (config_etype_id,continent_id,emission_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (select id from static.v_ref_config_emissions_type where etype='Scope1_distance_travelled' and etypeattr1='Passenger' and etypeattr2='Car - petrol')
     ,(select id from static.t_ref_continent where continent='Europe')
     ,0.1179
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(select id from static.v_ref_config_emissions_type where etype='Scope1_distance_travelled' and etypeattr1='Passenger' and etypeattr2='Car - petrol')
and continent_id = (select id from static.t_ref_continent where continent='Europe')
);

INSERT INTO static.t_ref_config_emissions_factor (config_etype_id,continent_id,emission_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (select id from static.v_ref_config_emissions_type where etype='Scope1_distance_travelled' and etypeattr1='Passenger' and etypeattr2='Car - diesel')
     ,(select id from static.t_ref_continent where continent='Europe')
     ,0.1223
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(select id from static.v_ref_config_emissions_type where etype='Scope1_distance_travelled' and etypeattr1='Passenger' and etypeattr2='Car - diesel')
and continent_id = (select id from static.t_ref_continent where continent='Europe')
);

INSERT INTO static.t_ref_config_emissions_factor (config_etype_id,continent_id,emission_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (select id from static.v_ref_config_emissions_type where etype='Scope1_distance_travelled' and etypeattr1='Passenger' and etypeattr2='Car - CNG')
     ,(select id from static.t_ref_continent where continent='Europe')
     ,0.0960
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(select id from static.v_ref_config_emissions_type where etype='Scope1_distance_travelled' and etypeattr1='Passenger' and etypeattr2='Car - CNG')
and continent_id = (select id from static.t_ref_continent where continent='Europe')
);

INSERT INTO static.t_ref_config_emissions_factor (config_etype_id,continent_id,emission_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (select id from static.v_ref_config_emissions_type where etype='Scope1_distance_travelled' and etypeattr1='Passenger' and etypeattr2='Car - LPG')
     ,(select id from static.t_ref_continent where continent='Europe')
     ,0.1109
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(select id from static.v_ref_config_emissions_type where etype='Scope1_distance_travelled' and etypeattr1='Passenger' and etypeattr2='Car - LPG')
and continent_id = (select id from static.t_ref_continent where continent='Europe')
);

INSERT INTO static.t_ref_config_emissions_factor (config_etype_id,continent_id,emission_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (select id from static.v_ref_config_emissions_type where etype='Scope1_distance_travelled'
                                                         and etypeattr1='Commercial' and etypeattr2='Light Duty Vehicle (<3.5T)')
     ,(select id from static.t_ref_continent where continent='Europe')
     ,0.16
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(select id from static.v_ref_config_emissions_type where etype='Scope1_distance_travelled'
				 and etypeattr1='Commercial' and etypeattr2='Light Duty Vehicle (<3.5T)')
and continent_id = (select id from static.t_ref_continent where continent='Europe')
);
INSERT INTO static.t_ref_config_emissions_factor (config_etype_id,continent_id,emission_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (select id from static.v_ref_config_emissions_type where etype='Scope1_distance_travelled'
                                                         and etypeattr1='Commercial' and etypeattr2='Truck >16T')
     ,(select id from static.t_ref_continent where continent='Europe')
     ,0.8141
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(select id from static.v_ref_config_emissions_type where etype='Scope1_distance_travelled'
				 and etypeattr1='Commercial' and etypeattr2='Truck >16T')
and continent_id = (select id from static.t_ref_continent where continent='Europe')
);

update
    static.t_ref_config_emissions_factor a
set
    end_date = '2020-06-30'
    from
	static.v_ref_config_emissions_factor b
WHERe
    b.id = a.id
  and b.end_date='2022-06-30';
