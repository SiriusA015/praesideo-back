INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'impactm_emission_type','Scope1_extinguisher',now(),'nidhish'
    WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_emission_type' and list_value='Scope1_extinguisher');

INSERT INTO static.t_ref_config_emissions_type
(scope,etype_id,etypeattr_id1,etype_unit_id1,etype_unit_id2,date_added,added_by,date_modified,modified_by)
SELECT
    '1'
     ,(select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_extinguisher')
     ,(select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_extinguisher')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='tCO2')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
	(SELECT 1 FROM static.t_ref_config_emissions_type WHERE
	 scope='1'
	 and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_extinguisher')
	 and etypeattr_id1 =(select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_extinguisher')
);


insert into static.t_ref_config_emissions_unit_factor
(config_emission_type_id,etype_unit_id1,etype_unit_id2,etype_unit_factor1,etype_unit_factor2,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.t_ref_config_emissions_type WHERE
            scope='1'
                                                         and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_extinguisher')
                                                         and etypeattr_id1 =(select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_extinguisher')
    )
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='tCO2')
     ,0.001
     ,1.00
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
	(SELECT 1 FROM static.t_ref_config_emissions_unit_factor WHERE
	 config_emission_type_id=(SELECT id FROM static.t_ref_config_emissions_type WHERE
							 scope='1'
							 and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_extinguisher')
							 and etypeattr_id1 =(select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_extinguisher')
						 )
	and etype_unit_id1=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
	 and etype_unit_id2=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='tCO2')
);

INSERT INTO static.t_ref_config_emissions_factor (config_etype_id,emission_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_extinguisher' and etypeattr1='Scope1_extinguisher')
     ,1.00
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_factor WHERE
config_etype_id=(SELECT id FROM static.v_ref_config_emissions_type Where etype='Scope1_extinguisher' and etypeattr1='Scope1_extinguisher'));


alter table impact.t_data_impactm_scope2_electricity
    ADD COLUMN IF NOT EXISTS emission_factor_id integer,
    ADD COLUMN IF NOT EXISTS emission_factor_by_user numeric(24,2);
alter table impact.t_data_impactm_scope2_electricity DROP CONSTRAINT IF EXISTS t_data_impactm_scope2_electricity_emission_fid;
alter table impact.t_data_impactm_scope2_electricity
    add CONSTRAINT t_data_impactm_scope2_electricity_emission_fid FOREIGN KEY (emission_factor_id) REFERENCES static.t_ref_config_emissions_factor (id);

