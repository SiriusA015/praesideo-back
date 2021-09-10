truncate table static.t_ref_config_emissions_factor;
truncate table static.t_ref_config_emissions_type CASCADE;
truncate table static.t_ref_config_emissions_unit_factor CASCADE;

alter table static.t_ref_config_emissions_unit_factor ADD COLUMN IF NOT EXISTS config_emission_type_id Integer;
alter table static.t_ref_config_emissions_unit_factor DROP CONSTRAINT IF EXISTS fk_t_ref_config_emissions_unit_factor_config_emission_type_id;
alter table static.t_ref_config_emissions_unit_factor
    add CONSTRAINT fk_t_ref_config_emissions_unit_factor_config_emission_type_id
        FOREIGN KEY (config_emission_type_id) REFERENCES static.t_ref_config_emissions_type (id);


INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'impactm_stationary_fueltype','LNG',now(),'nidhish'
    WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_stationary_fueltype' and list_value='LNG');

INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'impactm_stationary_fueltype','Petrol',now(),'nidhish'
    WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_stationary_fueltype' and list_value='Petrol');

INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'impactm_stationary_fueltype','Diesel',now(),'nidhish'
    WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_stationary_fueltype' and list_value='Diesel');

INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'impactm_stationary_fueltype','Liquefied petroleum gas (LPG)',now(),'nidhish'
    WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_stationary_fueltype' and list_value='Liquefied petroleum gas (LPG)');

INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'impactm_stationary_fueltype','Gasoline',now(),'nidhish'
    WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_stationary_fueltype' and list_value='Gasoline');

INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'impactm_stationary_fueltype','Kerosene',now(),'nidhish'
    WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_stationary_fueltype' and list_value='Kerosene');

INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'impactm_stationary_fueltype','Heating oil',now(),'nidhish'
    WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_stationary_fueltype' and list_value='Heating oil');

INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'impactm_stationary_fueltype','Diesel oil',now(),'nidhish'
    WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_stationary_fueltype' and list_value='Diesel oil');

INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'impactm_stationary_fueltype','Fuel oil',now(),'nidhish'
    WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_stationary_fueltype' and list_value='Fuel oil');

INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'impactm_measurement_unit','GJ',now(),'nidhish'
    WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_measurement_unit' and list_value='GJ');

INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'impactm_measurement_unit','MWh',now(),'nidhish'
    WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_measurement_unit' and list_value='MWh');

INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'impactm_mobile_fueltype','LNG',now(),'nidhish'
    WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_mobile_fueltype' and list_value='LNG');

INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'impactm_mobile_fueltype','Petrol',now(),'nidhish'
    WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_mobile_fueltype' and list_value='Petrol');

INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'impactm_mobile_fueltype','Diesel',now(),'nidhish'
    WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_mobile_fueltype' and list_value='Diesel');

INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'impactm_mobile_fueltype','Liquefied petroleum gas (LPG)',now(),'nidhish'
    WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_mobile_fueltype' and list_value='Liquefied petroleum gas (LPG)');

INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'impactm_mobile_fueltype','Gasoline',now(),'nidhish'
    WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_mobile_fueltype' and list_value='Gasoline');

INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'impactm_mobile_fueltype','Diesel oil',now(),'nidhish'
    WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_mobile_fueltype' and list_value='Diesel oil');

INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'impactm_mobile_fueltype','Ethanol',now(),'nidhish'
    WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_mobile_fueltype' and list_value='Ethanol');



INSERT INTO static.t_ref_config_emissions_type
(scope,etype_id,etypeattr1_id,etypeattr2_id,etypeattr3_id,etypeattr4_id,etype_unit1_id,etype_unit2_id,date_added,added_by,date_modified,modified_by)
SELECT
    '1'
     ,(select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_stationary_fuel_combustion')
     ,(select list_id from static.t_ref_list where list_key='impactm_stationary_fueltype' and list_value='LNG')
     ,null
     ,null
     ,null
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='KL')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='tCO2')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
	(SELECT 1 FROM static.t_ref_config_emissions_type WHERE
	 scope='1'
	 and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_stationary_fuel_combustion')
	 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_stationary_fueltype' and list_value='LNG')
	 and etype_unit1_id = (select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='KL')
	 and etype_unit2_id =(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='tCO2')
);

insert into static.t_ref_config_emissions_unit_factor
(config_emission_type_id,etype_unit1_id,etype_unit2_id,etype_unit1_factor,etype_unit2_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.t_ref_config_emissions_type WHERE
            scope='1'
                                                         and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_stationary_fuel_combustion')
                                                         and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_stationary_fueltype' and list_value='LNG')
                                                         and etype_unit1_id = (select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='KL')
                                                         and etype_unit2_id =(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='tCO2')
    )
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='KL')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='tCO2')
     ,1.00
     ,1.00
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
	(SELECT 1 FROM static.t_ref_config_emissions_unit_factor WHERE
	 config_emission_type_id=(SELECT id FROM static.t_ref_config_emissions_type WHERE
							 scope='1'
							 and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_stationary_fuel_combustion')
							 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_stationary_fueltype' and list_value='LNG')
							 and etype_unit1_id = (select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='KL')
							 and etype_unit2_id =(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='tCO2')
						 )
	and etype_unit1_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='KL')
	 and etype_unit2_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='tCO2')
);

INSERT INTO static.t_ref_config_emissions_type
(scope,etype_id,etypeattr1_id,etypeattr2_id,etypeattr3_id,etypeattr4_id,etype_unit1_id,etype_unit2_id,date_added,added_by,date_modified,modified_by)
SELECT
    '1'
     ,(select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_stationary_fuel_combustion')
     ,(select list_id from static.t_ref_list where list_key='impactm_stationary_fueltype' and list_value='Sub Bituminous')
     ,null
     ,null
     ,null
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='tons')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='tCO2')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
	(SELECT 1 FROM static.t_ref_config_emissions_type WHERE
	 scope='1'
	 and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_stationary_fuel_combustion')
	 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_stationary_fueltype' and list_value='Sub Bituminous')
	 and etype_unit1_id = (select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='tons')
	 and etype_unit2_id =(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='tCO2')
);

insert into static.t_ref_config_emissions_unit_factor
(config_emission_type_id,etype_unit1_id,etype_unit2_id,etype_unit1_factor,etype_unit2_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.t_ref_config_emissions_type WHERE
            scope='1'
                                                         and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_stationary_fuel_combustion')
                                                         and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_stationary_fueltype' and list_value='Sub Bituminous')
                                                         and etype_unit1_id = (select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='tons')
                                                         and etype_unit2_id =(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='tCO2')
    )
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='tons')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='tCO2')
     ,1.00
     ,1.00
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
	(SELECT 1 FROM static.t_ref_config_emissions_unit_factor WHERE
	 config_emission_type_id=(SELECT id FROM static.t_ref_config_emissions_type WHERE
							 scope='1'
							 and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_stationary_fuel_combustion')
							 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_stationary_fueltype' and list_value='Sub Bituminous')
							 and etype_unit1_id = (select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='tons')
							 and etype_unit2_id =(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='tCO2')
						 )
	and etype_unit1_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='tons')
	 and etype_unit2_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='tCO2')
);



INSERT INTO static.t_ref_config_emissions_type
(scope,etype_id,etypeattr1_id,etypeattr2_id,etypeattr3_id,etypeattr4_id,etype_unit1_id,etype_unit2_id,date_added,added_by,date_modified,modified_by)
SELECT
    '1'
     ,(select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_stationary_fuel_combustion')
     ,(select list_id from static.t_ref_list where list_key='impactm_stationary_fueltype' and list_value='Other Bituminous')
     ,null
     ,null
     ,null
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='tons')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='tCO2')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
	(SELECT 1 FROM static.t_ref_config_emissions_type WHERE
	 scope='1'
	 and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_stationary_fuel_combustion')
	 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_stationary_fueltype' and list_value='Other Bituminous')
	 and etype_unit1_id = (select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='tons')
	 and etype_unit2_id =(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='tCO2')
);

insert into static.t_ref_config_emissions_unit_factor
(config_emission_type_id,etype_unit1_id,etype_unit2_id,etype_unit1_factor,etype_unit2_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.t_ref_config_emissions_type WHERE
            scope='1'
                                                         and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_stationary_fuel_combustion')
                                                         and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_stationary_fueltype' and list_value='Other Bituminous')
                                                         and etype_unit1_id = (select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='tons')
                                                         and etype_unit2_id =(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='tCO2')
    )
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='tons')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='tCO2')
     ,1.00
     ,1.00
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
	(SELECT 1 FROM static.t_ref_config_emissions_unit_factor WHERE
	 config_emission_type_id=(SELECT id FROM static.t_ref_config_emissions_type WHERE
							 scope='1'
							 and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_stationary_fuel_combustion')
							 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_stationary_fueltype' and list_value='Other Bituminous')
							 and etype_unit1_id = (select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='tons')
							 and etype_unit2_id =(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='tCO2')
						 )
	and etype_unit1_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='tons')
	 and etype_unit2_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='tCO2')
);

INSERT INTO static.t_ref_config_emissions_type
(scope,etype_id,etypeattr1_id,etypeattr2_id,etypeattr3_id,etypeattr4_id,etype_unit1_id,etype_unit2_id,date_added,added_by,date_modified,modified_by)
SELECT
    '1'
     ,(select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_stationary_fuel_combustion')
     ,(select list_id from static.t_ref_list where list_key='impactm_stationary_fueltype' and list_value='Coking Coal')
     ,null
     ,null
     ,null
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='tons')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='tCO2')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
	(SELECT 1 FROM static.t_ref_config_emissions_type WHERE
	 scope='1'
	 and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_stationary_fuel_combustion')
	 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_stationary_fueltype' and list_value='Coking Coal')
	 and etype_unit1_id = (select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='tons')
	 and etype_unit2_id =(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='tCO2')
);

insert into static.t_ref_config_emissions_unit_factor
(config_emission_type_id,etype_unit1_id,etype_unit2_id,etype_unit1_factor,etype_unit2_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.t_ref_config_emissions_type WHERE
            scope='1'
                                                         and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_stationary_fuel_combustion')
                                                         and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_stationary_fueltype' and list_value='Coking Coal')
                                                         and etype_unit1_id = (select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='tons')
                                                         and etype_unit2_id =(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='tCO2')
    )
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='tons')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='tCO2')
     ,1.00
     ,1.00
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
	(SELECT 1 FROM static.t_ref_config_emissions_unit_factor WHERE
	 config_emission_type_id=(SELECT id FROM static.t_ref_config_emissions_type WHERE
							 scope='1'
							 and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_stationary_fuel_combustion')
							 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_stationary_fueltype' and list_value='Coking Coal')
							 and etype_unit1_id = (select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='tons')
							 and etype_unit2_id =(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='tCO2')
						 )
	and etype_unit1_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='tons')
	 and etype_unit2_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='tCO2')
);


INSERT INTO static.t_ref_config_emissions_type
(scope,etype_id,etypeattr1_id,etypeattr2_id,etypeattr3_id,etypeattr4_id,etype_unit1_id,etype_unit2_id,date_added,added_by,date_modified,modified_by)
SELECT
    '1'
     ,(select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_stationary_fuel_combustion')
     ,(select list_id from static.t_ref_list where list_key='impactm_stationary_fueltype' and list_value='Anthracite')
     ,null
     ,null
     ,null
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='tons')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='tCO2')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
	(SELECT 1 FROM static.t_ref_config_emissions_type WHERE
	 scope='1'
	 and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_stationary_fuel_combustion')
	 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_stationary_fueltype' and list_value='Anthracite')
	 and etype_unit1_id = (select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='tons')
	 and etype_unit2_id =(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='tCO2')
);

insert into static.t_ref_config_emissions_unit_factor
(config_emission_type_id,etype_unit1_id,etype_unit2_id,etype_unit1_factor,etype_unit2_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.t_ref_config_emissions_type WHERE
            scope='1'
                                                         and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_stationary_fuel_combustion')
                                                         and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_stationary_fueltype' and list_value='Anthracite')
                                                         and etype_unit1_id = (select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='tons')
                                                         and etype_unit2_id =(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='tCO2')
    )
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='tons')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='tCO2')
     ,1.00
     ,1.00
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
	(SELECT 1 FROM static.t_ref_config_emissions_unit_factor WHERE
	 config_emission_type_id=(SELECT id FROM static.t_ref_config_emissions_type WHERE
							 scope='1'
							 and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_stationary_fuel_combustion')
							 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_stationary_fueltype' and list_value='Anthracite')
							 and etype_unit1_id = (select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='tons')
							 and etype_unit2_id =(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='tCO2')
						 )
	and etype_unit1_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='tons')
	 and etype_unit2_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='tCO2')
);


INSERT INTO static.t_ref_config_emissions_type
(scope,etype_id,etypeattr1_id,etypeattr2_id,etypeattr3_id,etypeattr4_id,etype_unit1_id,etype_unit2_id,date_added,added_by,date_modified,modified_by)
SELECT
    '1'
     ,(select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_stationary_fuel_combustion')
     ,(select list_id from static.t_ref_list where list_key='impactm_stationary_fueltype' and list_value='Lignite')
     ,null
     ,null
     ,null
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='tons')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='tCO2')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
	(SELECT 1 FROM static.t_ref_config_emissions_type WHERE
	 scope='1'
	 and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_stationary_fuel_combustion')
	 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_stationary_fueltype' and list_value='Lignite')
	 and etype_unit1_id = (select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='tons')
	 and etype_unit2_id =(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='tCO2')
);

insert into static.t_ref_config_emissions_unit_factor
(config_emission_type_id,etype_unit1_id,etype_unit2_id,etype_unit1_factor,etype_unit2_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.t_ref_config_emissions_type WHERE
            scope='1'
                                                         and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_stationary_fuel_combustion')
                                                         and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_stationary_fueltype' and list_value='Lignite')
                                                         and etype_unit1_id = (select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='tons')
                                                         and etype_unit2_id =(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='tCO2')
    )
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='tons')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='tCO2')
     ,1.00
     ,1.00
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
	(SELECT 1 FROM static.t_ref_config_emissions_unit_factor WHERE
	 config_emission_type_id=(SELECT id FROM static.t_ref_config_emissions_type WHERE
							 scope='1'
							 and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_stationary_fuel_combustion')
							 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_stationary_fueltype' and list_value='Lignite')
							 and etype_unit1_id = (select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='tons')
							 and etype_unit2_id =(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='tCO2')
						 )
	and etype_unit1_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='tons')
	 and etype_unit2_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='tCO2')
);


INSERT INTO static.t_ref_config_emissions_type
(scope,etype_id,etypeattr1_id,etypeattr2_id,etypeattr3_id,etypeattr4_id,etype_unit1_id,etype_unit2_id,date_added,added_by,date_modified,modified_by)
SELECT
    '1'
     ,(select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_stationary_fuel_combustion')
     ,(select list_id from static.t_ref_list where list_key='impactm_stationary_fueltype' and list_value='Naptha')
     ,null
     ,null
     ,null
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='tons')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='tCO2')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
	(SELECT 1 FROM static.t_ref_config_emissions_type WHERE
	 scope='1'
	 and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_stationary_fuel_combustion')
	 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_stationary_fueltype' and list_value='Naptha')
	 and etype_unit1_id = (select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='tons')
	 and etype_unit2_id =(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='tCO2')
);

insert into static.t_ref_config_emissions_unit_factor
(config_emission_type_id,etype_unit1_id,etype_unit2_id,etype_unit1_factor,etype_unit2_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.t_ref_config_emissions_type WHERE
            scope='1'
                                                         and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_stationary_fuel_combustion')
                                                         and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_stationary_fueltype' and list_value='Naptha')
                                                         and etype_unit1_id = (select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='tons')
                                                         and etype_unit2_id =(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='tCO2')
    )
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='tons')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='tCO2')
     ,1.00
     ,1.00
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
	(SELECT 1 FROM static.t_ref_config_emissions_unit_factor WHERE
	 config_emission_type_id=(SELECT id FROM static.t_ref_config_emissions_type WHERE
							 scope='1'
							 and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_stationary_fuel_combustion')
							 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_stationary_fueltype' and list_value='Naptha')
							 and etype_unit1_id = (select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='tons')
							 and etype_unit2_id =(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='tCO2')
						 )
	and etype_unit1_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='tons')
	 and etype_unit2_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='tCO2')
);


INSERT INTO static.t_ref_config_emissions_type
(scope,etype_id,etypeattr1_id,etypeattr2_id,etypeattr3_id,etypeattr4_id,etype_unit1_id,etype_unit2_id,date_added,added_by,date_modified,modified_by)
SELECT
    '1'
     ,(select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_stationary_fuel_combustion')
     ,(select list_id from static.t_ref_list where list_key='impactm_stationary_fueltype' and list_value='Petrol')
     ,null
     ,null
     ,null
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='KL')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='tCO2')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
	(SELECT 1 FROM static.t_ref_config_emissions_type WHERE
	 scope='1'
	 and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_stationary_fuel_combustion')
	 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_stationary_fueltype' and list_value='Petrol')
	 and etype_unit1_id = (select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='KL')
	 and etype_unit2_id =(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='tCO2')
);

insert into static.t_ref_config_emissions_unit_factor
(config_emission_type_id,etype_unit1_id,etype_unit2_id,etype_unit1_factor,etype_unit2_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.t_ref_config_emissions_type WHERE
            scope='1'
                                                         and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_stationary_fuel_combustion')
                                                         and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_stationary_fueltype' and list_value='Petrol')
                                                         and etype_unit1_id = (select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='KL')
                                                         and etype_unit2_id =(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='tCO2')
    )
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='KL')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='tCO2')
     ,1.00
     ,1.00
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
	(SELECT 1 FROM static.t_ref_config_emissions_unit_factor WHERE
	 config_emission_type_id=(SELECT id FROM static.t_ref_config_emissions_type WHERE
							 scope='1'
							 and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_stationary_fuel_combustion')
							 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_stationary_fueltype' and list_value='Petrol')
							 and etype_unit1_id = (select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='KL')
							 and etype_unit2_id =(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='tCO2')
						 )
	and etype_unit1_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='KL')
	 and etype_unit2_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='tCO2')
);

INSERT INTO static.t_ref_config_emissions_type
(scope,etype_id,etypeattr1_id,etypeattr2_id,etypeattr3_id,etypeattr4_id,etype_unit1_id,etype_unit2_id,date_added,added_by,date_modified,modified_by)
SELECT
    '1'
     ,(select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_stationary_fuel_combustion')
     ,(select list_id from static.t_ref_list where list_key='impactm_stationary_fueltype' and list_value='Diesel')
     ,null
     ,null
     ,null
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='KL')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='tCO2')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
	(SELECT 1 FROM static.t_ref_config_emissions_type WHERE
	 scope='1'
	 and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_stationary_fuel_combustion')
	 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_stationary_fueltype' and list_value='Diesel')
	 and etype_unit1_id = (select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='KL')
	 and etype_unit2_id =(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='tCO2')
);

insert into static.t_ref_config_emissions_unit_factor
(config_emission_type_id,etype_unit1_id,etype_unit2_id,etype_unit1_factor,etype_unit2_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.t_ref_config_emissions_type WHERE
            scope='1'
                                                         and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_stationary_fuel_combustion')
                                                         and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_stationary_fueltype' and list_value='Diesel')
                                                         and etype_unit1_id = (select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='KL')
                                                         and etype_unit2_id =(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='tCO2')
    )
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='KL')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='tCO2')
     ,1.00
     ,1.00
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
	(SELECT 1 FROM static.t_ref_config_emissions_unit_factor WHERE
	 config_emission_type_id=(SELECT id FROM static.t_ref_config_emissions_type WHERE
							 scope='1'
							 and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_stationary_fuel_combustion')
							 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_stationary_fueltype' and list_value='Diesel')
							 and etype_unit1_id = (select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='KL')
							 and etype_unit2_id =(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='tCO2')
						 )
	and etype_unit1_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='KL')
	 and etype_unit2_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='tCO2')
);


INSERT INTO static.t_ref_config_emissions_type
(scope,etype_id,etypeattr1_id,etypeattr2_id,etypeattr3_id,etypeattr4_id,etype_unit1_id,etype_unit2_id,date_added,added_by,date_modified,modified_by)
SELECT
    '1'
     ,(select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_stationary_fuel_combustion')
     ,(select list_id from static.t_ref_list where list_key='impactm_stationary_fueltype' and list_value='Liquefied petroleum gas (LPG)')
     ,null
     ,null
     ,null
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='tons')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='tCO2')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
	(SELECT 1 FROM static.t_ref_config_emissions_type WHERE
	 scope='1'
	 and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_stationary_fuel_combustion')
	 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_stationary_fueltype' and list_value='Liquefied petroleum gas (LPG)')
	 and etype_unit1_id = (select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='tons')
	 and etype_unit2_id =(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='tCO2')
);

insert into static.t_ref_config_emissions_unit_factor
(config_emission_type_id,etype_unit1_id,etype_unit2_id,etype_unit1_factor,etype_unit2_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.t_ref_config_emissions_type WHERE
            scope='1'
                                                         and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_stationary_fuel_combustion')
                                                         and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_stationary_fueltype' and list_value='Liquefied petroleum gas (LPG)')
                                                         and etype_unit1_id = (select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='tons')
                                                         and etype_unit2_id =(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='tCO2')
    )
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='tons')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='tCO2')
     ,1.00
     ,1.00
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
	(SELECT 1 FROM static.t_ref_config_emissions_unit_factor WHERE
	 config_emission_type_id=(SELECT id FROM static.t_ref_config_emissions_type WHERE
							 scope='1'
							 and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_stationary_fuel_combustion')
							 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_stationary_fueltype' and list_value='Liquefied petroleum gas (LPG)')
							 and etype_unit1_id = (select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='tons')
							 and etype_unit2_id =(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='tCO2')
						 )
	and etype_unit1_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='tons')
	 and etype_unit2_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='tCO2')
);


INSERT INTO static.t_ref_config_emissions_type
(scope,etype_id,etypeattr1_id,etypeattr2_id,etypeattr3_id,etypeattr4_id,etype_unit1_id,etype_unit2_id,date_added,added_by,date_modified,modified_by)
SELECT
    '1'
     ,(select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_stationary_fuel_combustion')
     ,(select list_id from static.t_ref_list where list_key='impactm_stationary_fueltype' and list_value='SKO')
     ,null
     ,null
     ,null
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='KL')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='tCO2')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
	(SELECT 1 FROM static.t_ref_config_emissions_type WHERE
	 scope='1'
	 and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_stationary_fuel_combustion')
	 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_stationary_fueltype' and list_value='SKO')
	 and etype_unit1_id = (select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='KL')
	 and etype_unit2_id =(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='tCO2')
);

insert into static.t_ref_config_emissions_unit_factor
(config_emission_type_id,etype_unit1_id,etype_unit2_id,etype_unit1_factor,etype_unit2_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.t_ref_config_emissions_type WHERE
            scope='1'
                                                         and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_stationary_fuel_combustion')
                                                         and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_stationary_fueltype' and list_value='SKO')
                                                         and etype_unit1_id = (select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='KL')
                                                         and etype_unit2_id =(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='tCO2')
    )
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='KL')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='tCO2')
     ,1.00
     ,1.00
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
	(SELECT 1 FROM static.t_ref_config_emissions_unit_factor WHERE
	 config_emission_type_id=(SELECT id FROM static.t_ref_config_emissions_type WHERE
							 scope='1'
							 and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_stationary_fuel_combustion')
							 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_stationary_fueltype' and list_value='SKO')
							 and etype_unit1_id = (select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='KL')
							 and etype_unit2_id =(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='tCO2')
						 )
	and etype_unit1_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='KL')
	 and etype_unit2_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='tCO2')
);


