
INSERT INTO static.t_ref_config_emissions_type
(scope,etype_id,etypeattr_id1,etypeattr_id2,etypeattr_id3,etypeattr_id4,etype_unit_id1,etype_unit_id2,date_added,added_by,date_modified,modified_by)
SELECT
    '3'
     ,(select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope3_business_travel')
     ,(select list_id from static.t_ref_list where list_key='impactm_business_travel_transport_mode' and list_value='Motorcycle/Scooter')
     ,null
     ,null
     ,null
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='km')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,now()
     ,'songjuan'
     ,now()
     ,'songjuan'
    WHERE NOT EXISTS
	(SELECT 1 FROM static.t_ref_config_emissions_type WHERE
	 scope='3'
	 and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope3_business_travel')
	 and etypeattr_id1 =(select list_id from static.t_ref_list where list_key='impactm_business_travel_transport_mode' and list_value='Motorcycle/Scooter')
	 and etype_unit_id1 = (select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='km')
	 and etype_unit_id2 = (select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
);


insert into static.t_ref_config_emissions_unit_factor
(config_emission_type_id,etype_unit_id1,etype_unit_id2,etype_unit_factor1,etype_unit_factor2,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.t_ref_config_emissions_type WHERE
            scope='3'
                                                         and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope3_business_travel')
                                                         and etypeattr_id1 =(select list_id from static.t_ref_list where list_key='impactm_business_travel_transport_mode' and list_value='Motorcycle/Scooter')
                                                         and etype_unit_id1 = (select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='km')
                                                         and etype_unit_id2 =(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
    )
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='km')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,1.00
     ,0.001
     ,now()
     ,'songjuan'
     ,now()
     ,'songjuan'
    WHERE NOT EXISTS
	(SELECT 1 FROM static.t_ref_config_emissions_unit_factor WHERE
	 config_emission_type_id=(SELECT id FROM static.t_ref_config_emissions_type WHERE
							 scope='3'
							 and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope3_business_travel')
							 and etypeattr_id1 =(select list_id from static.t_ref_list where list_key='impactm_business_travel_transport_mode' and list_value='Motorcycle/Scooter')
							 and etype_unit_id1 = (select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='km')
							 and etype_unit_id2 =(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
						 )
	and etype_unit_id1=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='km')
	 and etype_unit_id2=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
);


insert into static.t_ref_config_emissions_unit_factor
(config_emission_type_id,etype_unit_id1,etype_unit_id2,etype_unit_factor1,etype_unit_factor2,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.t_ref_config_emissions_type WHERE
            scope='3'
                                                         and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope3_business_travel')
                                                         and etypeattr_id1 =(select list_id from static.t_ref_list where list_key='impactm_business_travel_transport_mode' and list_value='Motorcycle/Scooter')
                                                         and etype_unit_id1 = (select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='km')
                                                         and etype_unit_id2 =(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
    )
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='miles')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,1.63
     ,0.001
     ,now()
     ,'songjuan'
     ,now()
     ,'songjuan'
    WHERE NOT EXISTS
	(SELECT 1 FROM static.t_ref_config_emissions_unit_factor WHERE
	 config_emission_type_id=(SELECT id FROM static.t_ref_config_emissions_type WHERE
							 scope='3'
							 and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope3_business_travel')
							 and etypeattr_id1 =(select list_id from static.t_ref_list where list_key='impactm_business_travel_transport_mode' and list_value='Motorcycle/Scooter')
							 and etype_unit_id1 = (select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='km')
							 and etype_unit_id2 =(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
						 )
	and etype_unit_id1=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='miles')
	 and etype_unit_id2=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
);


INSERT INTO static.t_ref_config_emissions_type
(scope,etype_id,etypeattr_id1,etypeattr_id2,etypeattr_id3,etypeattr_id4,etype_unit_id1,etype_unit_id2,date_added,added_by,date_modified,modified_by)
SELECT
    '3'
     ,(select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope3_business_travel')
     ,(select list_id from static.t_ref_list where list_key='impactm_business_travel_transport_mode' and list_value='Three wheeler')
     ,null
     ,null
     ,null
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='km')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,now()
     ,'songjuan'
     ,now()
     ,'songjuan'
    WHERE NOT EXISTS
	(SELECT 1 FROM static.t_ref_config_emissions_type WHERE
	 scope='3'
	 and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope3_business_travel')
	 and etypeattr_id1 =(select list_id from static.t_ref_list where list_key='impactm_business_travel_transport_mode' and list_value='Three wheeler')
	 and etype_unit_id1 = (select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='km')
	 and etype_unit_id2 = (select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
);


insert into static.t_ref_config_emissions_unit_factor
(config_emission_type_id,etype_unit_id1,etype_unit_id2,etype_unit_factor1,etype_unit_factor2,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.t_ref_config_emissions_type WHERE
            scope='3'
                                                         and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope3_business_travel')
                                                         and etypeattr_id1 =(select list_id from static.t_ref_list where list_key='impactm_business_travel_transport_mode' and list_value='Three wheeler')
                                                         and etype_unit_id1 = (select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='km')
                                                         and etype_unit_id2 =(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
    )
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='km')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,1.00
     ,0.001
     ,now()
     ,'songjuan'
     ,now()
     ,'songjuan'
    WHERE NOT EXISTS
	(SELECT 1 FROM static.t_ref_config_emissions_unit_factor WHERE
	 config_emission_type_id=(SELECT id FROM static.t_ref_config_emissions_type WHERE
							 scope='3'
							 and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope3_business_travel')
							 and etypeattr_id1 =(select list_id from static.t_ref_list where list_key='impactm_business_travel_transport_mode' and list_value='Three wheeler')
							 and etype_unit_id1 = (select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='km')
							 and etype_unit_id2 =(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
						 )
	and etype_unit_id1=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='km')
	 and etype_unit_id2=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
);

INSERT INTO static.t_ref_config_emissions_type
(scope,etype_id,etypeattr_id1,etypeattr_id2,etypeattr_id3,etypeattr_id4,etype_unit_id1,etype_unit_id2,date_added,added_by,date_modified,modified_by)
SELECT
    '3'
     ,(select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope3_business_travel')
     ,(select list_id from static.t_ref_list where list_key='impactm_business_travel_transport_mode' and list_value='Car - petrol')
     ,null
     ,null
     ,null
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='km')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,now()
     ,'songjuan'
     ,now()
     ,'songjuan'
    WHERE NOT EXISTS
	(SELECT 1 FROM static.t_ref_config_emissions_type WHERE
	 scope='3'
	 and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope3_business_travel')
	 and etypeattr_id1 =(select list_id from static.t_ref_list where list_key='impactm_business_travel_transport_mode' and list_value='Car - petrol')
	 and etype_unit_id1 = (select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='km')
	 and etype_unit_id2 = (select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
);

insert into static.t_ref_config_emissions_unit_factor
(config_emission_type_id,etype_unit_id1,etype_unit_id2,etype_unit_factor1,etype_unit_factor2,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.t_ref_config_emissions_type WHERE
            scope='3'
                                                         and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope3_business_travel')
                                                         and etypeattr_id1 =(select list_id from static.t_ref_list where list_key='impactm_business_travel_transport_mode' and list_value='Car - petrol')
                                                         and etype_unit_id1 = (select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='km')
                                                         and etype_unit_id2 =(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
    )
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='km')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,1.00
     ,0.001
     ,now()
     ,'songjuan'
     ,now()
     ,'songjuan'
    WHERE NOT EXISTS
	(SELECT 1 FROM static.t_ref_config_emissions_unit_factor WHERE
	 config_emission_type_id=(SELECT id FROM static.t_ref_config_emissions_type WHERE
							 scope='3'
							 and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope3_business_travel')
							 and etypeattr_id1 =(select list_id from static.t_ref_list where list_key='impactm_business_travel_transport_mode' and list_value='Car - petrol')
							 and etype_unit_id1 = (select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='km')
							 and etype_unit_id2 =(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
						 )
	and etype_unit_id1=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='km')
	 and etype_unit_id2=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
);


insert into static.t_ref_config_emissions_unit_factor
(config_emission_type_id,etype_unit_id1,etype_unit_id2,etype_unit_factor1,etype_unit_factor2,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.t_ref_config_emissions_type WHERE
            scope='3'
                                                         and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope3_business_travel')
                                                         and etypeattr_id1 =(select list_id from static.t_ref_list where list_key='impactm_business_travel_transport_mode' and list_value='Car - petrol')
                                                         and etype_unit_id1 = (select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='km')
                                                         and etype_unit_id2 =(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
    )
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='miles')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,1.63
     ,0.001
     ,now()
     ,'songjuan'
     ,now()
     ,'songjuan'
    WHERE NOT EXISTS
	(SELECT 1 FROM static.t_ref_config_emissions_unit_factor WHERE
	 config_emission_type_id=(SELECT id FROM static.t_ref_config_emissions_type WHERE
							 scope='3'
							 and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope3_business_travel')
							 and etypeattr_id1 =(select list_id from static.t_ref_list where list_key='impactm_business_travel_transport_mode' and list_value='Car - petrol')
							 and etype_unit_id1 = (select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='km')
							 and etype_unit_id2 =(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
						 )
	and etype_unit_id1=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='miles')
	 and etype_unit_id2=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
);

INSERT INTO static.t_ref_config_emissions_type
(scope,etype_id,etypeattr_id1,etypeattr_id2,etypeattr_id3,etypeattr_id4,etype_unit_id1,etype_unit_id2,date_added,added_by,date_modified,modified_by)
SELECT
    '3'
     ,(select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope3_business_travel')
     ,(select list_id from static.t_ref_list where list_key='impactm_business_travel_transport_mode' and list_value='Car - diesel')
     ,null
     ,null
     ,null
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='km')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,now()
     ,'songjuan'
     ,now()
     ,'songjuan'
    WHERE NOT EXISTS
	(SELECT 1 FROM static.t_ref_config_emissions_type WHERE
	 scope='3'
	 and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope3_business_travel')
	 and etypeattr_id1 =(select list_id from static.t_ref_list where list_key='impactm_business_travel_transport_mode' and list_value='Car - diesel')
	 and etype_unit_id1 = (select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='km')
	 and etype_unit_id2 = (select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
);

insert into static.t_ref_config_emissions_unit_factor
(config_emission_type_id,etype_unit_id1,etype_unit_id2,etype_unit_factor1,etype_unit_factor2,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.t_ref_config_emissions_type WHERE
            scope='3'
                                                         and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope3_business_travel')
                                                         and etypeattr_id1 =(select list_id from static.t_ref_list where list_key='impactm_business_travel_transport_mode' and list_value='Car - diesel')
                                                         and etype_unit_id1 = (select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='km')
                                                         and etype_unit_id2 =(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
    )
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='km')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,1.00
     ,0.001
     ,now()
     ,'songjuan'
     ,now()
     ,'songjuan'
    WHERE NOT EXISTS
	(SELECT 1 FROM static.t_ref_config_emissions_unit_factor WHERE
	 config_emission_type_id=(SELECT id FROM static.t_ref_config_emissions_type WHERE
							 scope='3'
							 and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope3_business_travel')
							 and etypeattr_id1 =(select list_id from static.t_ref_list where list_key='impactm_business_travel_transport_mode' and list_value='Car - diesel')
							 and etype_unit_id1 = (select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='km')
							 and etype_unit_id2 =(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
						 )
	and etype_unit_id1=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='km')
	 and etype_unit_id2=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
);


insert into static.t_ref_config_emissions_unit_factor
(config_emission_type_id,etype_unit_id1,etype_unit_id2,etype_unit_factor1,etype_unit_factor2,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.t_ref_config_emissions_type WHERE
            scope='3'
                                                         and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope3_business_travel')
                                                         and etypeattr_id1 =(select list_id from static.t_ref_list where list_key='impactm_business_travel_transport_mode' and list_value='Car - diesel')
                                                         and etype_unit_id1 = (select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='km')
                                                         and etype_unit_id2 =(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
    )
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='miles')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,1.63
     ,0.001
     ,now()
     ,'songjuan'
     ,now()
     ,'songjuan'
    WHERE NOT EXISTS
	(SELECT 1 FROM static.t_ref_config_emissions_unit_factor WHERE
	 config_emission_type_id=(SELECT id FROM static.t_ref_config_emissions_type WHERE
							 scope='3'
							 and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope3_business_travel')
							 and etypeattr_id1 =(select list_id from static.t_ref_list where list_key='impactm_business_travel_transport_mode' and list_value='Car - diesel')
							 and etype_unit_id1 = (select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='km')
							 and etype_unit_id2 =(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
						 )
	and etype_unit_id1=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='miles')
	 and etype_unit_id2=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
);

INSERT INTO static.t_ref_config_emissions_type
(scope,etype_id,etypeattr_id1,etypeattr_id2,etypeattr_id3,etypeattr_id4,etype_unit_id1,etype_unit_id2,date_added,added_by,date_modified,modified_by)
SELECT
    '3'
     ,(select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope3_business_travel')
     ,(select list_id from static.t_ref_list where list_key='impactm_business_travel_transport_mode' and list_value='Bus')
     ,null
     ,null
     ,null
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='km')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,now()
     ,'songjuan'
     ,now()
     ,'songjuan'
    WHERE NOT EXISTS
	(SELECT 1 FROM static.t_ref_config_emissions_type WHERE
	 scope='3'
	 and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope3_business_travel')
	 and etypeattr_id1 =(select list_id from static.t_ref_list where list_key='impactm_business_travel_transport_mode' and list_value='Bus')
	 and etype_unit_id1 = (select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='km')
	 and etype_unit_id2 = (select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
);

insert into static.t_ref_config_emissions_unit_factor
(config_emission_type_id,etype_unit_id1,etype_unit_id2,etype_unit_factor1,etype_unit_factor2,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.t_ref_config_emissions_type WHERE
            scope='3'
                                                         and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope3_business_travel')
                                                         and etypeattr_id1 =(select list_id from static.t_ref_list where list_key='impactm_business_travel_transport_mode' and list_value='Bus')
                                                         and etype_unit_id1 = (select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='km')
                                                         and etype_unit_id2 =(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
    )
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='km')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,1.00
     ,0.001
     ,now()
     ,'songjuan'
     ,now()
     ,'songjuan'
    WHERE NOT EXISTS
	(SELECT 1 FROM static.t_ref_config_emissions_unit_factor WHERE
	 config_emission_type_id=(SELECT id FROM static.t_ref_config_emissions_type WHERE
							 scope='3'
							 and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope3_business_travel')
							 and etypeattr_id1 =(select list_id from static.t_ref_list where list_key='impactm_business_travel_transport_mode' and list_value='Bus')
							 and etype_unit_id1 = (select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='km')
							 and etype_unit_id2 =(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
						 )
	and etype_unit_id1=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='km')
	 and etype_unit_id2=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
);


insert into static.t_ref_config_emissions_unit_factor
(config_emission_type_id,etype_unit_id1,etype_unit_id2,etype_unit_factor1,etype_unit_factor2,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.t_ref_config_emissions_type WHERE
            scope='3'
                                                         and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope3_business_travel')
                                                         and etypeattr_id1 =(select list_id from static.t_ref_list where list_key='impactm_business_travel_transport_mode' and list_value='Bus')
                                                         and etype_unit_id1 = (select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='km')
                                                         and etype_unit_id2 =(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
    )
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='miles')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,1.63
     ,0.001
     ,now()
     ,'songjuan'
     ,now()
     ,'songjuan'
    WHERE NOT EXISTS
	(SELECT 1 FROM static.t_ref_config_emissions_unit_factor WHERE
	 config_emission_type_id=(SELECT id FROM static.t_ref_config_emissions_type WHERE
							 scope='3'
							 and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope3_business_travel')
							 and etypeattr_id1 =(select list_id from static.t_ref_list where list_key='impactm_business_travel_transport_mode' and list_value='Bus')
							 and etype_unit_id1 = (select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='km')
							 and etype_unit_id2 =(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
						 )
	and etype_unit_id1=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='miles')
	 and etype_unit_id2=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
);

INSERT INTO static.t_ref_config_emissions_type
(scope,etype_id,etypeattr_id1,etypeattr_id2,etypeattr_id3,etypeattr_id4,etype_unit_id1,etype_unit_id2,date_added,added_by,date_modified,modified_by)
SELECT
    '3'
     ,(select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope3_business_travel')
     ,(select list_id from static.t_ref_list where list_key='impactm_business_travel_transport_mode' and list_value='Subway/Metro/Train')
     ,null
     ,null
     ,null
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='km')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,now()
     ,'songjuan'
     ,now()
     ,'songjuan'
    WHERE NOT EXISTS
	(SELECT 1 FROM static.t_ref_config_emissions_type WHERE
	 scope='3'
	 and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope3_business_travel')
	 and etypeattr_id1 =(select list_id from static.t_ref_list where list_key='impactm_business_travel_transport_mode' and list_value='Subway/Metro/Train')
	 and etype_unit_id1 = (select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='km')
	 and etype_unit_id2 = (select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
);

insert into static.t_ref_config_emissions_unit_factor
(config_emission_type_id,etype_unit_id1,etype_unit_id2,etype_unit_factor1,etype_unit_factor2,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.t_ref_config_emissions_type WHERE
            scope='3'
                                                         and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope3_business_travel')
                                                         and etypeattr_id1 =(select list_id from static.t_ref_list where list_key='impactm_business_travel_transport_mode' and list_value='Subway/Metro/Train')
                                                         and etype_unit_id1 = (select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='km')
                                                         and etype_unit_id2 =(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
    )
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='km')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,1.00
     ,0.001
     ,now()
     ,'songjuan'
     ,now()
     ,'songjuan'
    WHERE NOT EXISTS
	(SELECT 1 FROM static.t_ref_config_emissions_unit_factor WHERE
	 config_emission_type_id=(SELECT id FROM static.t_ref_config_emissions_type WHERE
							 scope='3'
							 and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope3_business_travel')
							 and etypeattr_id1 =(select list_id from static.t_ref_list where list_key='impactm_business_travel_transport_mode' and list_value='Subway/Metro/Train')
							 and etype_unit_id1 = (select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='km')
							 and etype_unit_id2 =(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
						 )
	and etype_unit_id1=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='km')
	 and etype_unit_id2=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
);


insert into static.t_ref_config_emissions_unit_factor
(config_emission_type_id,etype_unit_id1,etype_unit_id2,etype_unit_factor1,etype_unit_factor2,date_added,added_by,date_modified,modified_by)
SELECT
    (SELECT id FROM static.t_ref_config_emissions_type WHERE
            scope='3'
                                                         and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope3_business_travel')
                                                         and etypeattr_id1 =(select list_id from static.t_ref_list where list_key='impactm_business_travel_transport_mode' and list_value='Subway/Metro/Train')
                                                         and etype_unit_id1 = (select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='km')
                                                         and etype_unit_id2 =(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
    )
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='miles')
     ,(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
     ,1.63
     ,0.001
     ,now()
     ,'songjuan'
     ,now()
     ,'songjuan'
    WHERE NOT EXISTS
	(SELECT 1 FROM static.t_ref_config_emissions_unit_factor WHERE
	 config_emission_type_id=(SELECT id FROM static.t_ref_config_emissions_type WHERE
							 scope='3'
							 and etype_id = (select list_id from static.t_ref_list where list_key='impactm_emission_type' and list_value='Scope3_business_travel')
							 and etypeattr_id1 =(select list_id from static.t_ref_list where list_key='impactm_business_travel_transport_mode' and list_value='Subway/Metro/Train')
							 and etype_unit_id1 = (select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='km')
							 and etype_unit_id2 =(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
						 )
	and etype_unit_id1=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='miles')
	 and etype_unit_id2=(select list_id from static.t_ref_list where list_key='impactm_measurement_unit' and list_value='kgCO2e')
);