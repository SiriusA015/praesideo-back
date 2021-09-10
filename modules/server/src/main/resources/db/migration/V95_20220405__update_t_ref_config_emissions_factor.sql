
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
    (select id from static.v_ref_config_emissions_type where etype like '%Scope1_distance_travelled%' and etypeattr2='Light Duty Vehicle (<3.5T)')
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
	 config_emission_type_id=(select id from static.v_ref_config_emissions_type where etype like '%Scope1_distance_travelled%' and etypeattr2='Light Duty Vehicle (<3.5T)')
		AND etype_unit_id1 = (select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='miles')
	 	AND etype_unit_id2 = (select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
	);


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
    (select id from static.v_ref_config_emissions_type where etype like '%Scope1_distance_travelled%' and etypeattr2='Medium Duty Vehicle (<12T)')
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
	 config_emission_type_id=(select id from static.v_ref_config_emissions_type where etype like '%Scope1_distance_travelled%' and etypeattr2='Medium Duty Vehicle (<12T)')
		AND etype_unit_id1 = (select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='miles')
	 	AND etype_unit_id2 = (select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
	);

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
    (select id from static.v_ref_config_emissions_type where etype like '%Scope1_distance_travelled%' and etypeattr2='Heavy Duty Vehicle (>12 T)')
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
	 config_emission_type_id=(select id from static.v_ref_config_emissions_type where etype like '%Scope1_distance_travelled%' and etypeattr2='Heavy Duty Vehicle (>12 T)')
		AND etype_unit_id1 = (select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='miles')
	 	AND etype_unit_id2 = (select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
	);

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
    (select id from static.v_ref_config_emissions_type where etype like '%Scope1_distance_travelled%' and etypeattr2='Bus')
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
	 config_emission_type_id=(select id from static.v_ref_config_emissions_type where etype like '%Scope1_distance_travelled%' and etypeattr2='Bus')
		AND etype_unit_id1 = (select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='miles')
	 	AND etype_unit_id2 = (select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
	);