INSERT INTO static.t_ref_config_emissions_type
(scope,etype_id,etypeattr1_id,etypeattr2_id,etypeattr3_id,etypeattr4_id,etype_unit1_id,etype_unit2_id,date_added,added_by,date_modified,modified_by)
SELECT
    '1'
     ,(select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_stationary_fuel_combustion')
     ,(select list_id from static.t_ref_list where list_key='impactm_stationary_fueltype' and list_value='Petcoke')
     ,null
     ,null
     ,null
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='tons')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='tCO2')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
	(SELECT 1 FROM static.t_ref_config_emissions_type WHERE
	 scope='1'
	 and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_stationary_fuel_combustion')
	 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_stationary_fueltype' and list_value='Petcoke')
	 and etype_unit1_id = (select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='tons')
	 and etype_unit2_id =(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='tCO2')
);

insert into static.t_ref_config_emissions_unit_factor
(config_emission_type_id,etype_unit1_id,etype_unit2_id,etype_unit1_factor,etype_unit2_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.t_ref_config_emissions_type WHERE
            scope='1'
                                                         and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_stationary_fuel_combustion')
                                                         and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_stationary_fueltype' and list_value='Petcoke')
                                                         and etype_unit1_id = (select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='tons')
                                                         and etype_unit2_id =(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='tCO2')
    )
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='tons')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='tCO2')
     ,1.00
     ,1.00
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
	(SELECT 1 FROM static.t_ref_config_emissions_unit_factor WHERE
	 config_emission_type_id=(SELECT id FROM static.t_ref_config_emissions_type WHERE
							 scope='1'
							 and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_stationary_fuel_combustion')
							 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_stationary_fueltype' and list_value='Petcoke')
							 and etype_unit1_id = (select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='tons')
							 and etype_unit2_id =(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='tCO2')
						 )
	and etype_unit1_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='tons')
	 and etype_unit2_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='tCO2')
);

INSERT INTO static.t_ref_config_emissions_type
(scope,etype_id,etypeattr1_id,etypeattr2_id,etypeattr3_id,etypeattr4_id,etype_unit1_id,etype_unit2_id,date_added,added_by,date_modified,modified_by)
SELECT
    '1'
     ,(select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_stationary_fuel_combustion')
     ,(select list_id from static.t_ref_list where list_key='impactm_stationary_fueltype' and list_value='Furnace Oil')
     ,null
     ,null
     ,null
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='KL')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='tCO2')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
	(SELECT 1 FROM static.t_ref_config_emissions_type WHERE
	 scope='1'
	 and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_stationary_fuel_combustion')
	 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_stationary_fueltype' and list_value='Furnace Oil')
	 and etype_unit1_id = (select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='KL')
	 and etype_unit2_id =(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='tCO2')
);

insert into static.t_ref_config_emissions_unit_factor
(config_emission_type_id,etype_unit1_id,etype_unit2_id,etype_unit1_factor,etype_unit2_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.t_ref_config_emissions_type WHERE
            scope='1'
                                                         and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_stationary_fuel_combustion')
                                                         and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_stationary_fueltype' and list_value='Furnace Oil')
                                                         and etype_unit1_id = (select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='KL')
                                                         and etype_unit2_id =(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='tCO2')
    )
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='KL')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='tCO2')
     ,1.00
     ,1.00
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
	(SELECT 1 FROM static.t_ref_config_emissions_unit_factor WHERE
	 config_emission_type_id=(SELECT id FROM static.t_ref_config_emissions_type WHERE
							 scope='1'
							 and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_stationary_fuel_combustion')
							 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_stationary_fueltype' and list_value='Furnace Oil')
							 and etype_unit1_id = (select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='KL')
							 and etype_unit2_id =(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='tCO2')
						 )
	and etype_unit1_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='KL')
	 and etype_unit2_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='tCO2')
);

INSERT INTO static.t_ref_config_emissions_type
(scope,etype_id,etypeattr1_id,etypeattr2_id,etypeattr3_id,etypeattr4_id,etype_unit1_id,etype_unit2_id,date_added,added_by,date_modified,modified_by)
SELECT
    '1'
     ,(select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_stationary_fuel_combustion')
     ,(select list_id from static.t_ref_list where list_key='impactm_stationary_fueltype' and list_value='Gasoline')
     ,null
     ,null
     ,null
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='GJ')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
	(SELECT 1 FROM static.t_ref_config_emissions_type WHERE
	 scope='1'
	 and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_stationary_fuel_combustion')
	 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_stationary_fueltype' and list_value='Gasoline')
	 and etype_unit1_id = (select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='GJ')
	 and etype_unit2_id =(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
);

insert into static.t_ref_config_emissions_unit_factor
(config_emission_type_id,etype_unit1_id,etype_unit2_id,etype_unit1_factor,etype_unit2_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.t_ref_config_emissions_type WHERE
            scope='1'
                                                         and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_stationary_fuel_combustion')
                                                         and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_stationary_fueltype' and list_value='Gasoline')
                                                         and etype_unit1_id = (select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='GJ')
                                                         and etype_unit2_id =(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
    )
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='GJ')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,1.00
     ,0.001
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
	(SELECT 1 FROM static.t_ref_config_emissions_unit_factor WHERE
	 config_emission_type_id=(SELECT id FROM static.t_ref_config_emissions_type WHERE
							 scope='1'
							 and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_stationary_fuel_combustion')
							 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_stationary_fueltype' and list_value='Gasoline')
							 and etype_unit1_id = (select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='GJ')
							 and etype_unit2_id =(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
						 )
	and etype_unit1_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='GJ')
	 and etype_unit2_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
);

INSERT INTO static.t_ref_config_emissions_type
(scope,etype_id,etypeattr1_id,etypeattr2_id,etypeattr3_id,etypeattr4_id,etype_unit1_id,etype_unit2_id,date_added,added_by,date_modified,modified_by)
SELECT
    '1'
     ,(select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_stationary_fuel_combustion')
     ,(select list_id from static.t_ref_list where list_key='impactm_stationary_fueltype' and list_value='Kerosene')
     ,null
     ,null
     ,null
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='GJ')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
	(SELECT 1 FROM static.t_ref_config_emissions_type WHERE
	 scope='1'
	 and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_stationary_fuel_combustion')
	 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_stationary_fueltype' and list_value='Kerosene')
	 and etype_unit1_id = (select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='GJ')
	 and etype_unit2_id =(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
);

insert into static.t_ref_config_emissions_unit_factor
(config_emission_type_id,etype_unit1_id,etype_unit2_id,etype_unit1_factor,etype_unit2_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.t_ref_config_emissions_type WHERE
            scope='1'
                                                         and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_stationary_fuel_combustion')
                                                         and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_stationary_fueltype' and list_value='Kerosene')
                                                         and etype_unit1_id = (select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='GJ')
                                                         and etype_unit2_id =(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
    )
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='GJ')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,1.00
     ,0.001
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
	(SELECT 1 FROM static.t_ref_config_emissions_unit_factor WHERE
	 config_emission_type_id=(SELECT id FROM static.t_ref_config_emissions_type WHERE
							 scope='1'
							 and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_stationary_fuel_combustion')
							 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_stationary_fueltype' and list_value='Kerosene')
							 and etype_unit1_id = (select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='GJ')
							 and etype_unit2_id =(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
						 )
	and etype_unit1_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='GJ')
	 and etype_unit2_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
);
INSERT INTO static.t_ref_config_emissions_type
(scope,etype_id,etypeattr1_id,etypeattr2_id,etypeattr3_id,etypeattr4_id,etype_unit1_id,etype_unit2_id,date_added,added_by,date_modified,modified_by)
SELECT
    '1'
     ,(select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_stationary_fuel_combustion')
     ,(select list_id from static.t_ref_list where list_key='impactm_stationary_fueltype' and list_value='Heating oil')
     ,null
     ,null
     ,null
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='GJ')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
	(SELECT 1 FROM static.t_ref_config_emissions_type WHERE
	 scope='1'
	 and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_stationary_fuel_combustion')
	 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_stationary_fueltype' and list_value='Heating oil')
	 and etype_unit1_id = (select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='GJ')
	 and etype_unit2_id =(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
);

insert into static.t_ref_config_emissions_unit_factor
(config_emission_type_id,etype_unit1_id,etype_unit2_id,etype_unit1_factor,etype_unit2_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.t_ref_config_emissions_type WHERE
            scope='1'
                                                         and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_stationary_fuel_combustion')
                                                         and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_stationary_fueltype' and list_value='Heating oil')
                                                         and etype_unit1_id = (select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='GJ')
                                                         and etype_unit2_id =(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
    )
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='GJ')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,1.00
     ,0.001
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
	(SELECT 1 FROM static.t_ref_config_emissions_unit_factor WHERE
	 config_emission_type_id=(SELECT id FROM static.t_ref_config_emissions_type WHERE
							 scope='1'
							 and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_stationary_fuel_combustion')
							 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_stationary_fueltype' and list_value='Heating oil')
							 and etype_unit1_id = (select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='GJ')
							 and etype_unit2_id =(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
						 )
	and etype_unit1_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='GJ')
	 and etype_unit2_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
);

INSERT INTO static.t_ref_config_emissions_type
(scope,etype_id,etypeattr1_id,etypeattr2_id,etypeattr3_id,etypeattr4_id,etype_unit1_id,etype_unit2_id,date_added,added_by,date_modified,modified_by)
SELECT
    '1'
     ,(select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_stationary_fuel_combustion')
     ,(select list_id from static.t_ref_list where list_key='impactm_stationary_fueltype' and list_value='Diesel oil')
     ,null
     ,null
     ,null
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='GJ')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
	(SELECT 1 FROM static.t_ref_config_emissions_type WHERE
	 scope='1'
	 and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_stationary_fuel_combustion')
	 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_stationary_fueltype' and list_value='Diesel oil')
	 and etype_unit1_id = (select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='GJ')
	 and etype_unit2_id =(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
);

insert into static.t_ref_config_emissions_unit_factor
(config_emission_type_id,etype_unit1_id,etype_unit2_id,etype_unit1_factor,etype_unit2_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.t_ref_config_emissions_type WHERE
            scope='1'
                                                         and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_stationary_fuel_combustion')
                                                         and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_stationary_fueltype' and list_value='Diesel oil')
                                                         and etype_unit1_id = (select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='GJ')
                                                         and etype_unit2_id =(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
    )
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='GJ')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,1.00
     ,0.001
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
	(SELECT 1 FROM static.t_ref_config_emissions_unit_factor WHERE
	 config_emission_type_id=(SELECT id FROM static.t_ref_config_emissions_type WHERE
							 scope='1'
							 and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_stationary_fuel_combustion')
							 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_stationary_fueltype' and list_value='Diesel oil')
							 and etype_unit1_id = (select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='GJ')
							 and etype_unit2_id =(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
						 )
	and etype_unit1_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='GJ')
	 and etype_unit2_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
);

INSERT INTO static.t_ref_config_emissions_type
(scope,etype_id,etypeattr1_id,etypeattr2_id,etypeattr3_id,etypeattr4_id,etype_unit1_id,etype_unit2_id,date_added,added_by,date_modified,modified_by)
SELECT
    '1'
     ,(select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_stationary_fuel_combustion')
     ,(select list_id from static.t_ref_list where list_key='impactm_stationary_fueltype' and list_value='Fuel oil')
     ,null
     ,null
     ,null
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='GJ')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
	(SELECT 1 FROM static.t_ref_config_emissions_type WHERE
	 scope='1'
	 and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_stationary_fuel_combustion')
	 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_stationary_fueltype' and list_value='Fuel oil')
	 and etype_unit1_id = (select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='GJ')
	 and etype_unit2_id =(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
);

insert into static.t_ref_config_emissions_unit_factor
(config_emission_type_id,etype_unit1_id,etype_unit2_id,etype_unit1_factor,etype_unit2_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.t_ref_config_emissions_type WHERE
            scope='1'
                                                         and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_stationary_fuel_combustion')
                                                         and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_stationary_fueltype' and list_value='Fuel oil')
                                                         and etype_unit1_id = (select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='GJ')
                                                         and etype_unit2_id =(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
    )
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='GJ')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,1.00
     ,0.001
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
	(SELECT 1 FROM static.t_ref_config_emissions_unit_factor WHERE
	 config_emission_type_id=(SELECT id FROM static.t_ref_config_emissions_type WHERE
							 scope='1'
							 and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_stationary_fuel_combustion')
							 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_stationary_fueltype' and list_value='Fuel oil')
							 and etype_unit1_id = (select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='GJ')
							 and etype_unit2_id =(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
						 )
	and etype_unit1_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='GJ')
	 and etype_unit2_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
);

---
INSERT INTO static.t_ref_config_emissions_type
(scope,etype_id,etypeattr1_id,etypeattr2_id,etypeattr3_id,etypeattr4_id,etype_unit1_id,etype_unit2_id,date_added,added_by,date_modified,modified_by)
SELECT
    '1'
     ,(select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_stationary_fuel_combustion')
     ,(select list_id from static.t_ref_list where list_key='impactm_stationary_fueltype' and list_value='Liquefied petroleum gas (LPG)')
     ,null
     ,null
     ,null
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='GJ')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
	(SELECT 1 FROM static.t_ref_config_emissions_type WHERE
	 scope='1'
	 and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_stationary_fuel_combustion')
	 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_stationary_fueltype' and list_value='Liquefied petroleum gas (LPG)')
	 and etype_unit1_id = (select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='GJ')
	 and etype_unit2_id =(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
);

insert into static.t_ref_config_emissions_unit_factor
(config_emission_type_id,etype_unit1_id,etype_unit2_id,etype_unit1_factor,etype_unit2_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.t_ref_config_emissions_type WHERE
            scope='1'
                                                         and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_stationary_fuel_combustion')
                                                         and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_stationary_fueltype' and list_value='Liquefied petroleum gas (LPG)')
                                                         and etype_unit1_id = (select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='GJ')
                                                         and etype_unit2_id =(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
    )
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='GJ')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,1.00
     ,0.001
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
	(SELECT 1 FROM static.t_ref_config_emissions_unit_factor WHERE
	 config_emission_type_id=(SELECT id FROM static.t_ref_config_emissions_type WHERE
							 scope='1'
							 and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_stationary_fuel_combustion')
							 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_stationary_fueltype' and list_value='Liquefied petroleum gas (LPG)')
							 and etype_unit1_id = (select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='GJ')
							 and etype_unit2_id =(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
						 )
	and etype_unit1_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='GJ')
	 and etype_unit2_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
);




INSERT INTO static.t_ref_config_emissions_type
(scope,etype_id,etypeattr1_id,etypeattr2_id,etypeattr3_id,etypeattr4_id,etype_unit1_id,etype_unit2_id,date_added,added_by,date_modified,modified_by)
SELECT
    '1'
     ,(select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_mobile_fuel_combustion')
     ,(select list_id from static.t_ref_list where list_key='impactm_mobile_fueltype' and list_value='LNG')
     ,null
     ,null
     ,null
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='KL')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='tCO2')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
	(SELECT 1 FROM static.t_ref_config_emissions_type WHERE
	 scope='1'
	 and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_mobile_fuel_combustion')
	 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_mobile_fueltype' and list_value='LNG')
	 and etype_unit1_id = (select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='KL')
	 and etype_unit2_id =(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='tCO2')
);

insert into static.t_ref_config_emissions_unit_factor
(config_emission_type_id,etype_unit1_id,etype_unit2_id,etype_unit1_factor,etype_unit2_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.t_ref_config_emissions_type WHERE
            scope='1'
                                                         and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_mobile_fuel_combustion')
                                                         and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_mobile_fueltype' and list_value='LNG')
                                                         and etype_unit1_id = (select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='KL')
                                                         and etype_unit2_id =(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='tCO2')
    )
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='KL')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='tCO2')
     ,1.00
     ,1.00
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
	(SELECT 1 FROM static.t_ref_config_emissions_unit_factor WHERE
	 config_emission_type_id=(SELECT id FROM static.t_ref_config_emissions_type WHERE
							 scope='1'
							 and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_mobile_fuel_combustion')
							 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_mobile_fueltype' and list_value='LNG')
							 and etype_unit1_id = (select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='KL')
							 and etype_unit2_id =(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='tCO2')
						 )
	and etype_unit1_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='KL')
	 and etype_unit2_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='tCO2')
);

INSERT INTO static.t_ref_config_emissions_type
(scope,etype_id,etypeattr1_id,etypeattr2_id,etypeattr3_id,etypeattr4_id,etype_unit1_id,etype_unit2_id,date_added,added_by,date_modified,modified_by)
SELECT
    '1'
     ,(select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_mobile_fuel_combustion')
     ,(select list_id from static.t_ref_list where list_key='impactm_mobile_fueltype' and list_value='Petrol')
     ,null
     ,null
     ,null
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='KL')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='tCO2')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
	(SELECT 1 FROM static.t_ref_config_emissions_type WHERE
	 scope='1'
	 and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_mobile_fuel_combustion')
	 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_mobile_fueltype' and list_value='Petrol')
	 and etype_unit1_id = (select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='KL')
	 and etype_unit2_id =(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='tCO2')
);

insert into static.t_ref_config_emissions_unit_factor
(config_emission_type_id,etype_unit1_id,etype_unit2_id,etype_unit1_factor,etype_unit2_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.t_ref_config_emissions_type WHERE
            scope='1'
                                                         and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_mobile_fuel_combustion')
                                                         and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_mobile_fueltype' and list_value='Petrol')
                                                         and etype_unit1_id = (select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='KL')
                                                         and etype_unit2_id =(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='tCO2')
    )
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='KL')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='tCO2')
     ,1.00
     ,1.00
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
	(SELECT 1 FROM static.t_ref_config_emissions_unit_factor WHERE
	 config_emission_type_id=(SELECT id FROM static.t_ref_config_emissions_type WHERE
							 scope='1'
							 and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_mobile_fuel_combustion')
							 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_mobile_fueltype' and list_value='Petrol')
							 and etype_unit1_id = (select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='KL')
							 and etype_unit2_id =(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='tCO2')
						 )
	and etype_unit1_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='KL')
	 and etype_unit2_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='tCO2')
);

INSERT INTO static.t_ref_config_emissions_type
(scope,etype_id,etypeattr1_id,etypeattr2_id,etypeattr3_id,etypeattr4_id,etype_unit1_id,etype_unit2_id,date_added,added_by,date_modified,modified_by)
SELECT
    '1'
     ,(select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_mobile_fuel_combustion')
     ,(select list_id from static.t_ref_list where list_key='impactm_mobile_fueltype' and list_value='Diesel')
     ,null
     ,null
     ,null
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='KL')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='tCO2')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
	(SELECT 1 FROM static.t_ref_config_emissions_type WHERE
	 scope='1'
	 and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_mobile_fuel_combustion')
	 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_mobile_fueltype' and list_value='Diesel')
	 and etype_unit1_id = (select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='KL')
	 and etype_unit2_id =(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='tCO2')
);

insert into static.t_ref_config_emissions_unit_factor
(config_emission_type_id,etype_unit1_id,etype_unit2_id,etype_unit1_factor,etype_unit2_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.t_ref_config_emissions_type WHERE
            scope='1'
                                                         and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_mobile_fuel_combustion')
                                                         and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_mobile_fueltype' and list_value='Diesel')
                                                         and etype_unit1_id = (select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='KL')
                                                         and etype_unit2_id =(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='tCO2')
    )
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='KL')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='tCO2')
     ,1.00
     ,1.00
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
	(SELECT 1 FROM static.t_ref_config_emissions_unit_factor WHERE
	 config_emission_type_id=(SELECT id FROM static.t_ref_config_emissions_type WHERE
							 scope='1'
							 and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_mobile_fuel_combustion')
							 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_mobile_fueltype' and list_value='Diesel')
							 and etype_unit1_id = (select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='KL')
							 and etype_unit2_id =(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='tCO2')
						 )
	and etype_unit1_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='KL')
	 and etype_unit2_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='tCO2')
);

INSERT INTO static.t_ref_config_emissions_type
(scope,etype_id,etypeattr1_id,etypeattr2_id,etypeattr3_id,etypeattr4_id,etype_unit1_id,etype_unit2_id,date_added,added_by,date_modified,modified_by)
SELECT
    '1'
     ,(select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_mobile_fuel_combustion')
     ,(select list_id from static.t_ref_list where list_key='impactm_mobile_fueltype' and list_value='Liquefied petroleum gas (LPG)')
     ,null
     ,null
     ,null
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='tons')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='tCO2')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
	(SELECT 1 FROM static.t_ref_config_emissions_type WHERE
	 scope='1'
	 and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_mobile_fuel_combustion')
	 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_mobile_fueltype' and list_value='Liquefied petroleum gas (LPG)')
	 and etype_unit1_id = (select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='tons')
	 and etype_unit2_id =(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='tCO2')
);

insert into static.t_ref_config_emissions_unit_factor
(config_emission_type_id,etype_unit1_id,etype_unit2_id,etype_unit1_factor,etype_unit2_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.t_ref_config_emissions_type WHERE
            scope='1'
                                                         and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_mobile_fuel_combustion')
                                                         and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_mobile_fueltype' and list_value='Liquefied petroleum gas (LPG)')
                                                         and etype_unit1_id = (select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='tons')
                                                         and etype_unit2_id =(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='tCO2')
    )
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='tons')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='tCO2')
     ,1.00
     ,1.00
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
	(SELECT 1 FROM static.t_ref_config_emissions_unit_factor WHERE
	 config_emission_type_id=(SELECT id FROM static.t_ref_config_emissions_type WHERE
							 scope='1'
							 and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_mobile_fuel_combustion')
							 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_mobile_fueltype' and list_value='Liquefied petroleum gas (LPG)')
							 and etype_unit1_id = (select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='tons')
							 and etype_unit2_id =(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='tCO2')
						 )
	and etype_unit1_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='tons')
	 and etype_unit2_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='tCO2')
);

INSERT INTO static.t_ref_config_emissions_type
(scope,etype_id,etypeattr1_id,etypeattr2_id,etypeattr3_id,etypeattr4_id,etype_unit1_id,etype_unit2_id,date_added,added_by,date_modified,modified_by)
SELECT
    '1'
     ,(select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_mobile_fuel_combustion')
     ,(select list_id from static.t_ref_list where list_key='impactm_mobile_fueltype' and list_value='Gasoline')
     ,null
     ,null
     ,null
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='GJ')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
	(SELECT 1 FROM static.t_ref_config_emissions_type WHERE
	 scope='1'
	 and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_mobile_fuel_combustion')
	 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_mobile_fueltype' and list_value='Gasoline')
	 and etype_unit1_id = (select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='GJ')
	 and etype_unit2_id =(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
);

insert into static.t_ref_config_emissions_unit_factor
(config_emission_type_id,etype_unit1_id,etype_unit2_id,etype_unit1_factor,etype_unit2_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.t_ref_config_emissions_type WHERE
            scope='1'
                                                         and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_mobile_fuel_combustion')
                                                         and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_mobile_fueltype' and list_value='Gasoline')
                                                         and etype_unit1_id = (select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='GJ')
                                                         and etype_unit2_id =(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
    )
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='GJ')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,1.00
     ,0.001
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
	(SELECT 1 FROM static.t_ref_config_emissions_unit_factor WHERE
	 config_emission_type_id=(SELECT id FROM static.t_ref_config_emissions_type WHERE
							 scope='1'
							 and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_mobile_fuel_combustion')
							 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_mobile_fueltype' and list_value='Gasoline')
							 and etype_unit1_id = (select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='GJ')
							 and etype_unit2_id =(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
						 )
	and etype_unit1_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='GJ')
	 and etype_unit2_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
);

INSERT INTO static.t_ref_config_emissions_type
(scope,etype_id,etypeattr1_id,etypeattr2_id,etypeattr3_id,etypeattr4_id,etype_unit1_id,etype_unit2_id,date_added,added_by,date_modified,modified_by)
SELECT
    '1'
     ,(select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_mobile_fuel_combustion')
     ,(select list_id from static.t_ref_list where list_key='impactm_mobile_fueltype' and list_value='Diesel oil')
     ,null
     ,null
     ,null
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='GJ')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
	(SELECT 1 FROM static.t_ref_config_emissions_type WHERE
	 scope='1'
	 and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_mobile_fuel_combustion')
	 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_mobile_fueltype' and list_value='Diesel oil')
	 and etype_unit1_id = (select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='GJ')
	 and etype_unit2_id =(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
);

insert into static.t_ref_config_emissions_unit_factor
(config_emission_type_id,etype_unit1_id,etype_unit2_id,etype_unit1_factor,etype_unit2_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.t_ref_config_emissions_type WHERE
            scope='1'
                                                         and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_mobile_fuel_combustion')
                                                         and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_mobile_fueltype' and list_value='Diesel oil')
                                                         and etype_unit1_id = (select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='GJ')
                                                         and etype_unit2_id =(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
    )
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='GJ')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,1.00
     ,0.001
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
	(SELECT 1 FROM static.t_ref_config_emissions_unit_factor WHERE
	 config_emission_type_id=(SELECT id FROM static.t_ref_config_emissions_type WHERE
							 scope='1'
							 and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_mobile_fuel_combustion')
							 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_mobile_fueltype' and list_value='Diesel oil')
							 and etype_unit1_id = (select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='GJ')
							 and etype_unit2_id =(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
						 )
	and etype_unit1_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='GJ')
	 and etype_unit2_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
);

INSERT INTO static.t_ref_config_emissions_type
(scope,etype_id,etypeattr1_id,etypeattr2_id,etypeattr3_id,etypeattr4_id,etype_unit1_id,etype_unit2_id,date_added,added_by,date_modified,modified_by)
SELECT
    '1'
     ,(select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_mobile_fuel_combustion')
     ,(select list_id from static.t_ref_list where list_key='impactm_mobile_fueltype' and list_value='Liquefied petroleum gas (LPG)')
     ,null
     ,null
     ,null
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='GJ')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
	(SELECT 1 FROM static.t_ref_config_emissions_type WHERE
	 scope='1'
	 and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_mobile_fuel_combustion')
	 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_mobile_fueltype' and list_value='Liquefied petroleum gas (LPG)')
	 and etype_unit1_id = (select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='GJ')
	 and etype_unit2_id =(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
);

insert into static.t_ref_config_emissions_unit_factor
(config_emission_type_id,etype_unit1_id,etype_unit2_id,etype_unit1_factor,etype_unit2_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.t_ref_config_emissions_type WHERE
            scope='1'
                                                         and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_mobile_fuel_combustion')
                                                         and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_mobile_fueltype' and list_value='Liquefied petroleum gas (LPG)')
                                                         and etype_unit1_id = (select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='GJ')
                                                         and etype_unit2_id =(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
    )
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='GJ')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,1.00
     ,0.001
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
	(SELECT 1 FROM static.t_ref_config_emissions_unit_factor WHERE
	 config_emission_type_id=(SELECT id FROM static.t_ref_config_emissions_type WHERE
							 scope='1'
							 and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_mobile_fuel_combustion')
							 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_mobile_fueltype' and list_value='Liquefied petroleum gas (LPG)')
							 and etype_unit1_id = (select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='GJ')
							 and etype_unit2_id =(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
						 )
	and etype_unit1_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='GJ')
	 and etype_unit2_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
);

INSERT INTO static.t_ref_config_emissions_type
(scope,etype_id,etypeattr1_id,etypeattr2_id,etypeattr3_id,etypeattr4_id,etype_unit1_id,etype_unit2_id,date_added,added_by,date_modified,modified_by)
SELECT
    '1'
     ,(select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_mobile_fuel_combustion')
     ,(select list_id from static.t_ref_list where list_key='impactm_mobile_fueltype' and list_value='Ethanol')
     ,null
     ,null
     ,null
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='GJ')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
	(SELECT 1 FROM static.t_ref_config_emissions_type WHERE
	 scope='1'
	 and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_mobile_fuel_combustion')
	 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_mobile_fueltype' and list_value='Ethanol')
	 and etype_unit1_id = (select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='GJ')
	 and etype_unit2_id =(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
);

insert into static.t_ref_config_emissions_unit_factor
(config_emission_type_id,etype_unit1_id,etype_unit2_id,etype_unit1_factor,etype_unit2_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.t_ref_config_emissions_type WHERE
            scope='1'
                                                         and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_mobile_fuel_combustion')
                                                         and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_mobile_fueltype' and list_value='Ethanol')
                                                         and etype_unit1_id = (select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='GJ')
                                                         and etype_unit2_id =(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
    )
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='GJ')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,1.00
     ,0.001
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
	(SELECT 1 FROM static.t_ref_config_emissions_unit_factor WHERE
	 config_emission_type_id=(SELECT id FROM static.t_ref_config_emissions_type WHERE
							 scope='1'
							 and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_mobile_fuel_combustion')
							 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_mobile_fueltype' and list_value='Ethanol')
							 and etype_unit1_id = (select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='GJ')
							 and etype_unit2_id =(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
						 )
	and etype_unit1_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='GJ')
	 and etype_unit2_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
);



insert into static.t_ref_config_emissions_type (
    scope,etype_id,etypeattr1_id,etypeattr2_id,etypeattr3_id,etypeattr4_id,etype_unit1_id,etype_unit2_id,date_added,added_by,date_modified,modified_by)
select
    1
     ,(select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_distance_travelled')
     ,(select list_id from static.t_ref_list where list_key='impactm_vehicle_category' and list_value='Passenger')
     ,(select list_id from static.t_ref_list where list_key='impactm_vehicle_type' and list_value='Car - petrol')
     ,(select list_id from static.t_ref_list where list_key='impactm_mobile_fueltype' and list_value='Petrol')
     ,null
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='km')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(select 1 from static.t_ref_config_emissions_type
 where
 etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_distance_travelled')
 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_vehicle_category' and list_value='Passenger')
 and etypeattr2_id=(select list_id from static.t_ref_list where list_key='impactm_vehicle_type' and list_value='Car - petrol')
 and etypeattr3_id=(select list_id from static.t_ref_list where list_key='impactm_mobile_fueltype' and list_value='Petrol')
 );

insert into static.t_ref_config_emissions_unit_factor
(config_emission_type_id,etype_unit1_id,etype_unit2_id,etype_unit1_factor,etype_unit2_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.t_ref_config_emissions_type WHERE
            scope='1'
                                                         and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_distance_travelled')
                                                         and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_vehicle_category' and list_value='Passenger')
                                                         and etypeattr2_id =(select list_id from static.t_ref_list where list_key='impactm_vehicle_type' and list_value='Car - petrol')
                                                         and etypeattr3_id =(select list_id from static.t_ref_list where list_key='impactm_mobile_fueltype' and list_value='Petrol')
    )
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='km')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,1.00
     ,0.001
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
	(SELECT 1 FROM static.t_ref_config_emissions_unit_factor WHERE
	 config_emission_type_id=(SELECT id FROM static.t_ref_config_emissions_type WHERE
							 scope='1'
							 and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_distance_travelled')
							 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_vehicle_category' and list_value='Passenger')
							 and etypeattr2_id =(select list_id from static.t_ref_list where list_key='impactm_vehicle_type' and list_value='Car - petrol')
							 and etypeattr3_id =(select list_id from static.t_ref_list where list_key='impactm_mobile_fueltype' and list_value='Petrol')
						 	)
	and etype_unit1_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='km')
	 and etype_unit2_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
);

insert into static.t_ref_config_emissions_type (
    scope,etype_id,etypeattr1_id,etypeattr2_id,etypeattr3_id,etypeattr4_id,etype_unit1_id,etype_unit2_id,date_added,added_by,date_modified,modified_by)
select
    1
     ,(select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_distance_travelled')
     ,(select list_id from static.t_ref_list where list_key='impactm_vehicle_category' and list_value='Passenger')
     ,(select list_id from static.t_ref_list where list_key='impactm_vehicle_type' and list_value='Car - diesel')
     ,(select list_id from static.t_ref_list where list_key='impactm_mobile_fueltype' and list_value='Diesel')
     ,null
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='km')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(select 1 from static.t_ref_config_emissions_type
 where
 etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_distance_travelled')
 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_vehicle_category' and list_value='Passenger')
 and etypeattr2_id=(select list_id from static.t_ref_list where list_key='impactm_vehicle_type' and list_value='Car - diesel')
 and etypeattr3_id=(select list_id from static.t_ref_list where list_key='impactm_mobile_fueltype' and list_value='Diesel')
 );

insert into static.t_ref_config_emissions_unit_factor
(config_emission_type_id,etype_unit1_id,etype_unit2_id,etype_unit1_factor,etype_unit2_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.t_ref_config_emissions_type WHERE
            scope='1'
                                                         and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_distance_travelled')
                                                         and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_vehicle_category' and list_value='Passenger')
                                                         and etypeattr2_id =(select list_id from static.t_ref_list where list_key='impactm_vehicle_type' and list_value='Car - diesel')
                                                         and etypeattr3_id =(select list_id from static.t_ref_list where list_key='impactm_mobile_fueltype' and list_value='Diesel')
    )
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='km')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,1.00
     ,0.001
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
	(SELECT 1 FROM static.t_ref_config_emissions_unit_factor WHERE
	 config_emission_type_id=(SELECT id FROM static.t_ref_config_emissions_type WHERE
							 scope='1'
							 and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_distance_travelled')
							 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_vehicle_category' and list_value='Passenger')
							 and etypeattr2_id =(select list_id from static.t_ref_list where list_key='impactm_vehicle_type' and list_value='Car - diesel')
							 and etypeattr3_id =(select list_id from static.t_ref_list where list_key='impactm_mobile_fueltype' and list_value='Diesel')
						 	)
	and etype_unit1_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='km')
	 and etype_unit2_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
);

insert into static.t_ref_config_emissions_type (
    scope,etype_id,etypeattr1_id,etypeattr2_id,etypeattr3_id,etypeattr4_id,etype_unit1_id,etype_unit2_id,date_added,added_by,date_modified,modified_by)
select
    1
     ,(select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_distance_travelled')
     ,(select list_id from static.t_ref_list where list_key='impactm_vehicle_category' and list_value='Passenger')
     ,(select list_id from static.t_ref_list where list_key='impactm_vehicle_type' and list_value='Car - CNG')
     ,(select list_id from static.t_ref_list where list_key='impactm_mobile_fueltype' and list_value='CNG')
     ,null
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='km')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(select 1 from static.t_ref_config_emissions_type
 where
 etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_distance_travelled')
 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_vehicle_category' and list_value='Passenger')
 and etypeattr2_id=(select list_id from static.t_ref_list where list_key='impactm_vehicle_type' and list_value='Car - CNG')
 and etypeattr3_id=(select list_id from static.t_ref_list where list_key='impactm_mobile_fueltype' and list_value='CNG')
 );

insert into static.t_ref_config_emissions_unit_factor
(config_emission_type_id,etype_unit1_id,etype_unit2_id,etype_unit1_factor,etype_unit2_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.t_ref_config_emissions_type WHERE
            scope='1'
                                                         and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_distance_travelled')
                                                         and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_vehicle_category' and list_value='Passenger')
                                                         and etypeattr2_id =(select list_id from static.t_ref_list where list_key='impactm_vehicle_type' and list_value='Car - CNG')
                                                         and etypeattr3_id =(select list_id from static.t_ref_list where list_key='impactm_mobile_fueltype' and list_value='CNG')
    )
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='km')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,1.00
     ,0.001
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
	(SELECT 1 FROM static.t_ref_config_emissions_unit_factor WHERE
	 config_emission_type_id=(SELECT id FROM static.t_ref_config_emissions_type WHERE
							 scope='1'
							 and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_distance_travelled')
							 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_vehicle_category' and list_value='Passenger')
							 and etypeattr2_id =(select list_id from static.t_ref_list where list_key='impactm_vehicle_type' and list_value='Car - CNG')
							 and etypeattr3_id =(select list_id from static.t_ref_list where list_key='impactm_mobile_fueltype' and list_value='CNG')
						 	)
	and etype_unit1_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='km')
	 and etype_unit2_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
);

insert into static.t_ref_config_emissions_type (
    scope,etype_id,etypeattr1_id,etypeattr2_id,etypeattr3_id,etypeattr4_id,etype_unit1_id,etype_unit2_id,date_added,added_by,date_modified,modified_by)
select
    1
     ,(select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_distance_travelled')
     ,(select list_id from static.t_ref_list where list_key='impactm_vehicle_category' and list_value='Passenger')
     ,(select list_id from static.t_ref_list where list_key='impactm_vehicle_type' and list_value='Car - LPG')
     ,(select list_id from static.t_ref_list where list_key='impactm_mobile_fueltype' and list_value='Liquefied petroleum gas (LPG)')
     ,null
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='km')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(select 1 from static.t_ref_config_emissions_type
 where
 etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_distance_travelled')
 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_vehicle_category' and list_value='Passenger')
 and etypeattr2_id=(select list_id from static.t_ref_list where list_key='impactm_vehicle_type' and list_value='Car - LPG')
 and etypeattr3_id=(select list_id from static.t_ref_list where list_key='impactm_mobile_fueltype' and list_value='Liquefied petroleum gas (LPG)')
 );

insert into static.t_ref_config_emissions_unit_factor
(config_emission_type_id,etype_unit1_id,etype_unit2_id,etype_unit1_factor,etype_unit2_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.t_ref_config_emissions_type WHERE
            scope='1'
                                                         and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_distance_travelled')
                                                         and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_vehicle_category' and list_value='Passenger')
                                                         and etypeattr2_id =(select list_id from static.t_ref_list where list_key='impactm_vehicle_type' and list_value='Car - LPG')
                                                         and etypeattr3_id =(select list_id from static.t_ref_list where list_key='impactm_mobile_fueltype' and list_value='Liquefied petroleum gas (LPG)')
    )
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='km')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,1.00
     ,0.001
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
	(SELECT 1 FROM static.t_ref_config_emissions_unit_factor WHERE
	 config_emission_type_id=(SELECT id FROM static.t_ref_config_emissions_type WHERE
							 scope='1'
							 and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_distance_travelled')
							 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_vehicle_category' and list_value='Passenger')
							 and etypeattr2_id =(select list_id from static.t_ref_list where list_key='impactm_vehicle_type' and list_value='Car - LPG')
							 and etypeattr3_id =(select list_id from static.t_ref_list where list_key='impactm_mobile_fueltype' and list_value='Liquefied petroleum gas (LPG)')
						 	)
	and etype_unit1_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='km')
	 and etype_unit2_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
);

insert into static.t_ref_config_emissions_type (
    scope,etype_id,etypeattr1_id,etypeattr2_id,etypeattr3_id,etypeattr4_id,etype_unit1_id,etype_unit2_id,date_added,added_by,date_modified,modified_by)
select
    1
     ,(select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_distance_travelled')
     ,(select list_id from static.t_ref_list where list_key='impactm_vehicle_category' and list_value='Passenger')
     ,(select list_id from static.t_ref_list where list_key='impactm_vehicle_type' and list_value='Auto - petrol')
     ,(select list_id from static.t_ref_list where list_key='impactm_mobile_fueltype' and list_value='Petrol')
     ,null
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='km')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(select 1 from static.t_ref_config_emissions_type
 where
 etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_distance_travelled')
 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_vehicle_category' and list_value='Passenger')
 and etypeattr2_id=(select list_id from static.t_ref_list where list_key='impactm_vehicle_type' and list_value='Auto - petrol')
 and etypeattr3_id=(select list_id from static.t_ref_list where list_key='impactm_mobile_fueltype' and list_value='Petrol')
 );

insert into static.t_ref_config_emissions_unit_factor
(config_emission_type_id,etype_unit1_id,etype_unit2_id,etype_unit1_factor,etype_unit2_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.t_ref_config_emissions_type WHERE
            scope='1'
                                                         and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_distance_travelled')
                                                         and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_vehicle_category' and list_value='Passenger')
                                                         and etypeattr2_id =(select list_id from static.t_ref_list where list_key='impactm_vehicle_type' and list_value='Auto - petrol')
                                                         and etypeattr3_id =(select list_id from static.t_ref_list where list_key='impactm_mobile_fueltype' and list_value='Petrol')
    )
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='km')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,1.00
     ,0.001
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
	(SELECT 1 FROM static.t_ref_config_emissions_unit_factor WHERE
	 config_emission_type_id=(SELECT id FROM static.t_ref_config_emissions_type WHERE
							 scope='1'
							 and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_distance_travelled')
							 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_vehicle_category' and list_value='Passenger')
							 and etypeattr2_id =(select list_id from static.t_ref_list where list_key='impactm_vehicle_type' and list_value='Auto - petrol')
							 and etypeattr3_id =(select list_id from static.t_ref_list where list_key='impactm_mobile_fueltype' and list_value='Petrol')
						 	)
	and etype_unit1_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='km')
	 and etype_unit2_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
);

insert into static.t_ref_config_emissions_type (
    scope,etype_id,etypeattr1_id,etypeattr2_id,etypeattr3_id,etypeattr4_id,etype_unit1_id,etype_unit2_id,date_added,added_by,date_modified,modified_by)
select
    1
     ,(select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_distance_travelled')
     ,(select list_id from static.t_ref_list where list_key='impactm_vehicle_category' and list_value='Passenger')
     ,(select list_id from static.t_ref_list where list_key='impactm_vehicle_type' and list_value='Auto - CNG')
     ,(select list_id from static.t_ref_list where list_key='impactm_mobile_fueltype' and list_value='Petrol')
     ,null
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='km')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(select 1 from static.t_ref_config_emissions_type
 where
 etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_distance_travelled')
 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_vehicle_category' and list_value='Passenger')
 and etypeattr2_id=(select list_id from static.t_ref_list where list_key='impactm_vehicle_type' and list_value='Auto - CNG')
 and etypeattr3_id=(select list_id from static.t_ref_list where list_key='impactm_mobile_fueltype' and list_value='Petrol')
 );

insert into static.t_ref_config_emissions_unit_factor
(config_emission_type_id,etype_unit1_id,etype_unit2_id,etype_unit1_factor,etype_unit2_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.t_ref_config_emissions_type WHERE
            scope='1'
                                                         and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_distance_travelled')
                                                         and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_vehicle_category' and list_value='Passenger')
                                                         and etypeattr2_id =(select list_id from static.t_ref_list where list_key='impactm_vehicle_type' and list_value='Auto - CNG')
                                                         and etypeattr3_id =(select list_id from static.t_ref_list where list_key='impactm_mobile_fueltype' and list_value='Petrol')
    )
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='km')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,1.00
     ,0.001
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
	(SELECT 1 FROM static.t_ref_config_emissions_unit_factor WHERE
	 config_emission_type_id=(SELECT id FROM static.t_ref_config_emissions_type WHERE
							 scope='1'
							 and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_distance_travelled')
							 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_vehicle_category' and list_value='Passenger')
							 and etypeattr2_id =(select list_id from static.t_ref_list where list_key='impactm_vehicle_type' and list_value='Auto - CNG')
							 and etypeattr3_id =(select list_id from static.t_ref_list where list_key='impactm_mobile_fueltype' and list_value='CNG')
						 	)
	and etype_unit1_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='km')
	 and etype_unit2_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
);

insert into static.t_ref_config_emissions_type (
    scope,etype_id,etypeattr1_id,etypeattr2_id,etypeattr3_id,etypeattr4_id,etype_unit1_id,etype_unit2_id,date_added,added_by,date_modified,modified_by)
select
    1
     ,(select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_distance_travelled')
     ,(select list_id from static.t_ref_list where list_key='impactm_vehicle_category' and list_value='Passenger')
     ,(select list_id from static.t_ref_list where list_key='impactm_vehicle_type' and list_value='Auto - LPG')
     ,(select list_id from static.t_ref_list where list_key='impactm_mobile_fueltype' and list_value='Liquefied petroleum gas (LPG)')
     ,null
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='km')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(select 1 from static.t_ref_config_emissions_type
 where
 etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_distance_travelled')
 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_vehicle_category' and list_value='Passenger')
 and etypeattr2_id=(select list_id from static.t_ref_list where list_key='impactm_vehicle_type' and list_value='Auto - LPG')
 and etypeattr3_id=(select list_id from static.t_ref_list where list_key='impactm_mobile_fueltype' and list_value='Liquefied petroleum gas (LPG)')
 );

insert into static.t_ref_config_emissions_unit_factor
(config_emission_type_id,etype_unit1_id,etype_unit2_id,etype_unit1_factor,etype_unit2_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.t_ref_config_emissions_type WHERE
            scope='1'
                                                         and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_distance_travelled')
                                                         and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_vehicle_category' and list_value='Passenger')
                                                         and etypeattr2_id =(select list_id from static.t_ref_list where list_key='impactm_vehicle_type' and list_value='Auto - LPG')
                                                         and etypeattr3_id =(select list_id from static.t_ref_list where list_key='impactm_mobile_fueltype' and list_value='Liquefied petroleum gas (LPG)')
    )
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='km')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,1.00
     ,0.001
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
	(SELECT 1 FROM static.t_ref_config_emissions_unit_factor WHERE
	 config_emission_type_id=(SELECT id FROM static.t_ref_config_emissions_type WHERE
							 scope='1'
							 and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_distance_travelled')
							 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_vehicle_category' and list_value='Passenger')
							 and etypeattr2_id =(select list_id from static.t_ref_list where list_key='impactm_vehicle_type' and list_value='Auto - LPG')
							 and etypeattr3_id =(select list_id from static.t_ref_list where list_key='impactm_mobile_fueltype' and list_value='Liquefied petroleum gas (LPG)')
						 	)
	and etype_unit1_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='km')
	 and etype_unit2_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
);

insert into static.t_ref_config_emissions_type (
    scope,etype_id,etypeattr1_id,etypeattr2_id,etypeattr3_id,etypeattr4_id,etype_unit1_id,etype_unit2_id,date_added,added_by,date_modified,modified_by)
select
    1
     ,(select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_distance_travelled')
     ,(select list_id from static.t_ref_list where list_key='impactm_vehicle_category' and list_value='Commercial')
     ,(select list_id from static.t_ref_list where list_key='impactm_vehicle_type' and list_value='Light Duty Vehicle (<3.5T)')
     ,(select list_id from static.t_ref_list where list_key='impactm_mobile_fueltype' and list_value='Diesel')
     ,null
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='km')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(select 1 from static.t_ref_config_emissions_type
 where
 etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_distance_travelled')
 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_vehicle_category' and list_value='Commercial')
 and etypeattr2_id=(select list_id from static.t_ref_list where list_key='impactm_vehicle_type' and list_value='Light Duty Vehicle (<3.5T)')
 and etypeattr3_id=(select list_id from static.t_ref_list where list_key='impactm_mobile_fueltype' and list_value='Diesel')
 );

insert into static.t_ref_config_emissions_unit_factor
(config_emission_type_id,etype_unit1_id,etype_unit2_id,etype_unit1_factor,etype_unit2_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.t_ref_config_emissions_type WHERE
            scope='1'
                                                         and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_distance_travelled')
                                                         and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_vehicle_category' and list_value='Commercial')
                                                         and etypeattr2_id =(select list_id from static.t_ref_list where list_key='impactm_vehicle_type' and list_value='Light Duty Vehicle (<3.5T)')
                                                         and etypeattr3_id =(select list_id from static.t_ref_list where list_key='impactm_mobile_fueltype' and list_value='Diesel')
    )
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='km')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,1.00
     ,0.001
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
	(SELECT 1 FROM static.t_ref_config_emissions_unit_factor WHERE
	 config_emission_type_id=(SELECT id FROM static.t_ref_config_emissions_type WHERE
							 scope='1'
							 and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_distance_travelled')
							 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_vehicle_category' and list_value='Commercial')
							 and etypeattr2_id =(select list_id from static.t_ref_list where list_key='impactm_vehicle_type' and list_value='Light Duty Vehicle (<3.5T)')
							 and etypeattr3_id =(select list_id from static.t_ref_list where list_key='impactm_mobile_fueltype' and list_value='Diesel')
						 	)
	and etype_unit1_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='km')
	 and etype_unit2_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
);

insert into static.t_ref_config_emissions_type (
    scope,etype_id,etypeattr1_id,etypeattr2_id,etypeattr3_id,etypeattr4_id,etype_unit1_id,etype_unit2_id,date_added,added_by,date_modified,modified_by)
select
    1
     ,(select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_distance_travelled')
     ,(select list_id from static.t_ref_list where list_key='impactm_vehicle_category' and list_value='Commercial')
     ,(select list_id from static.t_ref_list where list_key='impactm_vehicle_type' and list_value='Medium Duty Vehicle (<12T)')
     ,(select list_id from static.t_ref_list where list_key='impactm_mobile_fueltype' and list_value='Diesel')
     ,null
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='km')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(select 1 from static.t_ref_config_emissions_type
 where
 etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_distance_travelled')
 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_vehicle_category' and list_value='Commercial')
 and etypeattr2_id=(select list_id from static.t_ref_list where list_key='impactm_vehicle_type' and list_value='Medium Duty Vehicle (<12T)')
 and etypeattr3_id=(select list_id from static.t_ref_list where list_key='impactm_mobile_fueltype' and list_value='Diesel')
 );

insert into static.t_ref_config_emissions_unit_factor
(config_emission_type_id,etype_unit1_id,etype_unit2_id,etype_unit1_factor,etype_unit2_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.t_ref_config_emissions_type WHERE
            scope='1'
                                                         and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_distance_travelled')
                                                         and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_vehicle_category' and list_value='Commercial')
                                                         and etypeattr2_id =(select list_id from static.t_ref_list where list_key='impactm_vehicle_type' and list_value='Medium Duty Vehicle (<12T)')
                                                         and etypeattr3_id =(select list_id from static.t_ref_list where list_key='impactm_mobile_fueltype' and list_value='Diesel')
    )
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='km')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,1.00
     ,0.001
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
	(SELECT 1 FROM static.t_ref_config_emissions_unit_factor WHERE
	 config_emission_type_id=(SELECT id FROM static.t_ref_config_emissions_type WHERE
							 scope='1'
							 and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_distance_travelled')
							 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_vehicle_category' and list_value='Commercial')
							 and etypeattr2_id =(select list_id from static.t_ref_list where list_key='impactm_vehicle_type' and list_value='Medium Duty Vehicle (<12T)')
							 and etypeattr3_id =(select list_id from static.t_ref_list where list_key='impactm_mobile_fueltype' and list_value='Diesel')
						 	)
	and etype_unit1_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='km')
	 and etype_unit2_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
);

insert into static.t_ref_config_emissions_type (
    scope,etype_id,etypeattr1_id,etypeattr2_id,etypeattr3_id,etypeattr4_id,etype_unit1_id,etype_unit2_id,date_added,added_by,date_modified,modified_by)
select
    1
     ,(select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_distance_travelled')
     ,(select list_id from static.t_ref_list where list_key='impactm_vehicle_category' and list_value='Commercial')
     ,(select list_id from static.t_ref_list where list_key='impactm_vehicle_type' and list_value='Heavy Duty Vehicle (>12 T)')
     ,(select list_id from static.t_ref_list where list_key='impactm_mobile_fueltype' and list_value='Diesel')
     ,null
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='km')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(select 1 from static.t_ref_config_emissions_type
 where
 etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_distance_travelled')
 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_vehicle_category' and list_value='Commercial')
 and etypeattr2_id=(select list_id from static.t_ref_list where list_key='impactm_vehicle_type' and list_value='Heavy Duty Vehicle (>12 T)')
 and etypeattr3_id=(select list_id from static.t_ref_list where list_key='impactm_mobile_fueltype' and list_value='Diesel')
 );

insert into static.t_ref_config_emissions_unit_factor
(config_emission_type_id,etype_unit1_id,etype_unit2_id,etype_unit1_factor,etype_unit2_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.t_ref_config_emissions_type WHERE
            scope='1'
                                                         and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_distance_travelled')
                                                         and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_vehicle_category' and list_value='Commercial')
                                                         and etypeattr2_id =(select list_id from static.t_ref_list where list_key='impactm_vehicle_type' and list_value='Heavy Duty Vehicle (>12 T)')
                                                         and etypeattr3_id =(select list_id from static.t_ref_list where list_key='impactm_mobile_fueltype' and list_value='Diesel')
    )
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='km')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,1.00
     ,0.001
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
	(SELECT 1 FROM static.t_ref_config_emissions_unit_factor WHERE
	 config_emission_type_id=(SELECT id FROM static.t_ref_config_emissions_type WHERE
							 scope='1'
							 and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_distance_travelled')
							 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_vehicle_category' and list_value='Commercial')
							 and etypeattr2_id =(select list_id from static.t_ref_list where list_key='impactm_vehicle_type' and list_value='Heavy Duty Vehicle (>12 T)')
							 and etypeattr3_id =(select list_id from static.t_ref_list where list_key='impactm_mobile_fueltype' and list_value='Diesel')
						 	)
	and etype_unit1_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='km')
	 and etype_unit2_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
);

insert into static.t_ref_config_emissions_type (
    scope,etype_id,etypeattr1_id,etypeattr2_id,etypeattr3_id,etypeattr4_id,etype_unit1_id,etype_unit2_id,date_added,added_by,date_modified,modified_by)
select
    1
     ,(select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_distance_travelled')
     ,(select list_id from static.t_ref_list where list_key='impactm_vehicle_category' and list_value='Commercial')
     ,(select list_id from static.t_ref_list where list_key='impactm_vehicle_type' and list_value='Truck >16T')
     ,(select list_id from static.t_ref_list where list_key='impactm_mobile_fueltype' and list_value='Diesel')
     ,null
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='km')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(select 1 from static.t_ref_config_emissions_type
 where
 etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_distance_travelled')
 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_vehicle_category' and list_value='Commercial')
 and etypeattr2_id=(select list_id from static.t_ref_list where list_key='impactm_vehicle_type' and list_value='Truck >16T')
 and etypeattr3_id=(select list_id from static.t_ref_list where list_key='impactm_mobile_fueltype' and list_value='Diesel')
 );

insert into static.t_ref_config_emissions_unit_factor
(config_emission_type_id,etype_unit1_id,etype_unit2_id,etype_unit1_factor,etype_unit2_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.t_ref_config_emissions_type WHERE
            scope='1'
                                                         and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_distance_travelled')
                                                         and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_vehicle_category' and list_value='Commercial')
                                                         and etypeattr2_id =(select list_id from static.t_ref_list where list_key='impactm_vehicle_type' and list_value='Truck >16T')
                                                         and etypeattr3_id =(select list_id from static.t_ref_list where list_key='impactm_mobile_fueltype' and list_value='Diesel')
    )
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='km')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,1.00
     ,0.001
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
	(SELECT 1 FROM static.t_ref_config_emissions_unit_factor WHERE
	 config_emission_type_id=(SELECT id FROM static.t_ref_config_emissions_type WHERE
							 scope='1'
							 and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_distance_travelled')
							 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_vehicle_category' and list_value='Commercial')
							 and etypeattr2_id =(select list_id from static.t_ref_list where list_key='impactm_vehicle_type' and list_value='Truck >16T')
							 and etypeattr3_id =(select list_id from static.t_ref_list where list_key='impactm_mobile_fueltype' and list_value='Diesel')
						 	)
	and etype_unit1_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='km')
	 and etype_unit2_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
);

insert into static.t_ref_config_emissions_type (
    scope,etype_id,etypeattr1_id,etypeattr2_id,etypeattr3_id,etypeattr4_id,etype_unit1_id,etype_unit2_id,date_added,added_by,date_modified,modified_by)
select
    1
     ,(select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_distance_travelled')
     ,(select list_id from static.t_ref_list where list_key='impactm_vehicle_category' and list_value='Commercial')
     ,(select list_id from static.t_ref_list where list_key='impactm_vehicle_type' and list_value='Bus')
     ,(select list_id from static.t_ref_list where list_key='impactm_mobile_fueltype' and list_value='Diesel')
     ,null
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='km')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(select 1 from static.t_ref_config_emissions_type
 where
 etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_distance_travelled')
 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_vehicle_category' and list_value='Commercial')
 and etypeattr2_id=(select list_id from static.t_ref_list where list_key='impactm_vehicle_type' and list_value='Bus')
 and etypeattr3_id=(select list_id from static.t_ref_list where list_key='impactm_mobile_fueltype' and list_value='Diesel')
 );

insert into static.t_ref_config_emissions_unit_factor
(config_emission_type_id,etype_unit1_id,etype_unit2_id,etype_unit1_factor,etype_unit2_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.t_ref_config_emissions_type WHERE
            scope='1'
                                                         and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_distance_travelled')
                                                         and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_vehicle_category' and list_value='Commercial')
                                                         and etypeattr2_id =(select list_id from static.t_ref_list where list_key='impactm_vehicle_type' and list_value='Bus')
                                                         and etypeattr3_id =(select list_id from static.t_ref_list where list_key='impactm_mobile_fueltype' and list_value='Diesel')
    )
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='km')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,1.00
     ,0.001
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
	(SELECT 1 FROM static.t_ref_config_emissions_unit_factor WHERE
	 config_emission_type_id=(SELECT id FROM static.t_ref_config_emissions_type WHERE
							 scope='1'
							 and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_distance_travelled')
							 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_vehicle_category' and list_value='Commercial')
							 and etypeattr2_id =(select list_id from static.t_ref_list where list_key='impactm_vehicle_type' and list_value='Bus')
							 and etypeattr3_id =(select list_id from static.t_ref_list where list_key='impactm_mobile_fueltype' and list_value='Diesel')
						 	)
	and etype_unit1_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='km')
	 and etype_unit2_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
);


-----------------
insert into static.t_ref_config_emissions_type (
    scope,etype_id,etypeattr1_id,etypeattr2_id,etypeattr3_id,etypeattr4_id,etype_unit1_id,etype_unit2_id,date_added,added_by,date_modified,modified_by)
select
    1
     ,(select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_distance_travelled')
     ,(select list_id from static.t_ref_list where list_key='impactm_vehicle_category' and list_value='Commercial')
     ,(select list_id from static.t_ref_list where list_key='impactm_vehicle_type' and list_value='Van/Omni')
     ,(select list_id from static.t_ref_list where list_key='impactm_mobile_fueltype' and list_value='Petrol')
     ,null
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='km')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(select 1 from static.t_ref_config_emissions_type
 where
 etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_distance_travelled')
 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_vehicle_category' and list_value='Commercial')
 and etypeattr2_id=(select list_id from static.t_ref_list where list_key='impactm_vehicle_type' and list_value='Van/Omni')
 and etypeattr3_id=(select list_id from static.t_ref_list where list_key='impactm_mobile_fueltype' and list_value='Petrol')
 );

insert into static.t_ref_config_emissions_unit_factor
(config_emission_type_id,etype_unit1_id,etype_unit2_id,etype_unit1_factor,etype_unit2_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.t_ref_config_emissions_type WHERE
            scope='1'
                                                         and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_distance_travelled')
                                                         and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_vehicle_category' and list_value='Commercial')
                                                         and etypeattr2_id =(select list_id from static.t_ref_list where list_key='impactm_vehicle_type' and list_value='Van/Omni')
                                                         and etypeattr3_id =(select list_id from static.t_ref_list where list_key='impactm_mobile_fueltype' and list_value='Petrol')
    )
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='km')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,1.00
     ,0.001
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
	(SELECT 1 FROM static.t_ref_config_emissions_unit_factor WHERE
	 config_emission_type_id=(SELECT id FROM static.t_ref_config_emissions_type WHERE
							 scope='1'
							 and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_distance_travelled')
							 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_vehicle_category' and list_value='Commercial')
							 and etypeattr2_id =(select list_id from static.t_ref_list where list_key='impactm_vehicle_type' and list_value='Van/Omni')
							 and etypeattr3_id =(select list_id from static.t_ref_list where list_key='impactm_mobile_fueltype' and list_value='Petrol')
						 	)
	and etype_unit1_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='km')
	 and etype_unit2_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
);


insert into static.t_ref_config_emissions_type (
    scope,etype_id,etypeattr1_id,etypeattr2_id,etypeattr3_id,etypeattr4_id,etype_unit1_id,etype_unit2_id,date_added,added_by,date_modified,modified_by)
select
    2
     ,(select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope2_grid_emission')
     ,(select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope2_grid_emission')
     ,null
     ,null
     ,null
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kWh')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(select 1 from static.t_ref_config_emissions_type
 where
 etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope2_grid_emission')
 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope2_grid_emission')
 );

insert into static.t_ref_config_emissions_unit_factor
(config_emission_type_id,etype_unit1_id,etype_unit2_id,etype_unit1_factor,etype_unit2_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.t_ref_config_emissions_type WHERE
            scope='2'
                                                         and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope2_grid_emission')
                                                         and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope2_grid_emission')
    )
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kWh')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,1.00
     ,0.001
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
	(SELECT 1 FROM static.t_ref_config_emissions_unit_factor WHERE
	 config_emission_type_id=(SELECT id FROM static.t_ref_config_emissions_type WHERE
							 scope='2'
							 and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope2_grid_emission')
							 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope2_grid_emission')
						 	)
	and etype_unit1_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kWh')
	 and etype_unit2_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
);


insert into static.t_ref_config_emissions_unit_factor
(config_emission_type_id,etype_unit1_id,etype_unit2_id,etype_unit1_factor,etype_unit2_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.t_ref_config_emissions_type WHERE
            scope='2'
                                                         and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope2_grid_emission')
                                                         and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope2_grid_emission')
    )
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='MWh')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,1000
     ,0.001
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
	(SELECT 1 FROM static.t_ref_config_emissions_unit_factor WHERE
	 config_emission_type_id=(SELECT id FROM static.t_ref_config_emissions_type WHERE
							 scope='2'
							 and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope2_grid_emission')
							 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope2_grid_emission')
						 	)
	and etype_unit1_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='MWh')
	 and etype_unit2_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
);




insert into static.t_ref_config_emissions_type (
    scope,etype_id,etypeattr1_id,etype_unit1_id,etype_unit2_id,date_added,added_by,date_modified,modified_by)
select
    1
     ,(select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
     ,(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='Carbon dioxide')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(select 1 from static.t_ref_config_emissions_type
 where
 etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='Carbon dioxide')
 );

insert into static.t_ref_config_emissions_unit_factor
(config_emission_type_id,etype_unit1_id,etype_unit2_id,etype_unit1_factor,etype_unit2_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.t_ref_config_emissions_type WHERE
            scope='1'
                                                         and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
                                                         and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='Carbon dioxide')
    )
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,1.00
     ,0.001
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_unit_factor WHERE
config_emission_type_id =(SELECT id FROM static.t_ref_config_emissions_type WHERE
scope='1'
and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='Carbon dioxide')
)
and etype_unit1_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
and etype_unit2_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
);
insert into static.t_ref_config_emissions_type (
    scope,etype_id,etypeattr1_id,etype_unit1_id,etype_unit2_id,date_added,added_by,date_modified,modified_by)
select
    1
     ,(select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
     ,(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='Methane')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(select 1 from static.t_ref_config_emissions_type
 where
 etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='Methane')
 );

insert into static.t_ref_config_emissions_unit_factor
(config_emission_type_id,etype_unit1_id,etype_unit2_id,etype_unit1_factor,etype_unit2_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.t_ref_config_emissions_type WHERE
            scope='1'
                                                         and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
                                                         and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='Methane')
    )
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,1.00
     ,0.001
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_unit_factor WHERE
config_emission_type_id =(SELECT id FROM static.t_ref_config_emissions_type WHERE
scope='1'
and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='Methane')
)
and etype_unit1_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
and etype_unit2_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
);
insert into static.t_ref_config_emissions_type (
    scope,etype_id,etypeattr1_id,etype_unit1_id,etype_unit2_id,date_added,added_by,date_modified,modified_by)
select
    1
     ,(select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
     ,(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='Nitrous oxide')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(select 1 from static.t_ref_config_emissions_type
 where
 etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='Nitrous oxide')
 );

insert into static.t_ref_config_emissions_unit_factor
(config_emission_type_id,etype_unit1_id,etype_unit2_id,etype_unit1_factor,etype_unit2_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.t_ref_config_emissions_type WHERE
            scope='1'
                                                         and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
                                                         and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='Nitrous oxide')
    )
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,1.00
     ,0.001
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_unit_factor WHERE
config_emission_type_id =(SELECT id FROM static.t_ref_config_emissions_type WHERE
scope='1'
and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='Nitrous oxide')
)
and etype_unit1_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
and etype_unit2_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
);
insert into static.t_ref_config_emissions_type (
    scope,etype_id,etypeattr1_id,etype_unit1_id,etype_unit2_id,date_added,added_by,date_modified,modified_by)
select
    1
     ,(select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
     ,(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='HFC-23')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(select 1 from static.t_ref_config_emissions_type
 where
 etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='HFC-23')
 );

insert into static.t_ref_config_emissions_unit_factor
(config_emission_type_id,etype_unit1_id,etype_unit2_id,etype_unit1_factor,etype_unit2_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.t_ref_config_emissions_type WHERE
            scope='1'
                                                         and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
                                                         and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='HFC-23')
    )
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,1.00
     ,0.001
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_unit_factor WHERE
config_emission_type_id =(SELECT id FROM static.t_ref_config_emissions_type WHERE
scope='1'
and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='HFC-23')
)
and etype_unit1_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
and etype_unit2_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
);
insert into static.t_ref_config_emissions_type (
    scope,etype_id,etypeattr1_id,etype_unit1_id,etype_unit2_id,date_added,added_by,date_modified,modified_by)
select
    1
     ,(select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
     ,(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='HFC-32')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(select 1 from static.t_ref_config_emissions_type
 where
 etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='HFC-32')
 );

insert into static.t_ref_config_emissions_unit_factor
(config_emission_type_id,etype_unit1_id,etype_unit2_id,etype_unit1_factor,etype_unit2_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.t_ref_config_emissions_type WHERE
            scope='1'
                                                         and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
                                                         and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='HFC-32')
    )
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,1.00
     ,0.001
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_unit_factor WHERE
config_emission_type_id =(SELECT id FROM static.t_ref_config_emissions_type WHERE
scope='1'
and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='HFC-32')
)
and etype_unit1_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
and etype_unit2_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
);
insert into static.t_ref_config_emissions_type (
    scope,etype_id,etypeattr1_id,etype_unit1_id,etype_unit2_id,date_added,added_by,date_modified,modified_by)
select
    1
     ,(select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
     ,(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='HFC-41')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(select 1 from static.t_ref_config_emissions_type
 where
 etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='HFC-41')
 );

insert into static.t_ref_config_emissions_unit_factor
(config_emission_type_id,etype_unit1_id,etype_unit2_id,etype_unit1_factor,etype_unit2_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.t_ref_config_emissions_type WHERE
            scope='1'
                                                         and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
                                                         and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='HFC-41')
    )
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,1.00
     ,0.001
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_unit_factor WHERE
config_emission_type_id =(SELECT id FROM static.t_ref_config_emissions_type WHERE
scope='1'
and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='HFC-41')
)
and etype_unit1_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
and etype_unit2_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
);
insert into static.t_ref_config_emissions_type (
    scope,etype_id,etypeattr1_id,etype_unit1_id,etype_unit2_id,date_added,added_by,date_modified,modified_by)
select
    1
     ,(select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
     ,(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='HFC-125')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(select 1 from static.t_ref_config_emissions_type
 where
 etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='HFC-125')
 );

insert into static.t_ref_config_emissions_unit_factor
(config_emission_type_id,etype_unit1_id,etype_unit2_id,etype_unit1_factor,etype_unit2_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.t_ref_config_emissions_type WHERE
            scope='1'
                                                         and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
                                                         and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='HFC-125')
    )
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,1.00
     ,0.001
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_unit_factor WHERE
config_emission_type_id =(SELECT id FROM static.t_ref_config_emissions_type WHERE
scope='1'
and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='HFC-125')
)
and etype_unit1_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
and etype_unit2_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
);
insert into static.t_ref_config_emissions_type (
    scope,etype_id,etypeattr1_id,etype_unit1_id,etype_unit2_id,date_added,added_by,date_modified,modified_by)
select
    1
     ,(select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
     ,(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='HFC-134')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(select 1 from static.t_ref_config_emissions_type
 where
 etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='HFC-134')
 );

insert into static.t_ref_config_emissions_unit_factor
(config_emission_type_id,etype_unit1_id,etype_unit2_id,etype_unit1_factor,etype_unit2_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.t_ref_config_emissions_type WHERE
            scope='1'
                                                         and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
                                                         and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='HFC-134')
    )
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,1.00
     ,0.001
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_unit_factor WHERE
config_emission_type_id =(SELECT id FROM static.t_ref_config_emissions_type WHERE
scope='1'
and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='HFC-134')
)
and etype_unit1_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
and etype_unit2_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
);
insert into static.t_ref_config_emissions_type (
    scope,etype_id,etypeattr1_id,etype_unit1_id,etype_unit2_id,date_added,added_by,date_modified,modified_by)
select
    1
     ,(select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
     ,(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='HFC-134a')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(select 1 from static.t_ref_config_emissions_type
 where
 etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='HFC-134a')
 );

insert into static.t_ref_config_emissions_unit_factor
(config_emission_type_id,etype_unit1_id,etype_unit2_id,etype_unit1_factor,etype_unit2_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.t_ref_config_emissions_type WHERE
            scope='1'
                                                         and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
                                                         and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='HFC-134a')
    )
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,1.00
     ,0.001
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_unit_factor WHERE
config_emission_type_id =(SELECT id FROM static.t_ref_config_emissions_type WHERE
scope='1'
and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='HFC-134a')
)
and etype_unit1_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
and etype_unit2_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
);
insert into static.t_ref_config_emissions_type (
    scope,etype_id,etypeattr1_id,etype_unit1_id,etype_unit2_id,date_added,added_by,date_modified,modified_by)
select
    1
     ,(select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
     ,(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='HFC-143')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(select 1 from static.t_ref_config_emissions_type
 where
 etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='HFC-143')
 );

insert into static.t_ref_config_emissions_unit_factor
(config_emission_type_id,etype_unit1_id,etype_unit2_id,etype_unit1_factor,etype_unit2_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.t_ref_config_emissions_type WHERE
            scope='1'
                                                         and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
                                                         and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='HFC-143')
    )
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,1.00
     ,0.001
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_unit_factor WHERE
config_emission_type_id =(SELECT id FROM static.t_ref_config_emissions_type WHERE
scope='1'
and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='HFC-143')
)
and etype_unit1_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
and etype_unit2_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
);
insert into static.t_ref_config_emissions_type (
    scope,etype_id,etypeattr1_id,etype_unit1_id,etype_unit2_id,date_added,added_by,date_modified,modified_by)
select
    1
     ,(select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
     ,(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='HFC-143a')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(select 1 from static.t_ref_config_emissions_type
 where
 etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='HFC-143a')
 );

insert into static.t_ref_config_emissions_unit_factor
(config_emission_type_id,etype_unit1_id,etype_unit2_id,etype_unit1_factor,etype_unit2_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.t_ref_config_emissions_type WHERE
            scope='1'
                                                         and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
                                                         and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='HFC-143a')
    )
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,1.00
     ,0.001
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_unit_factor WHERE
config_emission_type_id =(SELECT id FROM static.t_ref_config_emissions_type WHERE
scope='1'
and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='HFC-143a')
)
and etype_unit1_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
and etype_unit2_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
);
insert into static.t_ref_config_emissions_type (
    scope,etype_id,etypeattr1_id,etype_unit1_id,etype_unit2_id,date_added,added_by,date_modified,modified_by)
select
    1
     ,(select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
     ,(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='HFC-152a')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(select 1 from static.t_ref_config_emissions_type
 where
 etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='HFC-152a')
 );

insert into static.t_ref_config_emissions_unit_factor
(config_emission_type_id,etype_unit1_id,etype_unit2_id,etype_unit1_factor,etype_unit2_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.t_ref_config_emissions_type WHERE
            scope='1'
                                                         and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
                                                         and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='HFC-152a')
    )
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,1.00
     ,0.001
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_unit_factor WHERE
config_emission_type_id =(SELECT id FROM static.t_ref_config_emissions_type WHERE
scope='1'
and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='HFC-152a')
)
and etype_unit1_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
and etype_unit2_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
);
insert into static.t_ref_config_emissions_type (
    scope,etype_id,etypeattr1_id,etype_unit1_id,etype_unit2_id,date_added,added_by,date_modified,modified_by)
select
    1
     ,(select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
     ,(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='HFC-227ea')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(select 1 from static.t_ref_config_emissions_type
 where
 etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='HFC-227ea')
 );

insert into static.t_ref_config_emissions_unit_factor
(config_emission_type_id,etype_unit1_id,etype_unit2_id,etype_unit1_factor,etype_unit2_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.t_ref_config_emissions_type WHERE
            scope='1'
                                                         and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
                                                         and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='HFC-227ea')
    )
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,1.00
     ,0.001
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_unit_factor WHERE
config_emission_type_id =(SELECT id FROM static.t_ref_config_emissions_type WHERE
scope='1'
and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='HFC-227ea')
)
and etype_unit1_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
and etype_unit2_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
);
insert into static.t_ref_config_emissions_type (
    scope,etype_id,etypeattr1_id,etype_unit1_id,etype_unit2_id,date_added,added_by,date_modified,modified_by)
select
    1
     ,(select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
     ,(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='HFC-236fa')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(select 1 from static.t_ref_config_emissions_type
 where
 etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='HFC-236fa')
 );

insert into static.t_ref_config_emissions_unit_factor
(config_emission_type_id,etype_unit1_id,etype_unit2_id,etype_unit1_factor,etype_unit2_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.t_ref_config_emissions_type WHERE
            scope='1'
                                                         and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
                                                         and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='HFC-236fa')
    )
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,1.00
     ,0.001
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_unit_factor WHERE
config_emission_type_id =(SELECT id FROM static.t_ref_config_emissions_type WHERE
scope='1'
and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='HFC-236fa')
)
and etype_unit1_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
and etype_unit2_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
);
insert into static.t_ref_config_emissions_type (
    scope,etype_id,etypeattr1_id,etype_unit1_id,etype_unit2_id,date_added,added_by,date_modified,modified_by)
select
    1
     ,(select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
     ,(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='HFC-245fa')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(select 1 from static.t_ref_config_emissions_type
 where
 etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='HFC-245fa')
 );

insert into static.t_ref_config_emissions_unit_factor
(config_emission_type_id,etype_unit1_id,etype_unit2_id,etype_unit1_factor,etype_unit2_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.t_ref_config_emissions_type WHERE
            scope='1'
                                                         and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
                                                         and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='HFC-245fa')
    )
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,1.00
     ,0.001
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_unit_factor WHERE
config_emission_type_id =(SELECT id FROM static.t_ref_config_emissions_type WHERE
scope='1'
and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='HFC-245fa')
)
and etype_unit1_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
and etype_unit2_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
);
insert into static.t_ref_config_emissions_type (
    scope,etype_id,etypeattr1_id,etype_unit1_id,etype_unit2_id,date_added,added_by,date_modified,modified_by)
select
    1
     ,(select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
     ,(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='HFC-43-I0mee')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(select 1 from static.t_ref_config_emissions_type
 where
 etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='HFC-43-I0mee')
 );

insert into static.t_ref_config_emissions_unit_factor
(config_emission_type_id,etype_unit1_id,etype_unit2_id,etype_unit1_factor,etype_unit2_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.t_ref_config_emissions_type WHERE
            scope='1'
                                                         and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
                                                         and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='HFC-43-I0mee')
    )
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,1.00
     ,0.001
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_unit_factor WHERE
config_emission_type_id =(SELECT id FROM static.t_ref_config_emissions_type WHERE
scope='1'
and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='HFC-43-I0mee')
)
and etype_unit1_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
and etype_unit2_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
);
insert into static.t_ref_config_emissions_type (
    scope,etype_id,etypeattr1_id,etype_unit1_id,etype_unit2_id,date_added,added_by,date_modified,modified_by)
select
    1
     ,(select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
     ,(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='Perfluoromethane (PFC-14)')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(select 1 from static.t_ref_config_emissions_type
 where
 etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='Perfluoromethane (PFC-14)')
 );

insert into static.t_ref_config_emissions_unit_factor
(config_emission_type_id,etype_unit1_id,etype_unit2_id,etype_unit1_factor,etype_unit2_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.t_ref_config_emissions_type WHERE
            scope='1'
                                                         and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
                                                         and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='Perfluoromethane (PFC-14)')
    )
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,1.00
     ,0.001
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_unit_factor WHERE
config_emission_type_id =(SELECT id FROM static.t_ref_config_emissions_type WHERE
scope='1'
and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='Perfluoromethane (PFC-14)')
)
and etype_unit1_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
and etype_unit2_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
);
insert into static.t_ref_config_emissions_type (
    scope,etype_id,etypeattr1_id,etype_unit1_id,etype_unit2_id,date_added,added_by,date_modified,modified_by)
select
    1
     ,(select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
     ,(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='Perfluoroethane (PFC-116)')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(select 1 from static.t_ref_config_emissions_type
 where
 etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='Perfluoroethane (PFC-116)')
 );

insert into static.t_ref_config_emissions_unit_factor
(config_emission_type_id,etype_unit1_id,etype_unit2_id,etype_unit1_factor,etype_unit2_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.t_ref_config_emissions_type WHERE
            scope='1'
                                                         and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
                                                         and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='Perfluoroethane (PFC-116)')
    )
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,1.00
     ,0.001
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_unit_factor WHERE
config_emission_type_id =(SELECT id FROM static.t_ref_config_emissions_type WHERE
scope='1'
and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='Perfluoroethane (PFC-116)')
)
and etype_unit1_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
and etype_unit2_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
);
insert into static.t_ref_config_emissions_type (
    scope,etype_id,etypeattr1_id,etype_unit1_id,etype_unit2_id,date_added,added_by,date_modified,modified_by)
select
    1
     ,(select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
     ,(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='Perfluoropropane (PFC-218)')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(select 1 from static.t_ref_config_emissions_type
 where
 etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='Perfluoropropane (PFC-218)')
 );

insert into static.t_ref_config_emissions_unit_factor
(config_emission_type_id,etype_unit1_id,etype_unit2_id,etype_unit1_factor,etype_unit2_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.t_ref_config_emissions_type WHERE
            scope='1'
                                                         and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
                                                         and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='Perfluoropropane (PFC-218)')
    )
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,1.00
     ,0.001
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_unit_factor WHERE
config_emission_type_id =(SELECT id FROM static.t_ref_config_emissions_type WHERE
scope='1'
and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='Perfluoropropane (PFC-218)')
)
and etype_unit1_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
and etype_unit2_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
);
insert into static.t_ref_config_emissions_type (
    scope,etype_id,etypeattr1_id,etype_unit1_id,etype_unit2_id,date_added,added_by,date_modified,modified_by)
select
    1
     ,(select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
     ,(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='Perfluorocyclobutane (PFC-318)')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(select 1 from static.t_ref_config_emissions_type
 where
 etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='Perfluorocyclobutane (PFC-318)')
 );

insert into static.t_ref_config_emissions_unit_factor
(config_emission_type_id,etype_unit1_id,etype_unit2_id,etype_unit1_factor,etype_unit2_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.t_ref_config_emissions_type WHERE
            scope='1'
                                                         and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
                                                         and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='Perfluorocyclobutane (PFC-318)')
    )
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,1.00
     ,0.001
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_unit_factor WHERE
config_emission_type_id =(SELECT id FROM static.t_ref_config_emissions_type WHERE
scope='1'
and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='Perfluorocyclobutane (PFC-318)')
)
and etype_unit1_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
and etype_unit2_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
);
insert into static.t_ref_config_emissions_type (
    scope,etype_id,etypeattr1_id,etype_unit1_id,etype_unit2_id,date_added,added_by,date_modified,modified_by)
select
    1
     ,(select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
     ,(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='Perfluorobutane (PFC-3-1-10)')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(select 1 from static.t_ref_config_emissions_type
 where
 etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='Perfluorobutane (PFC-3-1-10)')
 );

insert into static.t_ref_config_emissions_unit_factor
(config_emission_type_id,etype_unit1_id,etype_unit2_id,etype_unit1_factor,etype_unit2_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.t_ref_config_emissions_type WHERE
            scope='1'
                                                         and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
                                                         and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='Perfluorobutane (PFC-3-1-10)')
    )
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,1.00
     ,0.001
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_unit_factor WHERE
config_emission_type_id =(SELECT id FROM static.t_ref_config_emissions_type WHERE
scope='1'
and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='Perfluorobutane (PFC-3-1-10)')
)
and etype_unit1_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
and etype_unit2_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
);
insert into static.t_ref_config_emissions_type (
    scope,etype_id,etypeattr1_id,etype_unit1_id,etype_unit2_id,date_added,added_by,date_modified,modified_by)
select
    1
     ,(select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
     ,(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='Perfluoropentane (PFC-4-1-12)')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(select 1 from static.t_ref_config_emissions_type
 where
 etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='Perfluoropentane (PFC-4-1-12)')
 );

insert into static.t_ref_config_emissions_unit_factor
(config_emission_type_id,etype_unit1_id,etype_unit2_id,etype_unit1_factor,etype_unit2_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.t_ref_config_emissions_type WHERE
            scope='1'
                                                         and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
                                                         and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='Perfluoropentane (PFC-4-1-12)')
    )
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,1.00
     ,0.001
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_unit_factor WHERE
config_emission_type_id =(SELECT id FROM static.t_ref_config_emissions_type WHERE
scope='1'
and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='Perfluoropentane (PFC-4-1-12)')
)
and etype_unit1_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
and etype_unit2_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
);
insert into static.t_ref_config_emissions_type (
    scope,etype_id,etypeattr1_id,etype_unit1_id,etype_unit2_id,date_added,added_by,date_modified,modified_by)
select
    1
     ,(select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
     ,(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='Perfluorohexane (PFC-5-1-14)')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(select 1 from static.t_ref_config_emissions_type
 where
 etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='Perfluorohexane (PFC-5-1-14)')
 );

insert into static.t_ref_config_emissions_unit_factor
(config_emission_type_id,etype_unit1_id,etype_unit2_id,etype_unit1_factor,etype_unit2_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.t_ref_config_emissions_type WHERE
            scope='1'
                                                         and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
                                                         and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='Perfluorohexane (PFC-5-1-14)')
    )
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,1.00
     ,0.001
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_unit_factor WHERE
config_emission_type_id =(SELECT id FROM static.t_ref_config_emissions_type WHERE
scope='1'
and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='Perfluorohexane (PFC-5-1-14)')
)
and etype_unit1_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
and etype_unit2_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
);
insert into static.t_ref_config_emissions_type (
    scope,etype_id,etypeattr1_id,etype_unit1_id,etype_unit2_id,date_added,added_by,date_modified,modified_by)
select
    1
     ,(select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
     ,(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='Sulphur hexafluoride (SF6)')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(select 1 from static.t_ref_config_emissions_type
 where
 etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='Sulphur hexafluoride (SF6)')
 );

insert into static.t_ref_config_emissions_unit_factor
(config_emission_type_id,etype_unit1_id,etype_unit2_id,etype_unit1_factor,etype_unit2_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.t_ref_config_emissions_type WHERE
            scope='1'
                                                         and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
                                                         and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='Sulphur hexafluoride (SF6)')
    )
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,1.00
     ,0.001
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_unit_factor WHERE
config_emission_type_id =(SELECT id FROM static.t_ref_config_emissions_type WHERE
scope='1'
and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='Sulphur hexafluoride (SF6)')
)
and etype_unit1_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
and etype_unit2_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
);
insert into static.t_ref_config_emissions_type (
    scope,etype_id,etypeattr1_id,etype_unit1_id,etype_unit2_id,date_added,added_by,date_modified,modified_by)
select
    1
     ,(select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
     ,(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='HFC-152')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(select 1 from static.t_ref_config_emissions_type
 where
 etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='HFC-152')
 );

insert into static.t_ref_config_emissions_unit_factor
(config_emission_type_id,etype_unit1_id,etype_unit2_id,etype_unit1_factor,etype_unit2_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.t_ref_config_emissions_type WHERE
            scope='1'
                                                         and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
                                                         and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='HFC-152')
    )
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,1.00
     ,0.001
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_unit_factor WHERE
config_emission_type_id =(SELECT id FROM static.t_ref_config_emissions_type WHERE
scope='1'
and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='HFC-152')
)
and etype_unit1_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
and etype_unit2_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
);
insert into static.t_ref_config_emissions_type (
    scope,etype_id,etypeattr1_id,etype_unit1_id,etype_unit2_id,date_added,added_by,date_modified,modified_by)
select
    1
     ,(select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
     ,(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='HFC-161')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(select 1 from static.t_ref_config_emissions_type
 where
 etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='HFC-161')
 );

insert into static.t_ref_config_emissions_unit_factor
(config_emission_type_id,etype_unit1_id,etype_unit2_id,etype_unit1_factor,etype_unit2_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.t_ref_config_emissions_type WHERE
            scope='1'
                                                         and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
                                                         and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='HFC-161')
    )
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,1.00
     ,0.001
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_unit_factor WHERE
config_emission_type_id =(SELECT id FROM static.t_ref_config_emissions_type WHERE
scope='1'
and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='HFC-161')
)
and etype_unit1_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
and etype_unit2_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
);
insert into static.t_ref_config_emissions_type (
    scope,etype_id,etypeattr1_id,etype_unit1_id,etype_unit2_id,date_added,added_by,date_modified,modified_by)
select
    1
     ,(select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
     ,(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='HFC-236cb')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(select 1 from static.t_ref_config_emissions_type
 where
 etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='HFC-236cb')
 );

insert into static.t_ref_config_emissions_unit_factor
(config_emission_type_id,etype_unit1_id,etype_unit2_id,etype_unit1_factor,etype_unit2_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.t_ref_config_emissions_type WHERE
            scope='1'
                                                         and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
                                                         and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='HFC-236cb')
    )
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,1.00
     ,0.001
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_unit_factor WHERE
config_emission_type_id =(SELECT id FROM static.t_ref_config_emissions_type WHERE
scope='1'
and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='HFC-236cb')
)
and etype_unit1_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
and etype_unit2_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
);
insert into static.t_ref_config_emissions_type (
    scope,etype_id,etypeattr1_id,etype_unit1_id,etype_unit2_id,date_added,added_by,date_modified,modified_by)
select
    1
     ,(select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
     ,(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='HFC-236ea')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(select 1 from static.t_ref_config_emissions_type
 where
 etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='HFC-236ea')
 );

insert into static.t_ref_config_emissions_unit_factor
(config_emission_type_id,etype_unit1_id,etype_unit2_id,etype_unit1_factor,etype_unit2_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.t_ref_config_emissions_type WHERE
            scope='1'
                                                         and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
                                                         and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='HFC-236ea')
    )
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,1.00
     ,0.001
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_unit_factor WHERE
config_emission_type_id =(SELECT id FROM static.t_ref_config_emissions_type WHERE
scope='1'
and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='HFC-236ea')
)
and etype_unit1_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
and etype_unit2_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
);
insert into static.t_ref_config_emissions_type (
    scope,etype_id,etypeattr1_id,etype_unit1_id,etype_unit2_id,date_added,added_by,date_modified,modified_by)
select
    1
     ,(select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
     ,(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='HFC-245ca')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(select 1 from static.t_ref_config_emissions_type
 where
 etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='HFC-245ca')
 );

insert into static.t_ref_config_emissions_unit_factor
(config_emission_type_id,etype_unit1_id,etype_unit2_id,etype_unit1_factor,etype_unit2_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.t_ref_config_emissions_type WHERE
            scope='1'
                                                         and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
                                                         and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='HFC-245ca')
    )
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,1.00
     ,0.001
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_unit_factor WHERE
config_emission_type_id =(SELECT id FROM static.t_ref_config_emissions_type WHERE
scope='1'
and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='HFC-245ca')
)
and etype_unit1_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
and etype_unit2_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
);
insert into static.t_ref_config_emissions_type (
    scope,etype_id,etypeattr1_id,etype_unit1_id,etype_unit2_id,date_added,added_by,date_modified,modified_by)
select
    1
     ,(select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
     ,(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='HFC-365mfc')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(select 1 from static.t_ref_config_emissions_type
 where
 etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='HFC-365mfc')
 );

insert into static.t_ref_config_emissions_unit_factor
(config_emission_type_id,etype_unit1_id,etype_unit2_id,etype_unit1_factor,etype_unit2_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.t_ref_config_emissions_type WHERE
            scope='1'
                                                         and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
                                                         and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='HFC-365mfc')
    )
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,1.00
     ,0.001
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_unit_factor WHERE
config_emission_type_id =(SELECT id FROM static.t_ref_config_emissions_type WHERE
scope='1'
and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='HFC-365mfc')
)
and etype_unit1_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
and etype_unit2_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
);
insert into static.t_ref_config_emissions_type (
    scope,etype_id,etypeattr1_id,etype_unit1_id,etype_unit2_id,date_added,added_by,date_modified,modified_by)
select
    1
     ,(select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
     ,(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='HFC-23 (R-23)')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(select 1 from static.t_ref_config_emissions_type
 where
 etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='HFC-23 (R-23)')
 );

insert into static.t_ref_config_emissions_unit_factor
(config_emission_type_id,etype_unit1_id,etype_unit2_id,etype_unit1_factor,etype_unit2_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.t_ref_config_emissions_type WHERE
            scope='1'
                                                         and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
                                                         and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='HFC-23 (R-23)')
    )
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,1.00
     ,0.001
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_unit_factor WHERE
config_emission_type_id =(SELECT id FROM static.t_ref_config_emissions_type WHERE
scope='1'
and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='HFC-23 (R-23)')
)
and etype_unit1_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
and etype_unit2_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
);
insert into static.t_ref_config_emissions_type (
    scope,etype_id,etypeattr1_id,etype_unit1_id,etype_unit2_id,date_added,added_by,date_modified,modified_by)
select
    1
     ,(select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
     ,(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='HFC-32 (R-32)')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(select 1 from static.t_ref_config_emissions_type
 where
 etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='HFC-32 (R-32)')
 );

insert into static.t_ref_config_emissions_unit_factor
(config_emission_type_id,etype_unit1_id,etype_unit2_id,etype_unit1_factor,etype_unit2_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.t_ref_config_emissions_type WHERE
            scope='1'
                                                         and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
                                                         and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='HFC-32 (R-32)')
    )
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,1.00
     ,0.001
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_unit_factor WHERE
config_emission_type_id =(SELECT id FROM static.t_ref_config_emissions_type WHERE
scope='1'
and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='HFC-32 (R-32)')
)
and etype_unit1_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
and etype_unit2_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
);
insert into static.t_ref_config_emissions_type (
    scope,etype_id,etypeattr1_id,etype_unit1_id,etype_unit2_id,date_added,added_by,date_modified,modified_by)
select
    1
     ,(select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
     ,(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='HFC-41 (R-41)')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(select 1 from static.t_ref_config_emissions_type
 where
 etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='HFC-41 (R-41)')
 );

insert into static.t_ref_config_emissions_unit_factor
(config_emission_type_id,etype_unit1_id,etype_unit2_id,etype_unit1_factor,etype_unit2_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.t_ref_config_emissions_type WHERE
            scope='1'
                                                         and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
                                                         and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='HFC-41 (R-41)')
    )
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,1.00
     ,0.001
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_unit_factor WHERE
config_emission_type_id =(SELECT id FROM static.t_ref_config_emissions_type WHERE
scope='1'
and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='HFC-41 (R-41)')
)
and etype_unit1_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
and etype_unit2_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
);
insert into static.t_ref_config_emissions_type (
    scope,etype_id,etypeattr1_id,etype_unit1_id,etype_unit2_id,date_added,added_by,date_modified,modified_by)
select
    1
     ,(select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
     ,(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='HFC-125 (R-125)')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(select 1 from static.t_ref_config_emissions_type
 where
 etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='HFC-125 (R-125)')
 );

insert into static.t_ref_config_emissions_unit_factor
(config_emission_type_id,etype_unit1_id,etype_unit2_id,etype_unit1_factor,etype_unit2_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.t_ref_config_emissions_type WHERE
            scope='1'
                                                         and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
                                                         and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='HFC-125 (R-125)')
    )
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,1.00
     ,0.001
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_unit_factor WHERE
config_emission_type_id =(SELECT id FROM static.t_ref_config_emissions_type WHERE
scope='1'
and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='HFC-125 (R-125)')
)
and etype_unit1_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
and etype_unit2_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
);
insert into static.t_ref_config_emissions_type (
    scope,etype_id,etypeattr1_id,etype_unit1_id,etype_unit2_id,date_added,added_by,date_modified,modified_by)
select
    1
     ,(select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
     ,(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='HFC-134 (R-134)')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(select 1 from static.t_ref_config_emissions_type
 where
 etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='HFC-134 (R-134)')
 );

insert into static.t_ref_config_emissions_unit_factor
(config_emission_type_id,etype_unit1_id,etype_unit2_id,etype_unit1_factor,etype_unit2_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.t_ref_config_emissions_type WHERE
            scope='1'
                                                         and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
                                                         and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='HFC-134 (R-134)')
    )
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,1.00
     ,0.001
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_unit_factor WHERE
config_emission_type_id =(SELECT id FROM static.t_ref_config_emissions_type WHERE
scope='1'
and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='HFC-134 (R-134)')
)
and etype_unit1_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
and etype_unit2_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
);
insert into static.t_ref_config_emissions_type (
    scope,etype_id,etypeattr1_id,etype_unit1_id,etype_unit2_id,date_added,added_by,date_modified,modified_by)
select
    1
     ,(select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
     ,(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='HFC-134a (R-134a)')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(select 1 from static.t_ref_config_emissions_type
 where
 etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='HFC-134a (R-134a)')
 );

insert into static.t_ref_config_emissions_unit_factor
(config_emission_type_id,etype_unit1_id,etype_unit2_id,etype_unit1_factor,etype_unit2_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.t_ref_config_emissions_type WHERE
            scope='1'
                                                         and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
                                                         and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='HFC-134a (R-134a)')
    )
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,1.00
     ,0.001
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_unit_factor WHERE
config_emission_type_id =(SELECT id FROM static.t_ref_config_emissions_type WHERE
scope='1'
and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='HFC-134a (R-134a)')
)
and etype_unit1_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
and etype_unit2_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
);
insert into static.t_ref_config_emissions_type (
    scope,etype_id,etypeattr1_id,etype_unit1_id,etype_unit2_id,date_added,added_by,date_modified,modified_by)
select
    1
     ,(select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
     ,(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='HFC-143 (R-143)')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(select 1 from static.t_ref_config_emissions_type
 where
 etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='HFC-143 (R-143)')
 );

insert into static.t_ref_config_emissions_unit_factor
(config_emission_type_id,etype_unit1_id,etype_unit2_id,etype_unit1_factor,etype_unit2_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.t_ref_config_emissions_type WHERE
            scope='1'
                                                         and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
                                                         and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='HFC-143 (R-143)')
    )
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,1.00
     ,0.001
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_unit_factor WHERE
config_emission_type_id =(SELECT id FROM static.t_ref_config_emissions_type WHERE
scope='1'
and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='HFC-143 (R-143)')
)
and etype_unit1_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
and etype_unit2_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
);
insert into static.t_ref_config_emissions_type (
    scope,etype_id,etypeattr1_id,etype_unit1_id,etype_unit2_id,date_added,added_by,date_modified,modified_by)
select
    1
     ,(select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
     ,(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='HFC-143a (R-143a)')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(select 1 from static.t_ref_config_emissions_type
 where
 etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='HFC-143a (R-143a)')
 );

insert into static.t_ref_config_emissions_unit_factor
(config_emission_type_id,etype_unit1_id,etype_unit2_id,etype_unit1_factor,etype_unit2_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.t_ref_config_emissions_type WHERE
            scope='1'
                                                         and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
                                                         and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='HFC-143a (R-143a)')
    )
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,1.00
     ,0.001
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_unit_factor WHERE
config_emission_type_id =(SELECT id FROM static.t_ref_config_emissions_type WHERE
scope='1'
and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='HFC-143a (R-143a)')
)
and etype_unit1_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
and etype_unit2_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
);
insert into static.t_ref_config_emissions_type (
    scope,etype_id,etypeattr1_id,etype_unit1_id,etype_unit2_id,date_added,added_by,date_modified,modified_by)
select
    1
     ,(select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
     ,(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='HFC-152 (R-152)')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(select 1 from static.t_ref_config_emissions_type
 where
 etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='HFC-152 (R-152)')
 );

insert into static.t_ref_config_emissions_unit_factor
(config_emission_type_id,etype_unit1_id,etype_unit2_id,etype_unit1_factor,etype_unit2_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.t_ref_config_emissions_type WHERE
            scope='1'
                                                         and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
                                                         and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='HFC-152 (R-152)')
    )
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,1.00
     ,0.001
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_unit_factor WHERE
config_emission_type_id =(SELECT id FROM static.t_ref_config_emissions_type WHERE
scope='1'
and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='HFC-152 (R-152)')
)
and etype_unit1_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
and etype_unit2_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
);
insert into static.t_ref_config_emissions_type (
    scope,etype_id,etypeattr1_id,etype_unit1_id,etype_unit2_id,date_added,added_by,date_modified,modified_by)
select
    1
     ,(select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
     ,(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='HFC-152a (R-152a)')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(select 1 from static.t_ref_config_emissions_type
 where
 etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='HFC-152a (R-152a)')
 );

insert into static.t_ref_config_emissions_unit_factor
(config_emission_type_id,etype_unit1_id,etype_unit2_id,etype_unit1_factor,etype_unit2_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.t_ref_config_emissions_type WHERE
            scope='1'
                                                         and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
                                                         and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='HFC-152a (R-152a)')
    )
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,1.00
     ,0.001
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_unit_factor WHERE
config_emission_type_id =(SELECT id FROM static.t_ref_config_emissions_type WHERE
scope='1'
and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='HFC-152a (R-152a)')
)
and etype_unit1_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
and etype_unit2_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
);
insert into static.t_ref_config_emissions_type (
    scope,etype_id,etypeattr1_id,etype_unit1_id,etype_unit2_id,date_added,added_by,date_modified,modified_by)
select
    1
     ,(select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
     ,(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='HFC-161 (R-161)')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(select 1 from static.t_ref_config_emissions_type
 where
 etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='HFC-161 (R-161)')
 );

insert into static.t_ref_config_emissions_unit_factor
(config_emission_type_id,etype_unit1_id,etype_unit2_id,etype_unit1_factor,etype_unit2_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.t_ref_config_emissions_type WHERE
            scope='1'
                                                         and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
                                                         and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='HFC-161 (R-161)')
    )
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,1.00
     ,0.001
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_unit_factor WHERE
config_emission_type_id =(SELECT id FROM static.t_ref_config_emissions_type WHERE
scope='1'
and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='HFC-161 (R-161)')
)
and etype_unit1_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
and etype_unit2_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
);
insert into static.t_ref_config_emissions_type (
    scope,etype_id,etypeattr1_id,etype_unit1_id,etype_unit2_id,date_added,added_by,date_modified,modified_by)
select
    1
     ,(select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
     ,(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='HFC-227ea (R-227ea)')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(select 1 from static.t_ref_config_emissions_type
 where
 etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='HFC-227ea (R-227ea)')
 );

insert into static.t_ref_config_emissions_unit_factor
(config_emission_type_id,etype_unit1_id,etype_unit2_id,etype_unit1_factor,etype_unit2_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.t_ref_config_emissions_type WHERE
            scope='1'
                                                         and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
                                                         and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='HFC-227ea (R-227ea)')
    )
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,1.00
     ,0.001
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_unit_factor WHERE
config_emission_type_id =(SELECT id FROM static.t_ref_config_emissions_type WHERE
scope='1'
and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='HFC-227ea (R-227ea)')
)
and etype_unit1_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
and etype_unit2_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
);
insert into static.t_ref_config_emissions_type (
    scope,etype_id,etypeattr1_id,etype_unit1_id,etype_unit2_id,date_added,added_by,date_modified,modified_by)
select
    1
     ,(select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
     ,(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='HFC-236cb (R-236cb)')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(select 1 from static.t_ref_config_emissions_type
 where
 etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='HFC-236cb (R-236cb)')
 );

insert into static.t_ref_config_emissions_unit_factor
(config_emission_type_id,etype_unit1_id,etype_unit2_id,etype_unit1_factor,etype_unit2_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.t_ref_config_emissions_type WHERE
            scope='1'
                                                         and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
                                                         and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='HFC-236cb (R-236cb)')
    )
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,1.00
     ,0.001
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_unit_factor WHERE
config_emission_type_id =(SELECT id FROM static.t_ref_config_emissions_type WHERE
scope='1'
and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='HFC-236cb (R-236cb)')
)
and etype_unit1_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
and etype_unit2_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
);
insert into static.t_ref_config_emissions_type (
    scope,etype_id,etypeattr1_id,etype_unit1_id,etype_unit2_id,date_added,added_by,date_modified,modified_by)
select
    1
     ,(select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
     ,(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='HFC-236ea (R-236ea)')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(select 1 from static.t_ref_config_emissions_type
 where
 etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='HFC-236ea (R-236ea)')
 );

insert into static.t_ref_config_emissions_unit_factor
(config_emission_type_id,etype_unit1_id,etype_unit2_id,etype_unit1_factor,etype_unit2_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.t_ref_config_emissions_type WHERE
            scope='1'
                                                         and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
                                                         and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='HFC-236ea (R-236ea)')
    )
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,1.00
     ,0.001
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_unit_factor WHERE
config_emission_type_id =(SELECT id FROM static.t_ref_config_emissions_type WHERE
scope='1'
and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='HFC-236ea (R-236ea)')
)
and etype_unit1_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
and etype_unit2_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
);
insert into static.t_ref_config_emissions_type (
    scope,etype_id,etypeattr1_id,etype_unit1_id,etype_unit2_id,date_added,added_by,date_modified,modified_by)
select
    1
     ,(select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
     ,(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='HFC-236fa (R-236fa)')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(select 1 from static.t_ref_config_emissions_type
 where
 etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='HFC-236fa (R-236fa)')
 );

insert into static.t_ref_config_emissions_unit_factor
(config_emission_type_id,etype_unit1_id,etype_unit2_id,etype_unit1_factor,etype_unit2_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.t_ref_config_emissions_type WHERE
            scope='1'
                                                         and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
                                                         and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='HFC-236fa (R-236fa)')
    )
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,1.00
     ,0.001
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_unit_factor WHERE
config_emission_type_id =(SELECT id FROM static.t_ref_config_emissions_type WHERE
scope='1'
and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='HFC-236fa (R-236fa)')
)
and etype_unit1_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
and etype_unit2_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
);
insert into static.t_ref_config_emissions_type (
    scope,etype_id,etypeattr1_id,etype_unit1_id,etype_unit2_id,date_added,added_by,date_modified,modified_by)
select
    1
     ,(select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
     ,(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='HFC-245ca (R-245ca)')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(select 1 from static.t_ref_config_emissions_type
 where
 etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='HFC-245ca (R-245ca)')
 );

insert into static.t_ref_config_emissions_unit_factor
(config_emission_type_id,etype_unit1_id,etype_unit2_id,etype_unit1_factor,etype_unit2_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.t_ref_config_emissions_type WHERE
            scope='1'
                                                         and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
                                                         and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='HFC-245ca (R-245ca)')
    )
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,1.00
     ,0.001
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_unit_factor WHERE
config_emission_type_id =(SELECT id FROM static.t_ref_config_emissions_type WHERE
scope='1'
and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='HFC-245ca (R-245ca)')
)
and etype_unit1_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
and etype_unit2_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
);
insert into static.t_ref_config_emissions_type (
    scope,etype_id,etypeattr1_id,etype_unit1_id,etype_unit2_id,date_added,added_by,date_modified,modified_by)
select
    1
     ,(select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
     ,(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='HFC-245fa (R-245fa)')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(select 1 from static.t_ref_config_emissions_type
 where
 etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='HFC-245fa (R-245fa)')
 );

insert into static.t_ref_config_emissions_unit_factor
(config_emission_type_id,etype_unit1_id,etype_unit2_id,etype_unit1_factor,etype_unit2_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.t_ref_config_emissions_type WHERE
            scope='1'
                                                         and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
                                                         and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='HFC-245fa (R-245fa)')
    )
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,1.00
     ,0.001
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_unit_factor WHERE
config_emission_type_id =(SELECT id FROM static.t_ref_config_emissions_type WHERE
scope='1'
and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='HFC-245fa (R-245fa)')
)
and etype_unit1_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
and etype_unit2_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
);
insert into static.t_ref_config_emissions_type (
    scope,etype_id,etypeattr1_id,etype_unit1_id,etype_unit2_id,date_added,added_by,date_modified,modified_by)
select
    1
     ,(select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
     ,(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='HFC-365mfc  ')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(select 1 from static.t_ref_config_emissions_type
 where
 etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='HFC-365mfc  ')
 );

insert into static.t_ref_config_emissions_unit_factor
(config_emission_type_id,etype_unit1_id,etype_unit2_id,etype_unit1_factor,etype_unit2_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.t_ref_config_emissions_type WHERE
            scope='1'
                                                         and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
                                                         and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='HFC-365mfc  ')
    )
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,1.00
     ,0.001
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_unit_factor WHERE
config_emission_type_id =(SELECT id FROM static.t_ref_config_emissions_type WHERE
scope='1'
and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='HFC-365mfc  ')
)
and etype_unit1_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
and etype_unit2_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
);
insert into static.t_ref_config_emissions_type (
    scope,etype_id,etypeattr1_id,etype_unit1_id,etype_unit2_id,date_added,added_by,date_modified,modified_by)
select
    1
     ,(select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
     ,(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='HFC-43-10mee (R-4310)')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(select 1 from static.t_ref_config_emissions_type
 where
 etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='HFC-43-10mee (R-4310)')
 );

insert into static.t_ref_config_emissions_unit_factor
(config_emission_type_id,etype_unit1_id,etype_unit2_id,etype_unit1_factor,etype_unit2_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.t_ref_config_emissions_type WHERE
            scope='1'
                                                         and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
                                                         and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='HFC-43-10mee (R-4310)')
    )
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,1.00
     ,0.001
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_unit_factor WHERE
config_emission_type_id =(SELECT id FROM static.t_ref_config_emissions_type WHERE
scope='1'
and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='HFC-43-10mee (R-4310)')
)
and etype_unit1_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
and etype_unit2_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
);
insert into static.t_ref_config_emissions_type (
    scope,etype_id,etypeattr1_id,etype_unit1_id,etype_unit2_id,date_added,added_by,date_modified,modified_by)
select
    1
     ,(select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
     ,(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='Perfluorocarbons (PFCs)')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(select 1 from static.t_ref_config_emissions_type
 where
 etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='Perfluorocarbons (PFCs)')
 );

insert into static.t_ref_config_emissions_unit_factor
(config_emission_type_id,etype_unit1_id,etype_unit2_id,etype_unit1_factor,etype_unit2_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.t_ref_config_emissions_type WHERE
            scope='1'
                                                         and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
                                                         and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='Perfluorocarbons (PFCs)')
    )
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,1.00
     ,0.001
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_unit_factor WHERE
config_emission_type_id =(SELECT id FROM static.t_ref_config_emissions_type WHERE
scope='1'
and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='Perfluorocarbons (PFCs)')
)
and etype_unit1_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
and etype_unit2_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
);
insert into static.t_ref_config_emissions_type (
    scope,etype_id,etypeattr1_id,etype_unit1_id,etype_unit2_id,date_added,added_by,date_modified,modified_by)
select
    1
     ,(select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
     ,(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='PFC-14 (Perfluoromethane)')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(select 1 from static.t_ref_config_emissions_type
 where
 etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='PFC-14 (Perfluoromethane)')
 );

insert into static.t_ref_config_emissions_unit_factor
(config_emission_type_id,etype_unit1_id,etype_unit2_id,etype_unit1_factor,etype_unit2_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.t_ref_config_emissions_type WHERE
            scope='1'
                                                         and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
                                                         and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='PFC-14 (Perfluoromethane)')
    )
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,1.00
     ,0.001
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_unit_factor WHERE
config_emission_type_id =(SELECT id FROM static.t_ref_config_emissions_type WHERE
scope='1'
and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='PFC-14 (Perfluoromethane)')
)
and etype_unit1_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
and etype_unit2_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
);
insert into static.t_ref_config_emissions_type (
    scope,etype_id,etypeattr1_id,etype_unit1_id,etype_unit2_id,date_added,added_by,date_modified,modified_by)
select
    1
     ,(select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
     ,(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='PFC-116 (Perfluoroethane)  ')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(select 1 from static.t_ref_config_emissions_type
 where
 etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='PFC-116 (Perfluoroethane)  ')
 );

insert into static.t_ref_config_emissions_unit_factor
(config_emission_type_id,etype_unit1_id,etype_unit2_id,etype_unit1_factor,etype_unit2_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.t_ref_config_emissions_type WHERE
            scope='1'
                                                         and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
                                                         and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='PFC-116 (Perfluoroethane)  ')
    )
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,1.00
     ,0.001
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_unit_factor WHERE
config_emission_type_id =(SELECT id FROM static.t_ref_config_emissions_type WHERE
scope='1'
and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='PFC-116 (Perfluoroethane)  ')
)
and etype_unit1_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
and etype_unit2_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
);
insert into static.t_ref_config_emissions_type (
    scope,etype_id,etypeattr1_id,etype_unit1_id,etype_unit2_id,date_added,added_by,date_modified,modified_by)
select
    1
     ,(select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
     ,(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='PFC-218 (Perfluoropropane)  ')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(select 1 from static.t_ref_config_emissions_type
 where
 etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='PFC-218 (Perfluoropropane)  ')
 );

insert into static.t_ref_config_emissions_unit_factor
(config_emission_type_id,etype_unit1_id,etype_unit2_id,etype_unit1_factor,etype_unit2_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.t_ref_config_emissions_type WHERE
            scope='1'
                                                         and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
                                                         and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='PFC-218 (Perfluoropropane)  ')
    )
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,1.00
     ,0.001
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_unit_factor WHERE
config_emission_type_id =(SELECT id FROM static.t_ref_config_emissions_type WHERE
scope='1'
and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='PFC-218 (Perfluoropropane)  ')
)
and etype_unit1_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
and etype_unit2_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
);
insert into static.t_ref_config_emissions_type (
    scope,etype_id,etypeattr1_id,etype_unit1_id,etype_unit2_id,date_added,added_by,date_modified,modified_by)
select
    1
     ,(select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
     ,(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='PFC-318 (Perfluorocyclobutane)')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(select 1 from static.t_ref_config_emissions_type
 where
 etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='PFC-318 (Perfluorocyclobutane)')
 );

insert into static.t_ref_config_emissions_unit_factor
(config_emission_type_id,etype_unit1_id,etype_unit2_id,etype_unit1_factor,etype_unit2_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.t_ref_config_emissions_type WHERE
            scope='1'
                                                         and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
                                                         and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='PFC-318 (Perfluorocyclobutane)')
    )
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,1.00
     ,0.001
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_unit_factor WHERE
config_emission_type_id =(SELECT id FROM static.t_ref_config_emissions_type WHERE
scope='1'
and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='PFC-318 (Perfluorocyclobutane)')
)
and etype_unit1_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
and etype_unit2_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
);
insert into static.t_ref_config_emissions_type (
    scope,etype_id,etypeattr1_id,etype_unit1_id,etype_unit2_id,date_added,added_by,date_modified,modified_by)
select
    1
     ,(select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
     ,(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='PFC-3-1-10 (Perfluorobutane)  ')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(select 1 from static.t_ref_config_emissions_type
 where
 etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='PFC-3-1-10 (Perfluorobutane)  ')
 );

insert into static.t_ref_config_emissions_unit_factor
(config_emission_type_id,etype_unit1_id,etype_unit2_id,etype_unit1_factor,etype_unit2_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.t_ref_config_emissions_type WHERE
            scope='1'
                                                         and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
                                                         and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='PFC-3-1-10 (Perfluorobutane)  ')
    )
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,1.00
     ,0.001
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_unit_factor WHERE
config_emission_type_id =(SELECT id FROM static.t_ref_config_emissions_type WHERE
scope='1'
and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='PFC-3-1-10 (Perfluorobutane)  ')
)
and etype_unit1_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
and etype_unit2_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
);
insert into static.t_ref_config_emissions_type (
    scope,etype_id,etypeattr1_id,etype_unit1_id,etype_unit2_id,date_added,added_by,date_modified,modified_by)
select
    1
     ,(select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
     ,(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='PFC-4-1-12 (Perfluoropentane)  ')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(select 1 from static.t_ref_config_emissions_type
 where
 etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='PFC-4-1-12 (Perfluoropentane)  ')
 );

insert into static.t_ref_config_emissions_unit_factor
(config_emission_type_id,etype_unit1_id,etype_unit2_id,etype_unit1_factor,etype_unit2_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.t_ref_config_emissions_type WHERE
            scope='1'
                                                         and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
                                                         and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='PFC-4-1-12 (Perfluoropentane)  ')
    )
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,1.00
     ,0.001
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_unit_factor WHERE
config_emission_type_id =(SELECT id FROM static.t_ref_config_emissions_type WHERE
scope='1'
and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='PFC-4-1-12 (Perfluoropentane)  ')
)
and etype_unit1_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
and etype_unit2_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
);
insert into static.t_ref_config_emissions_type (
    scope,etype_id,etypeattr1_id,etype_unit1_id,etype_unit2_id,date_added,added_by,date_modified,modified_by)
select
    1
     ,(select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
     ,(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='PFC-5-1-14 (Perfluorohexane)  ')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(select 1 from static.t_ref_config_emissions_type
 where
 etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='PFC-5-1-14 (Perfluorohexane)  ')
 );

insert into static.t_ref_config_emissions_unit_factor
(config_emission_type_id,etype_unit1_id,etype_unit2_id,etype_unit1_factor,etype_unit2_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.t_ref_config_emissions_type WHERE
            scope='1'
                                                         and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
                                                         and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='PFC-5-1-14 (Perfluorohexane)  ')
    )
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,1.00
     ,0.001
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_unit_factor WHERE
config_emission_type_id =(SELECT id FROM static.t_ref_config_emissions_type WHERE
scope='1'
and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='PFC-5-1-14 (Perfluorohexane)  ')
)
and etype_unit1_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
and etype_unit2_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
);
insert into static.t_ref_config_emissions_type (
    scope,etype_id,etypeattr1_id,etype_unit1_id,etype_unit2_id,date_added,added_by,date_modified,modified_by)
select
    1
     ,(select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
     ,(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='PFC-9-1-18 (Perfluorodecalin)  ')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(select 1 from static.t_ref_config_emissions_type
 where
 etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='PFC-9-1-18 (Perfluorodecalin)  ')
 );

insert into static.t_ref_config_emissions_unit_factor
(config_emission_type_id,etype_unit1_id,etype_unit2_id,etype_unit1_factor,etype_unit2_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.t_ref_config_emissions_type WHERE
            scope='1'
                                                         and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
                                                         and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='PFC-9-1-18 (Perfluorodecalin)  ')
    )
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,1.00
     ,0.001
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_unit_factor WHERE
config_emission_type_id =(SELECT id FROM static.t_ref_config_emissions_type WHERE
scope='1'
and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='PFC-9-1-18 (Perfluorodecalin)  ')
)
and etype_unit1_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
and etype_unit2_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
);
insert into static.t_ref_config_emissions_type (
    scope,etype_id,etypeattr1_id,etype_unit1_id,etype_unit2_id,date_added,added_by,date_modified,modified_by)
select
    1
     ,(select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
     ,(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-401A')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(select 1 from static.t_ref_config_emissions_type
 where
 etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-401A')
 );

insert into static.t_ref_config_emissions_unit_factor
(config_emission_type_id,etype_unit1_id,etype_unit2_id,etype_unit1_factor,etype_unit2_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.t_ref_config_emissions_type WHERE
            scope='1'
                                                         and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
                                                         and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-401A')
    )
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,1.00
     ,0.001
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_unit_factor WHERE
config_emission_type_id =(SELECT id FROM static.t_ref_config_emissions_type WHERE
scope='1'
and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-401A')
)
and etype_unit1_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
and etype_unit2_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
);
insert into static.t_ref_config_emissions_type (
    scope,etype_id,etypeattr1_id,etype_unit1_id,etype_unit2_id,date_added,added_by,date_modified,modified_by)
select
    1
     ,(select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
     ,(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-401B')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(select 1 from static.t_ref_config_emissions_type
 where
 etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-401B')
 );

insert into static.t_ref_config_emissions_unit_factor
(config_emission_type_id,etype_unit1_id,etype_unit2_id,etype_unit1_factor,etype_unit2_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.t_ref_config_emissions_type WHERE
            scope='1'
                                                         and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
                                                         and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-401B')
    )
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,1.00
     ,0.001
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_unit_factor WHERE
config_emission_type_id =(SELECT id FROM static.t_ref_config_emissions_type WHERE
scope='1'
and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-401B')
)
and etype_unit1_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
and etype_unit2_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
);
insert into static.t_ref_config_emissions_type (
    scope,etype_id,etypeattr1_id,etype_unit1_id,etype_unit2_id,date_added,added_by,date_modified,modified_by)
select
    1
     ,(select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
     ,(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-401C')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(select 1 from static.t_ref_config_emissions_type
 where
 etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-401C')
 );

insert into static.t_ref_config_emissions_unit_factor
(config_emission_type_id,etype_unit1_id,etype_unit2_id,etype_unit1_factor,etype_unit2_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.t_ref_config_emissions_type WHERE
            scope='1'
                                                         and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
                                                         and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-401C')
    )
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,1.00
     ,0.001
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_unit_factor WHERE
config_emission_type_id =(SELECT id FROM static.t_ref_config_emissions_type WHERE
scope='1'
and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-401C')
)
and etype_unit1_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
and etype_unit2_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
);
insert into static.t_ref_config_emissions_type (
    scope,etype_id,etypeattr1_id,etype_unit1_id,etype_unit2_id,date_added,added_by,date_modified,modified_by)
select
    1
     ,(select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
     ,(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-402A')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(select 1 from static.t_ref_config_emissions_type
 where
 etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-402A')
 );

insert into static.t_ref_config_emissions_unit_factor
(config_emission_type_id,etype_unit1_id,etype_unit2_id,etype_unit1_factor,etype_unit2_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.t_ref_config_emissions_type WHERE
            scope='1'
                                                         and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
                                                         and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-402A')
    )
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,1.00
     ,0.001
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_unit_factor WHERE
config_emission_type_id =(SELECT id FROM static.t_ref_config_emissions_type WHERE
scope='1'
and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-402A')
)
and etype_unit1_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
and etype_unit2_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
);
insert into static.t_ref_config_emissions_type (
    scope,etype_id,etypeattr1_id,etype_unit1_id,etype_unit2_id,date_added,added_by,date_modified,modified_by)
select
    1
     ,(select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
     ,(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-402B')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(select 1 from static.t_ref_config_emissions_type
 where
 etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-402B')
 );

insert into static.t_ref_config_emissions_unit_factor
(config_emission_type_id,etype_unit1_id,etype_unit2_id,etype_unit1_factor,etype_unit2_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.t_ref_config_emissions_type WHERE
            scope='1'
                                                         and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
                                                         and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-402B')
    )
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,1.00
     ,0.001
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_unit_factor WHERE
config_emission_type_id =(SELECT id FROM static.t_ref_config_emissions_type WHERE
scope='1'
and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-402B')
)
and etype_unit1_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
and etype_unit2_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
);
insert into static.t_ref_config_emissions_type (
    scope,etype_id,etypeattr1_id,etype_unit1_id,etype_unit2_id,date_added,added_by,date_modified,modified_by)
select
    1
     ,(select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
     ,(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-403A')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(select 1 from static.t_ref_config_emissions_type
 where
 etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-403A')
 );

insert into static.t_ref_config_emissions_unit_factor
(config_emission_type_id,etype_unit1_id,etype_unit2_id,etype_unit1_factor,etype_unit2_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.t_ref_config_emissions_type WHERE
            scope='1'
                                                         and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
                                                         and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-403A')
    )
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,1.00
     ,0.001
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_unit_factor WHERE
config_emission_type_id =(SELECT id FROM static.t_ref_config_emissions_type WHERE
scope='1'
and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-403A')
)
and etype_unit1_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
and etype_unit2_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
);
insert into static.t_ref_config_emissions_type (
    scope,etype_id,etypeattr1_id,etype_unit1_id,etype_unit2_id,date_added,added_by,date_modified,modified_by)
select
    1
     ,(select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
     ,(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-403B')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(select 1 from static.t_ref_config_emissions_type
 where
 etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-403B')
 );

insert into static.t_ref_config_emissions_unit_factor
(config_emission_type_id,etype_unit1_id,etype_unit2_id,etype_unit1_factor,etype_unit2_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.t_ref_config_emissions_type WHERE
            scope='1'
                                                         and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
                                                         and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-403B')
    )
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,1.00
     ,0.001
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_unit_factor WHERE
config_emission_type_id =(SELECT id FROM static.t_ref_config_emissions_type WHERE
scope='1'
and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-403B')
)
and etype_unit1_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
and etype_unit2_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
);
insert into static.t_ref_config_emissions_type (
    scope,etype_id,etypeattr1_id,etype_unit1_id,etype_unit2_id,date_added,added_by,date_modified,modified_by)
select
    1
     ,(select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
     ,(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-404A')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(select 1 from static.t_ref_config_emissions_type
 where
 etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-404A')
 );

insert into static.t_ref_config_emissions_unit_factor
(config_emission_type_id,etype_unit1_id,etype_unit2_id,etype_unit1_factor,etype_unit2_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.t_ref_config_emissions_type WHERE
            scope='1'
                                                         and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
                                                         and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-404A')
    )
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,1.00
     ,0.001
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_unit_factor WHERE
config_emission_type_id =(SELECT id FROM static.t_ref_config_emissions_type WHERE
scope='1'
and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-404A')
)
and etype_unit1_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
and etype_unit2_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
);
insert into static.t_ref_config_emissions_type (
    scope,etype_id,etypeattr1_id,etype_unit1_id,etype_unit2_id,date_added,added_by,date_modified,modified_by)
select
    1
     ,(select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
     ,(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-407A')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(select 1 from static.t_ref_config_emissions_type
 where
 etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-407A')
 );

insert into static.t_ref_config_emissions_unit_factor
(config_emission_type_id,etype_unit1_id,etype_unit2_id,etype_unit1_factor,etype_unit2_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.t_ref_config_emissions_type WHERE
            scope='1'
                                                         and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
                                                         and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-407A')
    )
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,1.00
     ,0.001
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_unit_factor WHERE
config_emission_type_id =(SELECT id FROM static.t_ref_config_emissions_type WHERE
scope='1'
and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-407A')
)
and etype_unit1_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
and etype_unit2_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
);
insert into static.t_ref_config_emissions_type (
    scope,etype_id,etypeattr1_id,etype_unit1_id,etype_unit2_id,date_added,added_by,date_modified,modified_by)
select
    1
     ,(select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
     ,(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-407B')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(select 1 from static.t_ref_config_emissions_type
 where
 etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-407B')
 );

insert into static.t_ref_config_emissions_unit_factor
(config_emission_type_id,etype_unit1_id,etype_unit2_id,etype_unit1_factor,etype_unit2_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.t_ref_config_emissions_type WHERE
            scope='1'
                                                         and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
                                                         and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-407B')
    )
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,1.00
     ,0.001
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_unit_factor WHERE
config_emission_type_id =(SELECT id FROM static.t_ref_config_emissions_type WHERE
scope='1'
and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-407B')
)
and etype_unit1_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
and etype_unit2_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
);
insert into static.t_ref_config_emissions_type (
    scope,etype_id,etypeattr1_id,etype_unit1_id,etype_unit2_id,date_added,added_by,date_modified,modified_by)
select
    1
     ,(select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
     ,(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-407C')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(select 1 from static.t_ref_config_emissions_type
 where
 etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-407C')
 );

insert into static.t_ref_config_emissions_unit_factor
(config_emission_type_id,etype_unit1_id,etype_unit2_id,etype_unit1_factor,etype_unit2_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.t_ref_config_emissions_type WHERE
            scope='1'
                                                         and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
                                                         and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-407C')
    )
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,1.00
     ,0.001
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_unit_factor WHERE
config_emission_type_id =(SELECT id FROM static.t_ref_config_emissions_type WHERE
scope='1'
and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-407C')
)
and etype_unit1_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
and etype_unit2_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
);
insert into static.t_ref_config_emissions_type (
    scope,etype_id,etypeattr1_id,etype_unit1_id,etype_unit2_id,date_added,added_by,date_modified,modified_by)
select
    1
     ,(select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
     ,(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-407D')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(select 1 from static.t_ref_config_emissions_type
 where
 etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-407D')
 );

insert into static.t_ref_config_emissions_unit_factor
(config_emission_type_id,etype_unit1_id,etype_unit2_id,etype_unit1_factor,etype_unit2_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.t_ref_config_emissions_type WHERE
            scope='1'
                                                         and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
                                                         and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-407D')
    )
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,1.00
     ,0.001
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_unit_factor WHERE
config_emission_type_id =(SELECT id FROM static.t_ref_config_emissions_type WHERE
scope='1'
and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-407D')
)
and etype_unit1_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
and etype_unit2_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
);
insert into static.t_ref_config_emissions_type (
    scope,etype_id,etypeattr1_id,etype_unit1_id,etype_unit2_id,date_added,added_by,date_modified,modified_by)
select
    1
     ,(select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
     ,(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-407E')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(select 1 from static.t_ref_config_emissions_type
 where
 etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-407E')
 );

insert into static.t_ref_config_emissions_unit_factor
(config_emission_type_id,etype_unit1_id,etype_unit2_id,etype_unit1_factor,etype_unit2_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.t_ref_config_emissions_type WHERE
            scope='1'
                                                         and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
                                                         and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-407E')
    )
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,1.00
     ,0.001
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_unit_factor WHERE
config_emission_type_id =(SELECT id FROM static.t_ref_config_emissions_type WHERE
scope='1'
and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-407E')
)
and etype_unit1_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
and etype_unit2_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
);
insert into static.t_ref_config_emissions_type (
    scope,etype_id,etypeattr1_id,etype_unit1_id,etype_unit2_id,date_added,added_by,date_modified,modified_by)
select
    1
     ,(select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
     ,(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-407F')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(select 1 from static.t_ref_config_emissions_type
 where
 etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-407F')
 );

insert into static.t_ref_config_emissions_unit_factor
(config_emission_type_id,etype_unit1_id,etype_unit2_id,etype_unit1_factor,etype_unit2_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.t_ref_config_emissions_type WHERE
            scope='1'
                                                         and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
                                                         and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-407F')
    )
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,1.00
     ,0.001
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_unit_factor WHERE
config_emission_type_id =(SELECT id FROM static.t_ref_config_emissions_type WHERE
scope='1'
and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-407F')
)
and etype_unit1_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
and etype_unit2_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
);
insert into static.t_ref_config_emissions_type (
    scope,etype_id,etypeattr1_id,etype_unit1_id,etype_unit2_id,date_added,added_by,date_modified,modified_by)
select
    1
     ,(select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
     ,(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-408A')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(select 1 from static.t_ref_config_emissions_type
 where
 etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-408A')
 );

insert into static.t_ref_config_emissions_unit_factor
(config_emission_type_id,etype_unit1_id,etype_unit2_id,etype_unit1_factor,etype_unit2_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.t_ref_config_emissions_type WHERE
            scope='1'
                                                         and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
                                                         and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-408A')
    )
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,1.00
     ,0.001
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_unit_factor WHERE
config_emission_type_id =(SELECT id FROM static.t_ref_config_emissions_type WHERE
scope='1'
and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-408A')
)
and etype_unit1_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
and etype_unit2_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
);
insert into static.t_ref_config_emissions_type (
    scope,etype_id,etypeattr1_id,etype_unit1_id,etype_unit2_id,date_added,added_by,date_modified,modified_by)
select
    1
     ,(select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
     ,(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-410A')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(select 1 from static.t_ref_config_emissions_type
 where
 etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-410A')
 );

insert into static.t_ref_config_emissions_unit_factor
(config_emission_type_id,etype_unit1_id,etype_unit2_id,etype_unit1_factor,etype_unit2_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.t_ref_config_emissions_type WHERE
            scope='1'
                                                         and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
                                                         and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-410A')
    )
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,1.00
     ,0.001
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_unit_factor WHERE
config_emission_type_id =(SELECT id FROM static.t_ref_config_emissions_type WHERE
scope='1'
and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-410A')
)
and etype_unit1_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
and etype_unit2_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
);
insert into static.t_ref_config_emissions_type (
    scope,etype_id,etypeattr1_id,etype_unit1_id,etype_unit2_id,date_added,added_by,date_modified,modified_by)
select
    1
     ,(select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
     ,(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-410B')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(select 1 from static.t_ref_config_emissions_type
 where
 etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-410B')
 );

insert into static.t_ref_config_emissions_unit_factor
(config_emission_type_id,etype_unit1_id,etype_unit2_id,etype_unit1_factor,etype_unit2_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.t_ref_config_emissions_type WHERE
            scope='1'
                                                         and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
                                                         and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-410B')
    )
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,1.00
     ,0.001
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_unit_factor WHERE
config_emission_type_id =(SELECT id FROM static.t_ref_config_emissions_type WHERE
scope='1'
and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-410B')
)
and etype_unit1_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
and etype_unit2_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
);
insert into static.t_ref_config_emissions_type (
    scope,etype_id,etypeattr1_id,etype_unit1_id,etype_unit2_id,date_added,added_by,date_modified,modified_by)
select
    1
     ,(select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
     ,(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-411A')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(select 1 from static.t_ref_config_emissions_type
 where
 etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-411A')
 );

insert into static.t_ref_config_emissions_unit_factor
(config_emission_type_id,etype_unit1_id,etype_unit2_id,etype_unit1_factor,etype_unit2_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.t_ref_config_emissions_type WHERE
            scope='1'
                                                         and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
                                                         and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-411A')
    )
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,1.00
     ,0.001
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_unit_factor WHERE
config_emission_type_id =(SELECT id FROM static.t_ref_config_emissions_type WHERE
scope='1'
and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-411A')
)
and etype_unit1_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
and etype_unit2_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
);
insert into static.t_ref_config_emissions_type (
    scope,etype_id,etypeattr1_id,etype_unit1_id,etype_unit2_id,date_added,added_by,date_modified,modified_by)
select
    1
     ,(select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
     ,(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-411B')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(select 1 from static.t_ref_config_emissions_type
 where
 etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-411B')
 );

insert into static.t_ref_config_emissions_unit_factor
(config_emission_type_id,etype_unit1_id,etype_unit2_id,etype_unit1_factor,etype_unit2_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.t_ref_config_emissions_type WHERE
            scope='1'
                                                         and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
                                                         and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-411B')
    )
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,1.00
     ,0.001
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_unit_factor WHERE
config_emission_type_id =(SELECT id FROM static.t_ref_config_emissions_type WHERE
scope='1'
and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-411B')
)
and etype_unit1_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
and etype_unit2_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
);
insert into static.t_ref_config_emissions_type (
    scope,etype_id,etypeattr1_id,etype_unit1_id,etype_unit2_id,date_added,added_by,date_modified,modified_by)
select
    1
     ,(select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
     ,(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-412A')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(select 1 from static.t_ref_config_emissions_type
 where
 etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-412A')
 );

insert into static.t_ref_config_emissions_unit_factor
(config_emission_type_id,etype_unit1_id,etype_unit2_id,etype_unit1_factor,etype_unit2_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.t_ref_config_emissions_type WHERE
            scope='1'
                                                         and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
                                                         and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-412A')
    )
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,1.00
     ,0.001
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_unit_factor WHERE
config_emission_type_id =(SELECT id FROM static.t_ref_config_emissions_type WHERE
scope='1'
and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-412A')
)
and etype_unit1_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
and etype_unit2_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
);
insert into static.t_ref_config_emissions_type (
    scope,etype_id,etypeattr1_id,etype_unit1_id,etype_unit2_id,date_added,added_by,date_modified,modified_by)
select
    1
     ,(select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
     ,(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-415A')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(select 1 from static.t_ref_config_emissions_type
 where
 etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-415A')
 );

insert into static.t_ref_config_emissions_unit_factor
(config_emission_type_id,etype_unit1_id,etype_unit2_id,etype_unit1_factor,etype_unit2_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.t_ref_config_emissions_type WHERE
            scope='1'
                                                         and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
                                                         and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-415A')
    )
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,1.00
     ,0.001
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_unit_factor WHERE
config_emission_type_id =(SELECT id FROM static.t_ref_config_emissions_type WHERE
scope='1'
and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-415A')
)
and etype_unit1_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
and etype_unit2_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
);
insert into static.t_ref_config_emissions_type (
    scope,etype_id,etypeattr1_id,etype_unit1_id,etype_unit2_id,date_added,added_by,date_modified,modified_by)
select
    1
     ,(select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
     ,(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-415B')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(select 1 from static.t_ref_config_emissions_type
 where
 etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-415B')
 );

insert into static.t_ref_config_emissions_unit_factor
(config_emission_type_id,etype_unit1_id,etype_unit2_id,etype_unit1_factor,etype_unit2_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.t_ref_config_emissions_type WHERE
            scope='1'
                                                         and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
                                                         and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-415B')
    )
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,1.00
     ,0.001
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_unit_factor WHERE
config_emission_type_id =(SELECT id FROM static.t_ref_config_emissions_type WHERE
scope='1'
and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-415B')
)
and etype_unit1_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
and etype_unit2_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
);
insert into static.t_ref_config_emissions_type (
    scope,etype_id,etypeattr1_id,etype_unit1_id,etype_unit2_id,date_added,added_by,date_modified,modified_by)
select
    1
     ,(select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
     ,(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-416A')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(select 1 from static.t_ref_config_emissions_type
 where
 etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-416A')
 );

insert into static.t_ref_config_emissions_unit_factor
(config_emission_type_id,etype_unit1_id,etype_unit2_id,etype_unit1_factor,etype_unit2_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.t_ref_config_emissions_type WHERE
            scope='1'
                                                         and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
                                                         and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-416A')
    )
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,1.00
     ,0.001
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_unit_factor WHERE
config_emission_type_id =(SELECT id FROM static.t_ref_config_emissions_type WHERE
scope='1'
and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-416A')
)
and etype_unit1_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
and etype_unit2_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
);
insert into static.t_ref_config_emissions_type (
    scope,etype_id,etypeattr1_id,etype_unit1_id,etype_unit2_id,date_added,added_by,date_modified,modified_by)
select
    1
     ,(select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
     ,(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-417A')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(select 1 from static.t_ref_config_emissions_type
 where
 etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-417A')
 );

insert into static.t_ref_config_emissions_unit_factor
(config_emission_type_id,etype_unit1_id,etype_unit2_id,etype_unit1_factor,etype_unit2_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.t_ref_config_emissions_type WHERE
            scope='1'
                                                         and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
                                                         and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-417A')
    )
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,1.00
     ,0.001
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_unit_factor WHERE
config_emission_type_id =(SELECT id FROM static.t_ref_config_emissions_type WHERE
scope='1'
and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-417A')
)
and etype_unit1_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
and etype_unit2_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
);
insert into static.t_ref_config_emissions_type (
    scope,etype_id,etypeattr1_id,etype_unit1_id,etype_unit2_id,date_added,added_by,date_modified,modified_by)
select
    1
     ,(select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
     ,(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-417B')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(select 1 from static.t_ref_config_emissions_type
 where
 etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-417B')
 );

insert into static.t_ref_config_emissions_unit_factor
(config_emission_type_id,etype_unit1_id,etype_unit2_id,etype_unit1_factor,etype_unit2_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.t_ref_config_emissions_type WHERE
            scope='1'
                                                         and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
                                                         and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-417B')
    )
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,1.00
     ,0.001
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_unit_factor WHERE
config_emission_type_id =(SELECT id FROM static.t_ref_config_emissions_type WHERE
scope='1'
and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-417B')
)
and etype_unit1_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
and etype_unit2_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
);
insert into static.t_ref_config_emissions_type (
    scope,etype_id,etypeattr1_id,etype_unit1_id,etype_unit2_id,date_added,added_by,date_modified,modified_by)
select
    1
     ,(select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
     ,(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-417C')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(select 1 from static.t_ref_config_emissions_type
 where
 etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-417C')
 );

insert into static.t_ref_config_emissions_unit_factor
(config_emission_type_id,etype_unit1_id,etype_unit2_id,etype_unit1_factor,etype_unit2_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.t_ref_config_emissions_type WHERE
            scope='1'
                                                         and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
                                                         and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-417C')
    )
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,1.00
     ,0.001
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_unit_factor WHERE
config_emission_type_id =(SELECT id FROM static.t_ref_config_emissions_type WHERE
scope='1'
and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-417C')
)
and etype_unit1_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
and etype_unit2_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
);
insert into static.t_ref_config_emissions_type (
    scope,etype_id,etypeattr1_id,etype_unit1_id,etype_unit2_id,date_added,added_by,date_modified,modified_by)
select
    1
     ,(select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
     ,(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-418A')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(select 1 from static.t_ref_config_emissions_type
 where
 etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-418A')
 );

insert into static.t_ref_config_emissions_unit_factor
(config_emission_type_id,etype_unit1_id,etype_unit2_id,etype_unit1_factor,etype_unit2_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.t_ref_config_emissions_type WHERE
            scope='1'
                                                         and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
                                                         and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-418A')
    )
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,1.00
     ,0.001
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_unit_factor WHERE
config_emission_type_id =(SELECT id FROM static.t_ref_config_emissions_type WHERE
scope='1'
and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-418A')
)
and etype_unit1_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
and etype_unit2_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
);
insert into static.t_ref_config_emissions_type (
    scope,etype_id,etypeattr1_id,etype_unit1_id,etype_unit2_id,date_added,added_by,date_modified,modified_by)
select
    1
     ,(select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
     ,(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-419A')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(select 1 from static.t_ref_config_emissions_type
 where
 etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-419A')
 );

insert into static.t_ref_config_emissions_unit_factor
(config_emission_type_id,etype_unit1_id,etype_unit2_id,etype_unit1_factor,etype_unit2_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.t_ref_config_emissions_type WHERE
            scope='1'
                                                         and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
                                                         and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-419A')
    )
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,1.00
     ,0.001
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_unit_factor WHERE
config_emission_type_id =(SELECT id FROM static.t_ref_config_emissions_type WHERE
scope='1'
and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-419A')
)
and etype_unit1_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
and etype_unit2_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
);
insert into static.t_ref_config_emissions_type (
    scope,etype_id,etypeattr1_id,etype_unit1_id,etype_unit2_id,date_added,added_by,date_modified,modified_by)
select
    1
     ,(select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
     ,(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-419B')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(select 1 from static.t_ref_config_emissions_type
 where
 etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-419B')
 );

insert into static.t_ref_config_emissions_unit_factor
(config_emission_type_id,etype_unit1_id,etype_unit2_id,etype_unit1_factor,etype_unit2_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.t_ref_config_emissions_type WHERE
            scope='1'
                                                         and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
                                                         and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-419B')
    )
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,1.00
     ,0.001
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_unit_factor WHERE
config_emission_type_id =(SELECT id FROM static.t_ref_config_emissions_type WHERE
scope='1'
and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-419B')
)
and etype_unit1_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
and etype_unit2_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
);
insert into static.t_ref_config_emissions_type (
    scope,etype_id,etypeattr1_id,etype_unit1_id,etype_unit2_id,date_added,added_by,date_modified,modified_by)
select
    1
     ,(select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
     ,(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-420A')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(select 1 from static.t_ref_config_emissions_type
 where
 etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-420A')
 );

insert into static.t_ref_config_emissions_unit_factor
(config_emission_type_id,etype_unit1_id,etype_unit2_id,etype_unit1_factor,etype_unit2_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.t_ref_config_emissions_type WHERE
            scope='1'
                                                         and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
                                                         and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-420A')
    )
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,1.00
     ,0.001
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_unit_factor WHERE
config_emission_type_id =(SELECT id FROM static.t_ref_config_emissions_type WHERE
scope='1'
and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-420A')
)
and etype_unit1_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
and etype_unit2_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
);
insert into static.t_ref_config_emissions_type (
    scope,etype_id,etypeattr1_id,etype_unit1_id,etype_unit2_id,date_added,added_by,date_modified,modified_by)
select
    1
     ,(select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
     ,(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-421A')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(select 1 from static.t_ref_config_emissions_type
 where
 etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-421A')
 );

insert into static.t_ref_config_emissions_unit_factor
(config_emission_type_id,etype_unit1_id,etype_unit2_id,etype_unit1_factor,etype_unit2_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.t_ref_config_emissions_type WHERE
            scope='1'
                                                         and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
                                                         and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-421A')
    )
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,1.00
     ,0.001
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_unit_factor WHERE
config_emission_type_id =(SELECT id FROM static.t_ref_config_emissions_type WHERE
scope='1'
and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-421A')
)
and etype_unit1_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
and etype_unit2_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
);
insert into static.t_ref_config_emissions_type (
    scope,etype_id,etypeattr1_id,etype_unit1_id,etype_unit2_id,date_added,added_by,date_modified,modified_by)
select
    1
     ,(select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
     ,(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-421B')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(select 1 from static.t_ref_config_emissions_type
 where
 etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-421B')
 );

insert into static.t_ref_config_emissions_unit_factor
(config_emission_type_id,etype_unit1_id,etype_unit2_id,etype_unit1_factor,etype_unit2_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.t_ref_config_emissions_type WHERE
            scope='1'
                                                         and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
                                                         and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-421B')
    )
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,1.00
     ,0.001
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_unit_factor WHERE
config_emission_type_id =(SELECT id FROM static.t_ref_config_emissions_type WHERE
scope='1'
and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-421B')
)
and etype_unit1_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
and etype_unit2_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
);
insert into static.t_ref_config_emissions_type (
    scope,etype_id,etypeattr1_id,etype_unit1_id,etype_unit2_id,date_added,added_by,date_modified,modified_by)
select
    1
     ,(select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
     ,(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-422A')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(select 1 from static.t_ref_config_emissions_type
 where
 etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-422A')
 );

insert into static.t_ref_config_emissions_unit_factor
(config_emission_type_id,etype_unit1_id,etype_unit2_id,etype_unit1_factor,etype_unit2_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.t_ref_config_emissions_type WHERE
            scope='1'
                                                         and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
                                                         and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-422A')
    )
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,1.00
     ,0.001
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_unit_factor WHERE
config_emission_type_id =(SELECT id FROM static.t_ref_config_emissions_type WHERE
scope='1'
and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-422A')
)
and etype_unit1_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
and etype_unit2_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
);
insert into static.t_ref_config_emissions_type (
    scope,etype_id,etypeattr1_id,etype_unit1_id,etype_unit2_id,date_added,added_by,date_modified,modified_by)
select
    1
     ,(select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
     ,(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-422B')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(select 1 from static.t_ref_config_emissions_type
 where
 etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-422B')
 );

insert into static.t_ref_config_emissions_unit_factor
(config_emission_type_id,etype_unit1_id,etype_unit2_id,etype_unit1_factor,etype_unit2_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.t_ref_config_emissions_type WHERE
            scope='1'
                                                         and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
                                                         and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-422B')
    )
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,1.00
     ,0.001
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_unit_factor WHERE
config_emission_type_id =(SELECT id FROM static.t_ref_config_emissions_type WHERE
scope='1'
and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-422B')
)
and etype_unit1_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
and etype_unit2_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
);
insert into static.t_ref_config_emissions_type (
    scope,etype_id,etypeattr1_id,etype_unit1_id,etype_unit2_id,date_added,added_by,date_modified,modified_by)
select
    1
     ,(select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
     ,(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-422C')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(select 1 from static.t_ref_config_emissions_type
 where
 etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-422C')
 );

insert into static.t_ref_config_emissions_unit_factor
(config_emission_type_id,etype_unit1_id,etype_unit2_id,etype_unit1_factor,etype_unit2_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.t_ref_config_emissions_type WHERE
            scope='1'
                                                         and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
                                                         and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-422C')
    )
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,1.00
     ,0.001
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_unit_factor WHERE
config_emission_type_id =(SELECT id FROM static.t_ref_config_emissions_type WHERE
scope='1'
and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-422C')
)
and etype_unit1_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
and etype_unit2_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
);
insert into static.t_ref_config_emissions_type (
    scope,etype_id,etypeattr1_id,etype_unit1_id,etype_unit2_id,date_added,added_by,date_modified,modified_by)
select
    1
     ,(select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
     ,(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-422D')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(select 1 from static.t_ref_config_emissions_type
 where
 etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-422D')
 );

insert into static.t_ref_config_emissions_unit_factor
(config_emission_type_id,etype_unit1_id,etype_unit2_id,etype_unit1_factor,etype_unit2_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.t_ref_config_emissions_type WHERE
            scope='1'
                                                         and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
                                                         and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-422D')
    )
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,1.00
     ,0.001
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_unit_factor WHERE
config_emission_type_id =(SELECT id FROM static.t_ref_config_emissions_type WHERE
scope='1'
and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-422D')
)
and etype_unit1_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
and etype_unit2_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
);
insert into static.t_ref_config_emissions_type (
    scope,etype_id,etypeattr1_id,etype_unit1_id,etype_unit2_id,date_added,added_by,date_modified,modified_by)
select
    1
     ,(select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
     ,(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-422E')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(select 1 from static.t_ref_config_emissions_type
 where
 etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-422E')
 );

insert into static.t_ref_config_emissions_unit_factor
(config_emission_type_id,etype_unit1_id,etype_unit2_id,etype_unit1_factor,etype_unit2_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.t_ref_config_emissions_type WHERE
            scope='1'
                                                         and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
                                                         and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-422E')
    )
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,1.00
     ,0.001
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_unit_factor WHERE
config_emission_type_id =(SELECT id FROM static.t_ref_config_emissions_type WHERE
scope='1'
and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-422E')
)
and etype_unit1_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
and etype_unit2_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
);
insert into static.t_ref_config_emissions_type (
    scope,etype_id,etypeattr1_id,etype_unit1_id,etype_unit2_id,date_added,added_by,date_modified,modified_by)
select
    1
     ,(select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
     ,(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-423A')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(select 1 from static.t_ref_config_emissions_type
 where
 etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-423A')
 );

insert into static.t_ref_config_emissions_unit_factor
(config_emission_type_id,etype_unit1_id,etype_unit2_id,etype_unit1_factor,etype_unit2_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.t_ref_config_emissions_type WHERE
            scope='1'
                                                         and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
                                                         and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-423A')
    )
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,1.00
     ,0.001
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_unit_factor WHERE
config_emission_type_id =(SELECT id FROM static.t_ref_config_emissions_type WHERE
scope='1'
and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-423A')
)
and etype_unit1_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
and etype_unit2_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
);
insert into static.t_ref_config_emissions_type (
    scope,etype_id,etypeattr1_id,etype_unit1_id,etype_unit2_id,date_added,added_by,date_modified,modified_by)
select
    1
     ,(select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
     ,(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-424A')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(select 1 from static.t_ref_config_emissions_type
 where
 etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-424A')
 );

insert into static.t_ref_config_emissions_unit_factor
(config_emission_type_id,etype_unit1_id,etype_unit2_id,etype_unit1_factor,etype_unit2_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.t_ref_config_emissions_type WHERE
            scope='1'
                                                         and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
                                                         and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-424A')
    )
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,1.00
     ,0.001
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_unit_factor WHERE
config_emission_type_id =(SELECT id FROM static.t_ref_config_emissions_type WHERE
scope='1'
and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-424A')
)
and etype_unit1_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
and etype_unit2_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
);
insert into static.t_ref_config_emissions_type (
    scope,etype_id,etypeattr1_id,etype_unit1_id,etype_unit2_id,date_added,added_by,date_modified,modified_by)
select
    1
     ,(select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
     ,(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-425A')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(select 1 from static.t_ref_config_emissions_type
 where
 etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-425A')
 );

insert into static.t_ref_config_emissions_unit_factor
(config_emission_type_id,etype_unit1_id,etype_unit2_id,etype_unit1_factor,etype_unit2_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.t_ref_config_emissions_type WHERE
            scope='1'
                                                         and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
                                                         and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-425A')
    )
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,1.00
     ,0.001
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_unit_factor WHERE
config_emission_type_id =(SELECT id FROM static.t_ref_config_emissions_type WHERE
scope='1'
and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-425A')
)
and etype_unit1_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
and etype_unit2_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
);
insert into static.t_ref_config_emissions_type (
    scope,etype_id,etypeattr1_id,etype_unit1_id,etype_unit2_id,date_added,added_by,date_modified,modified_by)
select
    1
     ,(select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
     ,(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-426A')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(select 1 from static.t_ref_config_emissions_type
 where
 etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-426A')
 );

insert into static.t_ref_config_emissions_unit_factor
(config_emission_type_id,etype_unit1_id,etype_unit2_id,etype_unit1_factor,etype_unit2_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.t_ref_config_emissions_type WHERE
            scope='1'
                                                         and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
                                                         and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-426A')
    )
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,1.00
     ,0.001
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_unit_factor WHERE
config_emission_type_id =(SELECT id FROM static.t_ref_config_emissions_type WHERE
scope='1'
and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-426A')
)
and etype_unit1_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
and etype_unit2_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
);
insert into static.t_ref_config_emissions_type (
    scope,etype_id,etypeattr1_id,etype_unit1_id,etype_unit2_id,date_added,added_by,date_modified,modified_by)
select
    1
     ,(select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
     ,(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-427A')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(select 1 from static.t_ref_config_emissions_type
 where
 etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-427A')
 );

insert into static.t_ref_config_emissions_unit_factor
(config_emission_type_id,etype_unit1_id,etype_unit2_id,etype_unit1_factor,etype_unit2_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.t_ref_config_emissions_type WHERE
            scope='1'
                                                         and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
                                                         and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-427A')
    )
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,1.00
     ,0.001
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_unit_factor WHERE
config_emission_type_id =(SELECT id FROM static.t_ref_config_emissions_type WHERE
scope='1'
and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-427A')
)
and etype_unit1_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
and etype_unit2_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
);
insert into static.t_ref_config_emissions_type (
    scope,etype_id,etypeattr1_id,etype_unit1_id,etype_unit2_id,date_added,added_by,date_modified,modified_by)
select
    1
     ,(select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
     ,(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-428A')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(select 1 from static.t_ref_config_emissions_type
 where
 etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-428A')
 );

insert into static.t_ref_config_emissions_unit_factor
(config_emission_type_id,etype_unit1_id,etype_unit2_id,etype_unit1_factor,etype_unit2_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.t_ref_config_emissions_type WHERE
            scope='1'
                                                         and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
                                                         and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-428A')
    )
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,1.00
     ,0.001
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_unit_factor WHERE
config_emission_type_id =(SELECT id FROM static.t_ref_config_emissions_type WHERE
scope='1'
and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-428A')
)
and etype_unit1_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
and etype_unit2_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
);
insert into static.t_ref_config_emissions_type (
    scope,etype_id,etypeattr1_id,etype_unit1_id,etype_unit2_id,date_added,added_by,date_modified,modified_by)
select
    1
     ,(select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
     ,(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-429A')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(select 1 from static.t_ref_config_emissions_type
 where
 etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-429A')
 );

insert into static.t_ref_config_emissions_unit_factor
(config_emission_type_id,etype_unit1_id,etype_unit2_id,etype_unit1_factor,etype_unit2_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.t_ref_config_emissions_type WHERE
            scope='1'
                                                         and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
                                                         and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-429A')
    )
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,1.00
     ,0.001
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_unit_factor WHERE
config_emission_type_id =(SELECT id FROM static.t_ref_config_emissions_type WHERE
scope='1'
and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-429A')
)
and etype_unit1_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
and etype_unit2_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
);
insert into static.t_ref_config_emissions_type (
    scope,etype_id,etypeattr1_id,etype_unit1_id,etype_unit2_id,date_added,added_by,date_modified,modified_by)
select
    1
     ,(select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
     ,(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-430A')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(select 1 from static.t_ref_config_emissions_type
 where
 etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-430A')
 );

insert into static.t_ref_config_emissions_unit_factor
(config_emission_type_id,etype_unit1_id,etype_unit2_id,etype_unit1_factor,etype_unit2_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.t_ref_config_emissions_type WHERE
            scope='1'
                                                         and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
                                                         and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-430A')
    )
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,1.00
     ,0.001
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_unit_factor WHERE
config_emission_type_id =(SELECT id FROM static.t_ref_config_emissions_type WHERE
scope='1'
and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-430A')
)
and etype_unit1_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
and etype_unit2_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
);
insert into static.t_ref_config_emissions_type (
    scope,etype_id,etypeattr1_id,etype_unit1_id,etype_unit2_id,date_added,added_by,date_modified,modified_by)
select
    1
     ,(select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
     ,(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-431A')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(select 1 from static.t_ref_config_emissions_type
 where
 etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-431A')
 );

insert into static.t_ref_config_emissions_unit_factor
(config_emission_type_id,etype_unit1_id,etype_unit2_id,etype_unit1_factor,etype_unit2_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.t_ref_config_emissions_type WHERE
            scope='1'
                                                         and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
                                                         and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-431A')
    )
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,1.00
     ,0.001
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_unit_factor WHERE
config_emission_type_id =(SELECT id FROM static.t_ref_config_emissions_type WHERE
scope='1'
and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-431A')
)
and etype_unit1_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
and etype_unit2_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
);
insert into static.t_ref_config_emissions_type (
    scope,etype_id,etypeattr1_id,etype_unit1_id,etype_unit2_id,date_added,added_by,date_modified,modified_by)
select
    1
     ,(select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
     ,(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-434A')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(select 1 from static.t_ref_config_emissions_type
 where
 etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-434A')
 );

insert into static.t_ref_config_emissions_unit_factor
(config_emission_type_id,etype_unit1_id,etype_unit2_id,etype_unit1_factor,etype_unit2_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.t_ref_config_emissions_type WHERE
            scope='1'
                                                         and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
                                                         and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-434A')
    )
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,1.00
     ,0.001
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_unit_factor WHERE
config_emission_type_id =(SELECT id FROM static.t_ref_config_emissions_type WHERE
scope='1'
and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-434A')
)
and etype_unit1_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
and etype_unit2_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
);
insert into static.t_ref_config_emissions_type (
    scope,etype_id,etypeattr1_id,etype_unit1_id,etype_unit2_id,date_added,added_by,date_modified,modified_by)
select
    1
     ,(select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
     ,(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-435A')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(select 1 from static.t_ref_config_emissions_type
 where
 etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-435A')
 );

insert into static.t_ref_config_emissions_unit_factor
(config_emission_type_id,etype_unit1_id,etype_unit2_id,etype_unit1_factor,etype_unit2_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.t_ref_config_emissions_type WHERE
            scope='1'
                                                         and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
                                                         and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-435A')
    )
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,1.00
     ,0.001
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_unit_factor WHERE
config_emission_type_id =(SELECT id FROM static.t_ref_config_emissions_type WHERE
scope='1'
and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-435A')
)
and etype_unit1_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
and etype_unit2_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
);
insert into static.t_ref_config_emissions_type (
    scope,etype_id,etypeattr1_id,etype_unit1_id,etype_unit2_id,date_added,added_by,date_modified,modified_by)
select
    1
     ,(select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
     ,(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-437A')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(select 1 from static.t_ref_config_emissions_type
 where
 etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-437A')
 );

insert into static.t_ref_config_emissions_unit_factor
(config_emission_type_id,etype_unit1_id,etype_unit2_id,etype_unit1_factor,etype_unit2_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.t_ref_config_emissions_type WHERE
            scope='1'
                                                         and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
                                                         and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-437A')
    )
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,1.00
     ,0.001
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_unit_factor WHERE
config_emission_type_id =(SELECT id FROM static.t_ref_config_emissions_type WHERE
scope='1'
and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-437A')
)
and etype_unit1_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
and etype_unit2_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
);
insert into static.t_ref_config_emissions_type (
    scope,etype_id,etypeattr1_id,etype_unit1_id,etype_unit2_id,date_added,added_by,date_modified,modified_by)
select
    1
     ,(select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
     ,(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-438A')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(select 1 from static.t_ref_config_emissions_type
 where
 etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-438A')
 );

insert into static.t_ref_config_emissions_unit_factor
(config_emission_type_id,etype_unit1_id,etype_unit2_id,etype_unit1_factor,etype_unit2_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.t_ref_config_emissions_type WHERE
            scope='1'
                                                         and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
                                                         and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-438A')
    )
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,1.00
     ,0.001
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_unit_factor WHERE
config_emission_type_id =(SELECT id FROM static.t_ref_config_emissions_type WHERE
scope='1'
and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-438A')
)
and etype_unit1_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
and etype_unit2_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
);
insert into static.t_ref_config_emissions_type (
    scope,etype_id,etypeattr1_id,etype_unit1_id,etype_unit2_id,date_added,added_by,date_modified,modified_by)
select
    1
     ,(select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
     ,(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-439A')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(select 1 from static.t_ref_config_emissions_type
 where
 etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-439A')
 );

insert into static.t_ref_config_emissions_unit_factor
(config_emission_type_id,etype_unit1_id,etype_unit2_id,etype_unit1_factor,etype_unit2_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.t_ref_config_emissions_type WHERE
            scope='1'
                                                         and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
                                                         and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-439A')
    )
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,1.00
     ,0.001
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_unit_factor WHERE
config_emission_type_id =(SELECT id FROM static.t_ref_config_emissions_type WHERE
scope='1'
and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-439A')
)
and etype_unit1_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
and etype_unit2_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
);
insert into static.t_ref_config_emissions_type (
    scope,etype_id,etypeattr1_id,etype_unit1_id,etype_unit2_id,date_added,added_by,date_modified,modified_by)
select
    1
     ,(select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
     ,(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-439A')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(select 1 from static.t_ref_config_emissions_type
 where
 etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-439A')
 );

insert into static.t_ref_config_emissions_unit_factor
(config_emission_type_id,etype_unit1_id,etype_unit2_id,etype_unit1_factor,etype_unit2_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.t_ref_config_emissions_type WHERE
            scope='1'
                                                         and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
                                                         and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-439A')
    )
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,1.00
     ,0.001
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_unit_factor WHERE
config_emission_type_id =(SELECT id FROM static.t_ref_config_emissions_type WHERE
scope='1'
and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-439A')
)
and etype_unit1_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
and etype_unit2_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
);
insert into static.t_ref_config_emissions_type (
    scope,etype_id,etypeattr1_id,etype_unit1_id,etype_unit2_id,date_added,added_by,date_modified,modified_by)
select
    1
     ,(select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
     ,(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-439A')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(select 1 from static.t_ref_config_emissions_type
 where
 etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-439A')
 );

insert into static.t_ref_config_emissions_unit_factor
(config_emission_type_id,etype_unit1_id,etype_unit2_id,etype_unit1_factor,etype_unit2_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.t_ref_config_emissions_type WHERE
            scope='1'
                                                         and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
                                                         and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-439A')
    )
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,1.00
     ,0.001
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_unit_factor WHERE
config_emission_type_id =(SELECT id FROM static.t_ref_config_emissions_type WHERE
scope='1'
and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-439A')
)
and etype_unit1_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
and etype_unit2_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
);
insert into static.t_ref_config_emissions_type (
    scope,etype_id,etypeattr1_id,etype_unit1_id,etype_unit2_id,date_added,added_by,date_modified,modified_by)
select
    1
     ,(select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
     ,(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-444A')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(select 1 from static.t_ref_config_emissions_type
 where
 etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-444A')
 );

insert into static.t_ref_config_emissions_unit_factor
(config_emission_type_id,etype_unit1_id,etype_unit2_id,etype_unit1_factor,etype_unit2_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.t_ref_config_emissions_type WHERE
            scope='1'
                                                         and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
                                                         and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-444A')
    )
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,1.00
     ,0.001
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_unit_factor WHERE
config_emission_type_id =(SELECT id FROM static.t_ref_config_emissions_type WHERE
scope='1'
and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-444A')
)
and etype_unit1_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
and etype_unit2_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
);
insert into static.t_ref_config_emissions_type (
    scope,etype_id,etypeattr1_id,etype_unit1_id,etype_unit2_id,date_added,added_by,date_modified,modified_by)
select
    1
     ,(select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
     ,(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-445A')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(select 1 from static.t_ref_config_emissions_type
 where
 etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-445A')
 );

insert into static.t_ref_config_emissions_unit_factor
(config_emission_type_id,etype_unit1_id,etype_unit2_id,etype_unit1_factor,etype_unit2_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.t_ref_config_emissions_type WHERE
            scope='1'
                                                         and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
                                                         and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-445A')
    )
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,1.00
     ,0.001
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_unit_factor WHERE
config_emission_type_id =(SELECT id FROM static.t_ref_config_emissions_type WHERE
scope='1'
and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-445A')
)
and etype_unit1_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
and etype_unit2_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
);
insert into static.t_ref_config_emissions_type (
    scope,etype_id,etypeattr1_id,etype_unit1_id,etype_unit2_id,date_added,added_by,date_modified,modified_by)
select
    1
     ,(select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
     ,(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-500')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(select 1 from static.t_ref_config_emissions_type
 where
 etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-500')
 );

insert into static.t_ref_config_emissions_unit_factor
(config_emission_type_id,etype_unit1_id,etype_unit2_id,etype_unit1_factor,etype_unit2_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.t_ref_config_emissions_type WHERE
            scope='1'
                                                         and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
                                                         and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-500')
    )
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,1.00
     ,0.001
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_unit_factor WHERE
config_emission_type_id =(SELECT id FROM static.t_ref_config_emissions_type WHERE
scope='1'
and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-500')
)
and etype_unit1_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
and etype_unit2_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
);
insert into static.t_ref_config_emissions_type (
    scope,etype_id,etypeattr1_id,etype_unit1_id,etype_unit2_id,date_added,added_by,date_modified,modified_by)
select
    1
     ,(select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
     ,(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-503')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(select 1 from static.t_ref_config_emissions_type
 where
 etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-503')
 );

insert into static.t_ref_config_emissions_unit_factor
(config_emission_type_id,etype_unit1_id,etype_unit2_id,etype_unit1_factor,etype_unit2_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.t_ref_config_emissions_type WHERE
            scope='1'
                                                         and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
                                                         and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-503')
    )
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,1.00
     ,0.001
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_unit_factor WHERE
config_emission_type_id =(SELECT id FROM static.t_ref_config_emissions_type WHERE
scope='1'
and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-503')
)
and etype_unit1_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
and etype_unit2_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
);
insert into static.t_ref_config_emissions_type (
    scope,etype_id,etypeattr1_id,etype_unit1_id,etype_unit2_id,date_added,added_by,date_modified,modified_by)
select
    1
     ,(select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
     ,(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-504')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(select 1 from static.t_ref_config_emissions_type
 where
 etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-504')
 );

insert into static.t_ref_config_emissions_unit_factor
(config_emission_type_id,etype_unit1_id,etype_unit2_id,etype_unit1_factor,etype_unit2_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.t_ref_config_emissions_type WHERE
            scope='1'
                                                         and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
                                                         and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-504')
    )
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,1.00
     ,0.001
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_unit_factor WHERE
config_emission_type_id =(SELECT id FROM static.t_ref_config_emissions_type WHERE
scope='1'
and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-504')
)
and etype_unit1_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
and etype_unit2_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
);
insert into static.t_ref_config_emissions_type (
    scope,etype_id,etypeattr1_id,etype_unit1_id,etype_unit2_id,date_added,added_by,date_modified,modified_by)
select
    1
     ,(select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
     ,(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-507')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(select 1 from static.t_ref_config_emissions_type
 where
 etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-507')
 );

insert into static.t_ref_config_emissions_unit_factor
(config_emission_type_id,etype_unit1_id,etype_unit2_id,etype_unit1_factor,etype_unit2_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.t_ref_config_emissions_type WHERE
            scope='1'
                                                         and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
                                                         and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-507')
    )
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,1.00
     ,0.001
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_unit_factor WHERE
config_emission_type_id =(SELECT id FROM static.t_ref_config_emissions_type WHERE
scope='1'
and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-507')
)
and etype_unit1_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
and etype_unit2_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
);
insert into static.t_ref_config_emissions_type (
    scope,etype_id,etypeattr1_id,etype_unit1_id,etype_unit2_id,date_added,added_by,date_modified,modified_by)
select
    1
     ,(select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
     ,(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-507A')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(select 1 from static.t_ref_config_emissions_type
 where
 etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-507A')
 );

insert into static.t_ref_config_emissions_unit_factor
(config_emission_type_id,etype_unit1_id,etype_unit2_id,etype_unit1_factor,etype_unit2_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.t_ref_config_emissions_type WHERE
            scope='1'
                                                         and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
                                                         and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-507A')
    )
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,1.00
     ,0.001
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_unit_factor WHERE
config_emission_type_id =(SELECT id FROM static.t_ref_config_emissions_type WHERE
scope='1'
and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-507A')
)
and etype_unit1_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
and etype_unit2_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
);
insert into static.t_ref_config_emissions_type (
    scope,etype_id,etypeattr1_id,etype_unit1_id,etype_unit2_id,date_added,added_by,date_modified,modified_by)
select
    1
     ,(select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
     ,(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-509')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(select 1 from static.t_ref_config_emissions_type
 where
 etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-509')
 );

insert into static.t_ref_config_emissions_unit_factor
(config_emission_type_id,etype_unit1_id,etype_unit2_id,etype_unit1_factor,etype_unit2_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.t_ref_config_emissions_type WHERE
            scope='1'
                                                         and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
                                                         and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-509')
    )
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,1.00
     ,0.001
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_unit_factor WHERE
config_emission_type_id =(SELECT id FROM static.t_ref_config_emissions_type WHERE
scope='1'
and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-509')
)
and etype_unit1_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
and etype_unit2_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
);
insert into static.t_ref_config_emissions_type (
    scope,etype_id,etypeattr1_id,etype_unit1_id,etype_unit2_id,date_added,added_by,date_modified,modified_by)
select
    1
     ,(select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
     ,(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-509A')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(select 1 from static.t_ref_config_emissions_type
 where
 etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-509A')
 );

insert into static.t_ref_config_emissions_unit_factor
(config_emission_type_id,etype_unit1_id,etype_unit2_id,etype_unit1_factor,etype_unit2_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.t_ref_config_emissions_type WHERE
            scope='1'
                                                         and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
                                                         and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-509A')
    )
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,1.00
     ,0.001
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_unit_factor WHERE
config_emission_type_id =(SELECT id FROM static.t_ref_config_emissions_type WHERE
scope='1'
and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-509A')
)
and etype_unit1_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
and etype_unit2_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
);
insert into static.t_ref_config_emissions_type (
    scope,etype_id,etypeattr1_id,etype_unit1_id,etype_unit2_id,date_added,added_by,date_modified,modified_by)
select
    1
     ,(select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
     ,(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-512A')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(select 1 from static.t_ref_config_emissions_type
 where
 etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
 and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-512A')
 );

insert into static.t_ref_config_emissions_unit_factor
(config_emission_type_id,etype_unit1_id,etype_unit2_id,etype_unit1_factor,etype_unit2_factor,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.t_ref_config_emissions_type WHERE
            scope='1'
                                                         and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
                                                         and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-512A')
    )
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,1.00
     ,0.001
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
    WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_config_emissions_unit_factor WHERE
config_emission_type_id =(SELECT id FROM static.t_ref_config_emissions_type WHERE
scope='1'
and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers')
and etypeattr1_id =(select list_id from static.t_ref_list where list_key='impactm_refrigerant_aerosols' and list_value='R-512A')
)
and etype_unit1_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kg')
and etype_unit2_id=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
);







