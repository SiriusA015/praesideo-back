CREATE TABLE IF NOT EXISTS static.t_ref_continent
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    continent character varying(100) COLLATE pg_catalog."default" NOT NULL,
    date_added timestamp without time zone NOT NULL,
    added_by character varying(100) COLLATE pg_catalog."default" NOT NULL,
    date_modified timestamp without time zone NOT NULL,
    modified_by character varying(100) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT t_ref_continent_pkey PRIMARY KEY (id)
    );
CREATE TABLE IF NOT EXISTS static.t_ref_regions
(
    id integer NOT NULL,
    region character varying(200) COLLATE pg_catalog."default",
    continent_id integer,
    CONSTRAINT t_ref_regions_pkey1 PRIMARY KEY (id),
    CONSTRAINT fk_t_ref_regions_continent_id FOREIGN KEY (continent_id)
    REFERENCES static.t_ref_continent (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    );
CREATE TABLE IF NOT EXISTS static.t_ref_countries
(
    id integer NOT NULL,
    country character varying(400) COLLATE pg_catalog."default" NOT NULL,
    iso_code character varying(3) COLLATE pg_catalog."default" NOT NULL,
    region_id integer,
    CONSTRAINT t_ref_countries_pkey PRIMARY KEY (id),
    CONSTRAINT fk_region_id FOREIGN KEY (region_id)
    REFERENCES static.t_ref_regions (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    );
create table if not exists static.t_ref_list
(
    list_id serial not null constraint pkey_t_ref_list primary key
    ,list_key 		varchar(100)
    ,list_value 	varchar(500)
    ,date_added 	TIMESTAMP
    ,added_by 		varchar(100)
    ,date_modified 	TIMESTAMP
    ,modified_by 	varchar(100)
    );

insert into static.t_ref_list (list_key,list_value,date_added,added_by,date_modified,modified_by)
values
    ('impactperformance_fueltype','LNG',NOW(),'nidhish',now(),'nidhish'),
    ('impactperformance_fueltype','Sub Bituminous',NOW(),'nidhish',now(),'nidhish'),
    ('impactperformance_fueltype','Other Bituminous',NOW(),'nidhish',now(),'nidhish'),
    ('impactperformance_fueltype','Coking Coal',NOW(),'nidhish',now(),'nidhish'),
    ('impactperformance_fueltype','Anthracite',NOW(),'nidhish',now(),'nidhish'),
    ('impactperformance_fueltype','Lignite',NOW(),'nidhish',now(),'nidhish'),
    ('impactperformance_fueltype','Naptha',NOW(),'nidhish',now(),'nidhish'),
    ('impactperformance_fueltype','Petrol',NOW(),'nidhish',now(),'nidhish'),
    ('impactperformance_fueltype','Diesel',NOW(),'nidhish',now(),'nidhish'),
    ('impactperformance_fueltype','LPG',NOW(),'nidhish',now(),'nidhish'),
    ('impactperformance_fueltype','CNG',NOW(),'nidhish',now(),'nidhish'),
    ('impactperformance_fueltype','SKO',NOW(),'nidhish',now(),'nidhish'),
    ('impactperformance_fueltype','Petcoke',NOW(),'nidhish',now(),'nidhish'),
    ('impactperformance_fueltype','Furnace Oil',NOW(),'nidhish',now(),'nidhish');

insert into static.t_ref_list (list_key,list_value,date_added,added_by,date_modified,modified_by)
values
    ('impactperformance_measurement_unit','Kiloleter',NOW(),'nidhish',now(),'nidhish'),
    ('impactperformance_measurement_unit','Tons',NOW(),'nidhish',now(),'nidhish'),
    ('impactperformance_measurement_unit','KM',NOW(),'nidhish',now(),'nidhish'),
    ('impactperformance_measurement_unit','Miles',NOW(),'nidhish',now(),'nidhish'),
    ('impactperformance_measurement_unit','KgCO2',NOW(),'nidhish',now(),'nidhish'),
    ('impactperformance_measurement_unit','tCO2',NOW(),'nidhish',now(),'nidhish'),
    ('impactperformance_measurement_unit','kWh',NOW(),'nidhish',now(),'nidhish');

insert into static.t_ref_list (list_key,list_value,date_added,added_by,date_modified,modified_by)
values
    ('impactperformance_vehicle_category','Passenger',NOW(),'nidhish',now(),'nidhish'),
    ('impactperformance_vehicle_category','Commercial',NOW(),'nidhish',now(),'nidhish');

insert into static.t_ref_list (list_key,list_value,date_added,added_by,date_modified,modified_by)
values
    ('impactperformance_vehicle_type','Car - petrol',NOW(),'nidhish',now(),'nidhish'),
    ('impactperformance_vehicle_type','Car - diesel',NOW(),'nidhish',now(),'nidhish'),
    ('impactperformance_vehicle_type','Car - CNG'	,NOW(),'nidhish',now(),'nidhish'),
    ('impactperformance_vehicle_type','Car - LPG'	,NOW(),'nidhish',now(),'nidhish'),
    ('impactperformance_vehicle_type','Auto - petrol',NOW(),'nidhish',now(),'nidhish'),
    ('impactperformance_vehicle_type','Auto - CNG'	,NOW(),'nidhish',now(),'nidhish'),
    ('impactperformance_vehicle_type','Auto - LPG'	,NOW(),'nidhish',now(),'nidhish'),
    ('impactperformance_vehicle_type','Light Duty Vehicle (<3.5T)',NOW(),'nidhish',now(),'nidhish'),
    ('impactperformance_vehicle_type','Medium Duty Vehicle (<12T)',NOW(),'nidhish',now(),'nidhish'),
    ('impactperformance_vehicle_type','Heavy Duty Vehicle (>12 T)',NOW(),'nidhish',now(),'nidhish'),
    ('impactperformance_vehicle_type','Truck >16T',NOW(),'nidhish',now(),'nidhish'),
    ('impactperformance_vehicle_type','Bus',NOW(),'nidhish',now(),'nidhish'),
    ('impactperformance_vehicle_type','Van/Omni',NOW(),'nidhish',now(),'nidhish');

insert into static.t_ref_list (list_key,list_value,date_added,added_by,date_modified,modified_by)
values
    ('impactperformance_efactor_source','EPA & climate registry',NOW(),'nidhish',now(),'nidhish'),
    ('impactperformance_efactor_source','IPCC',NOW(),'nidhish',now(),'nidhish'),
    ('impactperformance_efactor_source','INCCA Report 2007',NOW(),'nidhish',now(),'nidhish'),
    ('impactperformance_efactor_source','DEFRA factors SB file',NOW(),'nidhish',now(),'nidhish'),
    ('impactperformance_efactor_source','Dec 2018, CEA',NOW(),'nidhish',now(),'nidhish'),
    ('impactperformance_efactor_source','2019, Northern Ireland Carbon Intensity Indicators 2021',NOW(),'nidhish',now(),'nidhish');

insert into static.t_ref_list (list_key,list_value,date_added,added_by,date_modified,modified_by)
values
    ('impactperformance_emission_type','Fuel_combustion',NOW(),'nidhish',now(),'nidhish'),
    ('impactperformance_emission_type','Distance_travelled',NOW(),'nidhish',now(),'nidhish'),
    ('impactperformance_emission_type','Grid_emission',NOW(),'nidhish',now(),'nidhish');

create table if not exists static.t_ref_config_emissions_type
(
    id integer GENERATED ALWAYS AS IDENTITY primary key
    ,scope varchar(100) NOT NULL
    ,etype_id integer NOT NULL
    ,etypeattr1_id integer NOT NULL
    ,etypeattr2_id integer
    ,etypeattr3_id integer
    ,etypeattr4_id integer
    ,etype_unit1_id integer NOT NULL
    ,etype_unit2_id integer NOT NULL
    ,date_added TIMESTAMP NOT NULL
    ,added_by varchar(100) NOT NULL
    ,date_modified TIMESTAMP NOT NULL
    ,modified_by varchar(100) NOT NULL
    ,CONSTRAINT fk_t_ref_config_emissions_type_etype_id FOREIGN KEY (etype_id) REFERENCES static.t_ref_list (list_id)
    ,CONSTRAINT fk_t_ref_config_emissions_type_etypeattr1_id FOREIGN KEY (etypeattr1_id) REFERENCES static.t_ref_list (list_id)
    ,CONSTRAINT fk_t_ref_config_emissions_type_etypeattr2_id FOREIGN KEY (etypeattr2_id) REFERENCES static.t_ref_list (list_id)
    ,CONSTRAINT fk_t_ref_config_emissions_type_etypeattr3_id FOREIGN KEY (etypeattr3_id) REFERENCES static.t_ref_list (list_id)
    ,CONSTRAINT fk_t_ref_config_emissions_type_etypeattr4_id FOREIGN KEY (etypeattr4_id) REFERENCES static.t_ref_list (list_id)
    ,CONSTRAINT fk_t_ref_config_emissions_type_etype_etype_unit1_id FOREIGN KEY (etype_unit1_id) REFERENCES static.t_ref_list (list_id)
    ,CONSTRAINT fk_t_ref_config_emissions_type_etype_etype_unit2_id FOREIGN KEY (etype_unit2_id) REFERENCES static.t_ref_list (list_id)
    );

    insert into static.t_ref_config_emissions_type (
    scope
    ,etype_id
    ,etypeattr1_id
    ,etypeattr2_id
    ,etypeattr3_id
    ,etypeattr4_id
    ,etype_unit1_id
    ,etype_unit2_id
    ,date_added
    ,added_by
    ,date_modified
    ,modified_by)
    values
(
    1
    ,(select list_id from static.t_ref_list where list_key='impactperformance_emission_type' and list_value='Fuel_combustion')
    ,(select list_id from static.t_ref_list where list_key='impactperformance_fueltype' and list_value='LNG')
    ,null
    ,null
    ,null
    ,(select list_id from static.t_ref_list where list_key='impactperformance_measurement_unit' and list_value='Kiloleter')
    ,(select list_id from static.t_ref_list where list_key='impactperformance_measurement_unit' and list_value='tCO2')
    ,now()
    ,'nidhish'
    ,now()
    ,'nidhish'
    );

    insert into static.t_ref_config_emissions_type (
                                                    scope
                                                   ,etype_id
                                                   ,etypeattr1_id
                                                   ,etypeattr2_id
                                                   ,etypeattr3_id
                                                   ,etypeattr4_id
                                                   ,etype_unit1_id
                                                   ,etype_unit2_id
                                                   ,date_added
                                                   ,added_by
                                                   ,date_modified
                                                   ,modified_by)
values
    (
    1
        ,(select list_id from static.t_ref_list where list_key='impactperformance_emission_type' and list_value='Fuel_combustion')
        ,(select list_id from static.t_ref_list where list_key='impactperformance_fueltype' and list_value='Sub Bituminous')
        ,null
        ,null
        ,null
        ,(select list_id from static.t_ref_list where list_key='impactperformance_measurement_unit' and list_value='Tons')
        ,(select list_id from static.t_ref_list where list_key='impactperformance_measurement_unit' and list_value='tCO2')
        ,now()
        ,'nidhish'
        ,now()
        ,'nidhish'
    );

insert into static.t_ref_config_emissions_type (
                                                scope
                                               ,etype_id
                                               ,etypeattr1_id
                                               ,etypeattr2_id
                                               ,etypeattr3_id
                                               ,etypeattr4_id
                                               ,etype_unit1_id
                                               ,etype_unit2_id
                                               ,date_added
                                               ,added_by
                                               ,date_modified
                                               ,modified_by)
values
    (
    1
        ,(select list_id from static.t_ref_list where list_key='impactperformance_emission_type' and list_value='Fuel_combustion')
        ,(select list_id from static.t_ref_list where list_key='impactperformance_fueltype' and list_value='Other Bituminous')
        ,null
        ,null
        ,null
        ,(select list_id from static.t_ref_list where list_key='impactperformance_measurement_unit' and list_value='Tons')
        ,(select list_id from static.t_ref_list where list_key='impactperformance_measurement_unit' and list_value='tCO2')
        ,now()
        ,'nidhish'
        ,now()
        ,'nidhish'
    );
insert into static.t_ref_config_emissions_type (
                                                scope
                                               ,etype_id
                                               ,etypeattr1_id
                                               ,etypeattr2_id
                                               ,etypeattr3_id
                                               ,etypeattr4_id
                                               ,etype_unit1_id
                                               ,etype_unit2_id
                                               ,date_added
                                               ,added_by
                                               ,date_modified
                                               ,modified_by)
values
    (
    1
        ,(select list_id from static.t_ref_list where list_key='impactperformance_emission_type' and list_value='Fuel_combustion')
        ,(select list_id from static.t_ref_list where list_key='impactperformance_fueltype' and list_value='Petrol')
        ,null
        ,null
        ,null
        ,(select list_id from static.t_ref_list where list_key='impactperformance_measurement_unit' and list_value='Kiloleter')
        ,(select list_id from static.t_ref_list where list_key='impactperformance_measurement_unit' and list_value='tCO2')
        ,now()
        ,'nidhish'
        ,now()
        ,'nidhish'
    );

insert into static.t_ref_config_emissions_type (
                                                scope
                                               ,etype_id
                                               ,etypeattr1_id
                                               ,etypeattr2_id
                                               ,etypeattr3_id
                                               ,etypeattr4_id
                                               ,etype_unit1_id
                                               ,etype_unit2_id
                                               ,date_added
                                               ,added_by
                                               ,date_modified
                                               ,modified_by)
values
    (
    1
        ,(select list_id from static.t_ref_list where list_key='impactperformance_emission_type' and list_value='Fuel_combustion')
        ,(select list_id from static.t_ref_list where list_key='impactperformance_fueltype' and list_value='Naptha')
        ,null
        ,null
        ,null
        ,(select list_id from static.t_ref_list where list_key='impactperformance_measurement_unit' and list_value='Tons')
        ,(select list_id from static.t_ref_list where list_key='impactperformance_measurement_unit' and list_value='tCO2')
        ,now()
        ,'nidhish'
        ,now()
        ,'nidhish'
    );

insert into static.t_ref_config_emissions_type (
                                                scope
                                               ,etype_id
                                               ,etypeattr1_id
                                               ,etypeattr2_id
                                               ,etypeattr3_id
                                               ,etypeattr4_id
                                               ,etype_unit1_id
                                               ,etype_unit2_id
                                               ,date_added
                                               ,added_by
                                               ,date_modified
                                               ,modified_by)
values
    (
    1
        ,(select list_id from static.t_ref_list where list_key='impactperformance_emission_type' and list_value='Fuel_combustion')
        ,(select list_id from static.t_ref_list where list_key='impactperformance_fueltype' and list_value='Lignite')
        ,null
        ,null
        ,null
        ,(select list_id from static.t_ref_list where list_key='impactperformance_measurement_unit' and list_value='Tons')
        ,(select list_id from static.t_ref_list where list_key='impactperformance_measurement_unit' and list_value='tCO2')
        ,now()
        ,'nidhish'
        ,now()
        ,'nidhish'
    );
insert into static.t_ref_config_emissions_type (
                                                scope
                                               ,etype_id
                                               ,etypeattr1_id
                                               ,etypeattr2_id
                                               ,etypeattr3_id
                                               ,etypeattr4_id
                                               ,etype_unit1_id
                                               ,etype_unit2_id
                                               ,date_added
                                               ,added_by
                                               ,date_modified
                                               ,modified_by)
values
    (
    1
        ,(select list_id from static.t_ref_list where list_key='impactperformance_emission_type' and list_value='Fuel_combustion')
        ,(select list_id from static.t_ref_list where list_key='impactperformance_fueltype' and list_value='Anthracite')
        ,null
        ,null
        ,null
        ,(select list_id from static.t_ref_list where list_key='impactperformance_measurement_unit' and list_value='Tons')
        ,(select list_id from static.t_ref_list where list_key='impactperformance_measurement_unit' and list_value='tCO2')
        ,now()
        ,'nidhish'
        ,now()
        ,'nidhish'
    );
insert into static.t_ref_config_emissions_type (
                                                scope
                                               ,etype_id
                                               ,etypeattr1_id
                                               ,etypeattr2_id
                                               ,etypeattr3_id
                                               ,etypeattr4_id
                                               ,etype_unit1_id
                                               ,etype_unit2_id
                                               ,date_added
                                               ,added_by
                                               ,date_modified
                                               ,modified_by)
values
    (
    1
        ,(select list_id from static.t_ref_list where list_key='impactperformance_emission_type' and list_value='Fuel_combustion')
        ,(select list_id from static.t_ref_list where list_key='impactperformance_fueltype' and list_value='Coking Coal')
        ,null
        ,null
        ,null
        ,(select list_id from static.t_ref_list where list_key='impactperformance_measurement_unit' and list_value='Tons')
        ,(select list_id from static.t_ref_list where list_key='impactperformance_measurement_unit' and list_value='tCO2')
        ,now()
        ,'nidhish'
        ,now()
        ,'nidhish'
    );
insert into static.t_ref_config_emissions_type (
                                                scope
                                               ,etype_id
                                               ,etypeattr1_id
                                               ,etypeattr2_id
                                               ,etypeattr3_id
                                               ,etypeattr4_id
                                               ,etype_unit1_id
                                               ,etype_unit2_id
                                               ,date_added
                                               ,added_by
                                               ,date_modified
                                               ,modified_by)
values
    (
    1
        ,(select list_id from static.t_ref_list where list_key='impactperformance_emission_type' and list_value='Fuel_combustion')
        ,(select list_id from static.t_ref_list where list_key='impactperformance_fueltype' and list_value='Diesel')
        ,null
        ,null
        ,null
        ,(select list_id from static.t_ref_list where list_key='impactperformance_measurement_unit' and list_value='Kiloleter')
        ,(select list_id from static.t_ref_list where list_key='impactperformance_measurement_unit' and list_value='tCO2')
        ,now()
        ,'nidhish'
        ,now()
        ,'nidhish'
    );

insert into static.t_ref_config_emissions_type (
                                                scope
                                               ,etype_id
                                               ,etypeattr1_id
                                               ,etypeattr2_id
                                               ,etypeattr3_id
                                               ,etypeattr4_id
                                               ,etype_unit1_id
                                               ,etype_unit2_id
                                               ,date_added
                                               ,added_by
                                               ,date_modified
                                               ,modified_by)
values
    (
    1
        ,(select list_id from static.t_ref_list where list_key='impactperformance_emission_type' and list_value='Fuel_combustion')
        ,(select list_id from static.t_ref_list where list_key='impactperformance_fueltype' and list_value='SKO')
        ,null
        ,null
        ,null
        ,(select list_id from static.t_ref_list where list_key='impactperformance_measurement_unit' and list_value='Kiloleter')
        ,(select list_id from static.t_ref_list where list_key='impactperformance_measurement_unit' and list_value='tCO2')
        ,now()
        ,'nidhish'
        ,now()
        ,'nidhish'
    );
insert into static.t_ref_config_emissions_type (
                                                scope
                                               ,etype_id
                                               ,etypeattr1_id
                                               ,etypeattr2_id
                                               ,etypeattr3_id
                                               ,etypeattr4_id
                                               ,etype_unit1_id
                                               ,etype_unit2_id
                                               ,date_added
                                               ,added_by
                                               ,date_modified
                                               ,modified_by)
values
    (
    1
        ,(select list_id from static.t_ref_list where list_key='impactperformance_emission_type' and list_value='Fuel_combustion')
        ,(select list_id from static.t_ref_list where list_key='impactperformance_fueltype' and list_value='Furnace Oil')
        ,null
        ,null
        ,null
        ,(select list_id from static.t_ref_list where list_key='impactperformance_measurement_unit' and list_value='Kiloleter')
        ,(select list_id from static.t_ref_list where list_key='impactperformance_measurement_unit' and list_value='tCO2')
        ,now()
        ,'nidhish'
        ,now()
        ,'nidhish'
    );
insert into static.t_ref_config_emissions_type (
                                                scope
                                               ,etype_id
                                               ,etypeattr1_id
                                               ,etypeattr2_id
                                               ,etypeattr3_id
                                               ,etypeattr4_id
                                               ,etype_unit1_id
                                               ,etype_unit2_id
                                               ,date_added
                                               ,added_by
                                               ,date_modified
                                               ,modified_by)
values
    (
    1
        ,(select list_id from static.t_ref_list where list_key='impactperformance_emission_type' and list_value='Fuel_combustion')
        ,(select list_id from static.t_ref_list where list_key='impactperformance_fueltype' and list_value='LPG')
        ,null
        ,null
        ,null
        ,(select list_id from static.t_ref_list where list_key='impactperformance_measurement_unit' and list_value='Tons')
        ,(select list_id from static.t_ref_list where list_key='impactperformance_measurement_unit' and list_value='tCO2')
        ,now()
        ,'nidhish'
        ,now()
        ,'nidhish'
    );
insert into static.t_ref_config_emissions_type (
                                                scope
                                               ,etype_id
                                               ,etypeattr1_id
                                               ,etypeattr2_id
                                               ,etypeattr3_id
                                               ,etypeattr4_id
                                               ,etype_unit1_id
                                               ,etype_unit2_id
                                               ,date_added
                                               ,added_by
                                               ,date_modified
                                               ,modified_by)
values
    (
    1
        ,(select list_id from static.t_ref_list where list_key='impactperformance_emission_type' and list_value='Fuel_combustion')
        ,(select list_id from static.t_ref_list where list_key='impactperformance_fueltype' and list_value='Petcoke')
        ,null
        ,null
        ,null
        ,(select list_id from static.t_ref_list where list_key='impactperformance_measurement_unit' and list_value='Tons')
        ,(select list_id from static.t_ref_list where list_key='impactperformance_measurement_unit' and list_value='tCO2')
        ,now()
        ,'nidhish'
        ,now()
        ,'nidhish'
    );

insert into static.t_ref_config_emissions_type (
                                                scope
                                               ,etype_id
                                               ,etypeattr1_id
                                               ,etypeattr2_id
                                               ,etypeattr3_id
                                               ,etypeattr4_id
                                               ,etype_unit1_id
                                               ,etype_unit2_id
                                               ,date_added
                                               ,added_by
                                               ,date_modified
                                               ,modified_by)
values
    (
    1
        ,(select list_id from static.t_ref_list where list_key='impactperformance_emission_type' and list_value='Distance_travelled')
        ,(select list_id from static.t_ref_list where list_key='impactperformance_vehicle_category' and list_value='Passenger')
        ,(select list_id from static.t_ref_list where list_key='impactperformance_vehicle_type' and list_value='Car - petrol')
        ,(select list_id from static.t_ref_list where list_key='impactperformance_fueltype' and list_value='Petrol')
        ,null
        ,(select list_id from static.t_ref_list where list_key='impactperformance_measurement_unit' and list_value='KM')
        ,(select list_id from static.t_ref_list where list_key='impactperformance_measurement_unit' and list_value='KgCO2')
        ,now()
        ,'nidhish'
        ,now()
        ,'nidhish'
    );
insert into static.t_ref_config_emissions_type (
                                                scope
                                               ,etype_id
                                               ,etypeattr1_id
                                               ,etypeattr2_id
                                               ,etypeattr3_id
                                               ,etypeattr4_id
                                               ,etype_unit1_id
                                               ,etype_unit2_id
                                               ,date_added
                                               ,added_by
                                               ,date_modified
                                               ,modified_by)
values
    (
    1
        ,(select list_id from static.t_ref_list where list_key='impactperformance_emission_type' and list_value='Distance_travelled')
        ,(select list_id from static.t_ref_list where list_key='impactperformance_vehicle_category' and list_value='Passenger')
        ,(select list_id from static.t_ref_list where list_key='impactperformance_vehicle_type' and list_value='Car - diesel')
        ,(select list_id from static.t_ref_list where list_key='impactperformance_fueltype' and list_value='Diesel')
        ,null
        ,(select list_id from static.t_ref_list where list_key='impactperformance_measurement_unit' and list_value='KM')
        ,(select list_id from static.t_ref_list where list_key='impactperformance_measurement_unit' and list_value='KgCO2')
        ,now()
        ,'nidhish'
        ,now()
        ,'nidhish'
    );
insert into static.t_ref_config_emissions_type (
                                                scope
                                               ,etype_id
                                               ,etypeattr1_id
                                               ,etypeattr2_id
                                               ,etypeattr3_id
                                               ,etypeattr4_id
                                               ,etype_unit1_id
                                               ,etype_unit2_id
                                               ,date_added
                                               ,added_by
                                               ,date_modified
                                               ,modified_by)
values
    (
    1
        ,(select list_id from static.t_ref_list where list_key='impactperformance_emission_type' and list_value='Distance_travelled')
        ,(select list_id from static.t_ref_list where list_key='impactperformance_vehicle_category' and list_value='Passenger')
        ,(select list_id from static.t_ref_list where list_key='impactperformance_vehicle_type' and list_value='Car - CNG')
        ,(select list_id from static.t_ref_list where list_key='impactperformance_fueltype' and list_value='CNG')
        ,null
        ,(select list_id from static.t_ref_list where list_key='impactperformance_measurement_unit' and list_value='KM')
        ,(select list_id from static.t_ref_list where list_key='impactperformance_measurement_unit' and list_value='KgCO2')
        ,now()
        ,'nidhish'
        ,now()
        ,'nidhish'
    );
insert into static.t_ref_config_emissions_type (
                                                scope
                                               ,etype_id
                                               ,etypeattr1_id
                                               ,etypeattr2_id
                                               ,etypeattr3_id
                                               ,etypeattr4_id
                                               ,etype_unit1_id
                                               ,etype_unit2_id
                                               ,date_added
                                               ,added_by
                                               ,date_modified
                                               ,modified_by)
values
    (
    1
        ,(select list_id from static.t_ref_list where list_key='impactperformance_emission_type' and list_value='Distance_travelled')
        ,(select list_id from static.t_ref_list where list_key='impactperformance_vehicle_category' and list_value='Passenger')
        ,(select list_id from static.t_ref_list where list_key='impactperformance_vehicle_type' and list_value='Car - LPG')
        ,(select list_id from static.t_ref_list where list_key='impactperformance_fueltype' and list_value='LPG')
        ,null
        ,(select list_id from static.t_ref_list where list_key='impactperformance_measurement_unit' and list_value='KM')
        ,(select list_id from static.t_ref_list where list_key='impactperformance_measurement_unit' and list_value='KgCO2')
        ,now()
        ,'nidhish'
        ,now()
        ,'nidhish'
    );
insert into static.t_ref_config_emissions_type (
                                                scope
                                               ,etype_id
                                               ,etypeattr1_id
                                               ,etypeattr2_id
                                               ,etypeattr3_id
                                               ,etypeattr4_id
                                               ,etype_unit1_id
                                               ,etype_unit2_id
                                               ,date_added
                                               ,added_by
                                               ,date_modified
                                               ,modified_by)
values
    (
    1
        ,(select list_id from static.t_ref_list where list_key='impactperformance_emission_type' and list_value='Distance_travelled')
        ,(select list_id from static.t_ref_list where list_key='impactperformance_vehicle_category' and list_value='Passenger')
        ,(select list_id from static.t_ref_list where list_key='impactperformance_vehicle_type' and list_value='Auto - petrol')
        ,(select list_id from static.t_ref_list where list_key='impactperformance_fueltype' and list_value='Petrol')
        ,null
        ,(select list_id from static.t_ref_list where list_key='impactperformance_measurement_unit' and list_value='KM')
        ,(select list_id from static.t_ref_list where list_key='impactperformance_measurement_unit' and list_value='KgCO2')
        ,now()
        ,'nidhish'
        ,now()
        ,'nidhish'
    );
insert into static.t_ref_config_emissions_type (
                                                scope
                                               ,etype_id
                                               ,etypeattr1_id
                                               ,etypeattr2_id
                                               ,etypeattr3_id
                                               ,etypeattr4_id
                                               ,etype_unit1_id
                                               ,etype_unit2_id
                                               ,date_added
                                               ,added_by
                                               ,date_modified
                                               ,modified_by)
values
    (
    1
        ,(select list_id from static.t_ref_list where list_key='impactperformance_emission_type' and list_value='Distance_travelled')
        ,(select list_id from static.t_ref_list where list_key='impactperformance_vehicle_category' and list_value='Passenger')
        ,(select list_id from static.t_ref_list where list_key='impactperformance_vehicle_type' and list_value='Auto - CNG')
        ,(select list_id from static.t_ref_list where list_key='impactperformance_fueltype' and list_value='CNG')
        ,null
        ,(select list_id from static.t_ref_list where list_key='impactperformance_measurement_unit' and list_value='KM')
        ,(select list_id from static.t_ref_list where list_key='impactperformance_measurement_unit' and list_value='KgCO2')
        ,now()
        ,'nidhish'
        ,now()
        ,'nidhish'
    );
insert into static.t_ref_config_emissions_type (
                                                scope
                                               ,etype_id
                                               ,etypeattr1_id
                                               ,etypeattr2_id
                                               ,etypeattr3_id
                                               ,etypeattr4_id
                                               ,etype_unit1_id
                                               ,etype_unit2_id
                                               ,date_added
                                               ,added_by
                                               ,date_modified
                                               ,modified_by)
values
    (
    1
        ,(select list_id from static.t_ref_list where list_key='impactperformance_emission_type' and list_value='Distance_travelled')
        ,(select list_id from static.t_ref_list where list_key='impactperformance_vehicle_category' and list_value='Commercial')
        ,(select list_id from static.t_ref_list where list_key='impactperformance_vehicle_type' and list_value='Light Duty Vehicle (<3.5T)')
        ,(select list_id from static.t_ref_list where list_key='impactperformance_fueltype' and list_value='Diesel')
        ,null
        ,(select list_id from static.t_ref_list where list_key='impactperformance_measurement_unit' and list_value='KM')
        ,(select list_id from static.t_ref_list where list_key='impactperformance_measurement_unit' and list_value='KgCO2')
        ,now()
        ,'nidhish'
        ,now()
        ,'nidhish'
    );

insert into static.t_ref_config_emissions_type (
                                                scope
                                               ,etype_id
                                               ,etypeattr1_id
                                               ,etypeattr2_id
                                               ,etypeattr3_id
                                               ,etypeattr4_id
                                               ,etype_unit1_id
                                               ,etype_unit2_id
                                               ,date_added
                                               ,added_by
                                               ,date_modified
                                               ,modified_by)
values
    (
    1
        ,(select list_id from static.t_ref_list where list_key='impactperformance_emission_type' and list_value='Distance_travelled')
        ,(select list_id from static.t_ref_list where list_key='impactperformance_vehicle_category' and list_value='Commercial')
        ,(select list_id from static.t_ref_list where list_key='impactperformance_vehicle_type' and list_value='Medium Duty Vehicle (<12T)')
        ,(select list_id from static.t_ref_list where list_key='impactperformance_fueltype' and list_value='Diesel')
        ,null
        ,(select list_id from static.t_ref_list where list_key='impactperformance_measurement_unit' and list_value='KM')
        ,(select list_id from static.t_ref_list where list_key='impactperformance_measurement_unit' and list_value='KgCO2')
        ,now()
        ,'nidhish'
        ,now()
        ,'nidhish'
    );
insert into static.t_ref_config_emissions_type (
                                                scope
                                               ,etype_id
                                               ,etypeattr1_id
                                               ,etypeattr2_id
                                               ,etypeattr3_id
                                               ,etypeattr4_id
                                               ,etype_unit1_id
                                               ,etype_unit2_id
                                               ,date_added
                                               ,added_by
                                               ,date_modified
                                               ,modified_by)
values
    (
    1
        ,(select list_id from static.t_ref_list where list_key='impactperformance_emission_type' and list_value='Distance_travelled')
        ,(select list_id from static.t_ref_list where list_key='impactperformance_vehicle_category' and list_value='Commercial')
        ,(select list_id from static.t_ref_list where list_key='impactperformance_vehicle_type' and list_value='Heavy Duty Vehicle (>12 T)')
        ,(select list_id from static.t_ref_list where list_key='impactperformance_fueltype' and list_value='Diesel')
        ,null
        ,(select list_id from static.t_ref_list where list_key='impactperformance_measurement_unit' and list_value='KM')
        ,(select list_id from static.t_ref_list where list_key='impactperformance_measurement_unit' and list_value='KgCO2')
        ,now()
        ,'nidhish'
        ,now()
        ,'nidhish'
    );
insert into static.t_ref_config_emissions_type (
                                                scope
                                               ,etype_id
                                               ,etypeattr1_id
                                               ,etypeattr2_id
                                               ,etypeattr3_id
                                               ,etypeattr4_id
                                               ,etype_unit1_id
                                               ,etype_unit2_id
                                               ,date_added
                                               ,added_by
                                               ,date_modified
                                               ,modified_by)
values
    (
    1
        ,(select list_id from static.t_ref_list where list_key='impactperformance_emission_type' and list_value='Distance_travelled')
        ,(select list_id from static.t_ref_list where list_key='impactperformance_vehicle_category' and list_value='Commercial')
        ,(select list_id from static.t_ref_list where list_key='impactperformance_vehicle_type' and list_value='Truck >16T')
        ,(select list_id from static.t_ref_list where list_key='impactperformance_fueltype' and list_value='Diesel')
        ,null
        ,(select list_id from static.t_ref_list where list_key='impactperformance_measurement_unit' and list_value='KM')
        ,(select list_id from static.t_ref_list where list_key='impactperformance_measurement_unit' and list_value='KgCO2')
        ,now()
        ,'nidhish'
        ,now()
        ,'nidhish'
    );
insert into static.t_ref_config_emissions_type (
                                                scope
                                               ,etype_id
                                               ,etypeattr1_id
                                               ,etypeattr2_id
                                               ,etypeattr3_id
                                               ,etypeattr4_id
                                               ,etype_unit1_id
                                               ,etype_unit2_id
                                               ,date_added
                                               ,added_by
                                               ,date_modified
                                               ,modified_by)
values
    (
    1
        ,(select list_id from static.t_ref_list where list_key='impactperformance_emission_type' and list_value='Distance_travelled')
        ,(select list_id from static.t_ref_list where list_key='impactperformance_vehicle_category' and list_value='Commercial')
        ,(select list_id from static.t_ref_list where list_key='impactperformance_vehicle_type' and list_value='Bus')
        ,(select list_id from static.t_ref_list where list_key='impactperformance_fueltype' and list_value='Diesel')
        ,null
        ,(select list_id from static.t_ref_list where list_key='impactperformance_measurement_unit' and list_value='KM')
        ,(select list_id from static.t_ref_list where list_key='impactperformance_measurement_unit' and list_value='KgCO2')
        ,now()
        ,'nidhish'
        ,now()
        ,'nidhish'
    );
insert into static.t_ref_config_emissions_type (
                                                scope
                                               ,etype_id
                                               ,etypeattr1_id
                                               ,etypeattr2_id
                                               ,etypeattr3_id
                                               ,etypeattr4_id
                                               ,etype_unit1_id
                                               ,etype_unit2_id
                                               ,date_added
                                               ,added_by
                                               ,date_modified
                                               ,modified_by)
values
    (
    1
        ,(select list_id from static.t_ref_list where list_key='impactperformance_emission_type' and list_value='Distance_travelled')
        ,(select list_id from static.t_ref_list where list_key='impactperformance_vehicle_category' and list_value='Commercial')
        ,(select list_id from static.t_ref_list where list_key='impactperformance_vehicle_type' and list_value='Van/Omni')
        ,(select list_id from static.t_ref_list where list_key='impactperformance_fueltype' and list_value='Petrol')
        ,null
        ,(select list_id from static.t_ref_list where list_key='impactperformance_measurement_unit' and list_value='KM')
        ,(select list_id from static.t_ref_list where list_key='impactperformance_measurement_unit' and list_value='KgCO2')
        ,now()
        ,'nidhish'
        ,now()
        ,'nidhish'
    );

insert into static.t_ref_config_emissions_type (
                                                scope
                                               ,etype_id
                                               ,etypeattr1_id
                                               ,etypeattr2_id
                                               ,etypeattr3_id
                                               ,etypeattr4_id
                                               ,etype_unit1_id
                                               ,etype_unit2_id
                                               ,date_added
                                               ,added_by
                                               ,date_modified
                                               ,modified_by)
values
    (
    2
        ,(select list_id from static.t_ref_list where list_key='impactperformance_emission_type' and list_value='Grid_emission')
        ,(select list_id from static.t_ref_list where list_key='impactperformance_emission_type' and list_value='Grid_emission')
        ,null
        ,null
        ,null
        ,(select list_id from static.t_ref_list where list_key='impactperformance_measurement_unit' and list_value='kWh')
        ,(select list_id from static.t_ref_list where list_key='impactperformance_measurement_unit' and list_value='KgCO2')
        ,now()
        ,'nidhish'
        ,now()
        ,'nidhish'
    );

create table if not exists static.t_ref_config_emissions_unit_factor
(
    id integer GENERATED ALWAYS AS IDENTITY primary key
    ,etype_unit1_id integer NOT NULL
    ,etype_unit2_id integer NOT NULL
    ,etype_unit1_factor numeric(24,8) NOT NULL
    ,etype_unit2_factor numeric(24,8) NOT NULL
    ,date_added TIMESTAMP NOT NULL
    ,added_by varchar(100) NOT NULL
    ,date_modified TIMESTAMP NOT NULL
    ,modified_by varchar(100) NOT NULL
    ,CONSTRAINT fk_t_ref_config_emissions_type_conversion_etype_unit1_id FOREIGN KEY (etype_unit1_id) REFERENCES static.t_ref_list (list_id)
    ,CONSTRAINT fk_t_ref_config_emissions_type_conversion_etype_unit2_id FOREIGN KEY (etype_unit2_id) REFERENCES static.t_ref_list (list_id)
    );

    insert into static.t_ref_config_emissions_unit_factor (
                                                              etype_unit1_id
    ,etype_unit2_id
    ,etype_unit1_factor
    ,etype_unit2_factor
    ,date_added
    ,added_by
    ,date_modified
    ,modified_by)
    values
(
(select list_id from static.t_ref_list where list_key='impactperformance_measurement_unit' and list_value='Kiloleter')
    ,(select list_id from static.t_ref_list where list_key='impactperformance_measurement_unit' and list_value='tCO2')
    ,1.0
    ,1.0
    ,now()
    ,'nidhish'
    ,now()
    ,'nidhish'
    );

    insert into static.t_ref_config_emissions_unit_factor (
                                                              etype_unit1_id
    ,etype_unit2_id
    ,etype_unit1_factor
    ,etype_unit2_factor
    ,date_added
    ,added_by
    ,date_modified
    ,modified_by)
    values
(
(select list_id from static.t_ref_list where list_key='impactperformance_measurement_unit' and list_value='Tons')
    ,(select list_id from static.t_ref_list where list_key='impactperformance_measurement_unit' and list_value='tCO2')
    ,1.0
    ,1.0
    ,now()
    ,'nidhish'
    ,now()
    ,'nidhish'
    );

    insert into static.t_ref_config_emissions_unit_factor (
                                                              etype_unit1_id
    ,etype_unit2_id
    ,etype_unit1_factor
    ,etype_unit2_factor
    ,date_added
    ,added_by
    ,date_modified
    ,modified_by)
    values
(
(select list_id from static.t_ref_list where list_key='impactperformance_measurement_unit' and list_value='KM')
    ,(select list_id from static.t_ref_list where list_key='impactperformance_measurement_unit' and list_value='KgCO2')
    ,1.0
    ,.001
    ,now()
    ,'nidhish'
    ,now()
    ,'nidhish'
    );

    insert into static.t_ref_config_emissions_unit_factor (
                                                              etype_unit1_id
    ,etype_unit2_id
    ,etype_unit1_factor
    ,etype_unit2_factor
    ,date_added
    ,added_by
    ,date_modified
    ,modified_by)
    values
(
(select list_id from static.t_ref_list where list_key='impactperformance_measurement_unit' and list_value='Miles')
    ,(select list_id from static.t_ref_list where list_key='impactperformance_measurement_unit' and list_value='KgCO2')
    ,1.609
    ,.001
    ,now()
    ,'nidhish'
    ,now()
    ,'nidhish'
    );

create table if not exists static.t_ref_config_emissions_factor
(
    id integer GENERATED ALWAYS AS IDENTITY primary key
    ,continent_id			integer
    ,region_id 				integer
    ,country_id 			integer
    ,industry_sector_id 	integer
    ,industry_subsector_id 	integer
    ,config_etype_id 		integer
    ,emission_factor 		numeric(24,8) NOT NULL
    ,emission_source_id		integer
    ,date_added 			TIMESTAMP NOT NULL
    ,added_by 				varchar(100) NOT NULL
    ,date_modified 			TIMESTAMP NOT NULL
    ,modified_by 			varchar(100) NOT NULL
    ,CONSTRAINT fk_t_ref_config_emissions_factor_continent_id FOREIGN KEY (continent_id) REFERENCES static.t_ref_continent (id)
    ,CONSTRAINT fk_t_ref_config_emissions_factor_region_id FOREIGN KEY (region_id) REFERENCES static.t_ref_regions (id)
    ,CONSTRAINT fk_t_ref_config_emissions_factor_country_id FOREIGN KEY (country_id) REFERENCES static.t_ref_countries (id)
    ,CONSTRAINT fk_t_ref_config_emissions_factor_industry_sector_id FOREIGN KEY (industry_sector_id) REFERENCES static.t_ref_industry_sector (industry_sector_id)
    ,CONSTRAINT fk_t_ref_config_emissions_factor_industry_subsector_id FOREIGN KEY (industry_subsector_id) REFERENCES static.t_ref_industry_subsector (industry_subsector_id)
    ,CONSTRAINT fk_t_ref_config_emissions_factor_config_etype_id FOREIGN KEY (config_etype_id) REFERENCES static.t_ref_config_emissions_type (id)
    ,CONSTRAINT fk_t_ref_config_emissions_factor_emission_source_id FOREIGN KEY (emission_source_id) REFERENCES static.t_ref_list (list_id)
    );

    insert into static.t_ref_config_emissions_factor
(
    continent_id
    ,region_id
    ,country_id
    ,industry_sector_id
    ,industry_subsector_id
    ,config_etype_id
    ,emission_factor
    ,emission_source_id
    ,date_added
    ,added_by
    ,date_modified
    ,modified_by
)
    values
(
    null
    ,null
    ,null
    ,null
    ,null
    ,(select t1.id from static.t_ref_config_emissions_type t1
    inner join static.t_ref_list 		t2	ON t2.list_id = t1.etype_id
    inner join static.t_ref_list 		t3	on t3.list_id = t1.etypeattr1_id
    left outer join  static.t_ref_list 	t4  on t4.list_id = t1.etypeattr2_id
    left outer join  static.t_ref_list 	t5  on t5.list_id = t1.etypeattr3_id
    left outer join  static.t_ref_list 	t6  on t6.list_id = t1.etypeattr4_id
    inner join static.t_ref_list 		t8	ON 	t8.list_id = t1.etype_unit1_id
    inner join static.t_ref_list 		t9	ON 	t9.list_id = t1.etype_unit2_id
    WHERE
    t2.list_value ='Fuel_combustion'
    and t3.list_value = 'LNG'
    and t8.list_value = 'Kiloleter'
    and t9.list_value = 'tCO2'
     )
    ,1.3
    ,(select list_id from static.t_ref_list where list_key='impactperformance_efactor_source' and list_value='EPA & climate registry')
    ,now()
    ,'nidhish'
    ,now()
    ,'nidhish'
    );

    insert into static.t_ref_config_emissions_factor
(
    continent_id
,region_id
,country_id
,industry_sector_id
,industry_subsector_id
,config_etype_id
,emission_factor
,emission_source_id
,date_added
,added_by
,date_modified
,modified_by
)
values
    (
    null
        ,null
        ,null
        ,null
        ,null
        ,(select t1.id from static.t_ref_config_emissions_type t1
    inner join static.t_ref_list 		t2	ON t2.list_id = t1.etype_id
    inner join static.t_ref_list 		t3	on t3.list_id = t1.etypeattr1_id
    left outer join  static.t_ref_list 	t4  on t4.list_id = t1.etypeattr2_id
    left outer join  static.t_ref_list 	t5  on t5.list_id = t1.etypeattr3_id
    left outer join  static.t_ref_list 	t6  on t6.list_id = t1.etypeattr4_id
    inner join static.t_ref_list 		t8	ON 	t8.list_id = t1.etype_unit1_id
    inner join static.t_ref_list 		t9	ON 	t9.list_id = t1.etype_unit2_id
    WHERE
    t2.list_value ='Fuel_combustion'
    and t3.list_value = 'Sub Bituminous'
    and t8.list_value = 'Tons'
    and t9.list_value = 'tCO2'
    )
        ,1.8
        ,(select list_id from static.t_ref_list where list_key='impactperformance_efactor_source' and list_value='IPCC')
        ,now()
        ,'nidhish'
        ,now()
        ,'nidhish'
    );

insert into static.t_ref_config_emissions_factor
(
    continent_id
,region_id
,country_id
,industry_sector_id
,industry_subsector_id
,config_etype_id
,emission_factor
,emission_source_id
,date_added
,added_by
,date_modified
,modified_by
)
values
    (
        null
    ,null
    ,null
    ,null
    ,null
    ,(select t1.id from static.t_ref_config_emissions_type t1
                            inner join static.t_ref_list 		t2	ON t2.list_id = t1.etype_id
                            inner join static.t_ref_list 		t3	on t3.list_id = t1.etypeattr1_id
                            left outer join  static.t_ref_list 	t4  on t4.list_id = t1.etypeattr2_id
                            left outer join  static.t_ref_list 	t5  on t5.list_id = t1.etypeattr3_id
                            left outer join  static.t_ref_list 	t6  on t6.list_id = t1.etypeattr4_id
                            inner join static.t_ref_list 		t8	ON 	t8.list_id = t1.etype_unit1_id
                            inner join static.t_ref_list 		t9	ON 	t9.list_id = t1.etype_unit2_id
      WHERE
              t2.list_value ='Fuel_combustion'
        and t3.list_value = 'Other Bituminous'
        and t8.list_value = 'Tons'
        and t9.list_value = 'tCO2'
        )
    ,2.4
    ,(select list_id from static.t_ref_list where list_key='impactperformance_efactor_source' and list_value='IPCC')
    ,now()
    ,'nidhish'
    ,now()
    ,'nidhish'
    );

insert into static.t_ref_config_emissions_factor
(
    continent_id
,region_id
,country_id
,industry_sector_id
,industry_subsector_id
,config_etype_id
,emission_factor
,emission_source_id
,date_added
,added_by
,date_modified
,modified_by
)
values
    (
        null
    ,null
    ,null
    ,null
    ,null
    ,(select t1.id from static.t_ref_config_emissions_type t1
                            inner join static.t_ref_list 		t2	ON t2.list_id = t1.etype_id
                            inner join static.t_ref_list 		t3	on t3.list_id = t1.etypeattr1_id
                            left outer join  static.t_ref_list 	t4  on t4.list_id = t1.etypeattr2_id
                            left outer join  static.t_ref_list 	t5  on t5.list_id = t1.etypeattr3_id
                            left outer join  static.t_ref_list 	t6  on t6.list_id = t1.etypeattr4_id
                            inner join static.t_ref_list 		t8	ON 	t8.list_id = t1.etype_unit1_id
                            inner join static.t_ref_list 		t9	ON 	t9.list_id = t1.etype_unit2_id
      WHERE
              t2.list_value ='Fuel_combustion'
        and t3.list_value = 'Coking Coal'
        and t8.list_value = 'Tons'
        and t9.list_value = 'tCO2'
        )
    ,2.3
    ,(select list_id from static.t_ref_list where list_key='impactperformance_efactor_source' and list_value='INCCA Report 2007')
    ,now()
    ,'nidhish'
    ,now()
    ,'nidhish'
    );

insert into static.t_ref_config_emissions_factor
(
    continent_id
,region_id
,country_id
,industry_sector_id
,industry_subsector_id
,config_etype_id
,emission_factor
,emission_source_id
,date_added
,added_by
,date_modified
,modified_by
)
values
    (
        null
    ,null
    ,null
    ,null
    ,null
    ,(select t1.id from static.t_ref_config_emissions_type t1
                            inner join static.t_ref_list 		t2	ON t2.list_id = t1.etype_id
                            inner join static.t_ref_list 		t3	on t3.list_id = t1.etypeattr1_id
                            left outer join  static.t_ref_list 	t4  on t4.list_id = t1.etypeattr2_id
                            left outer join  static.t_ref_list 	t5  on t5.list_id = t1.etypeattr3_id
                            left outer join  static.t_ref_list 	t6  on t6.list_id = t1.etypeattr4_id
                            inner join static.t_ref_list 		t8	ON 	t8.list_id = t1.etype_unit1_id
                            inner join static.t_ref_list 		t9	ON 	t9.list_id = t1.etype_unit2_id
      WHERE
              t2.list_value ='Fuel_combustion'
        and t3.list_value = 'Lignite'
        and t8.list_value = 'Tons'
        and t9.list_value = 'tCO2'
        )
    ,1.0
    ,(select list_id from static.t_ref_list where list_key='impactperformance_efactor_source' and list_value='INCCA Report 2007')
    ,now()
    ,'nidhish'
    ,now()
    ,'nidhish'
    );

insert into static.t_ref_config_emissions_factor
(
    continent_id
,region_id
,country_id
,industry_sector_id
,industry_subsector_id
,config_etype_id
,emission_factor
,emission_source_id
,date_added
,added_by
,date_modified
,modified_by
)
values
    (
        null
    ,null
    ,null
    ,null
    ,null
    ,(select t1.id from static.t_ref_config_emissions_type t1
                            inner join static.t_ref_list 		t2	ON t2.list_id = t1.etype_id
                            inner join static.t_ref_list 		t3	on t3.list_id = t1.etypeattr1_id
                            left outer join  static.t_ref_list 	t4  on t4.list_id = t1.etypeattr2_id
                            left outer join  static.t_ref_list 	t5  on t5.list_id = t1.etypeattr3_id
                            left outer join  static.t_ref_list 	t6  on t6.list_id = t1.etypeattr4_id
                            inner join static.t_ref_list 		t8	ON 	t8.list_id = t1.etype_unit1_id
                            inner join static.t_ref_list 		t9	ON 	t9.list_id = t1.etype_unit2_id
      WHERE
              t2.list_value ='Fuel_combustion'
        and t3.list_value = 'Naptha'
        and t8.list_value = 'Tons'
        and t9.list_value = 'tCO2'
        )
    ,3.3
    ,(select list_id from static.t_ref_list where list_key='impactperformance_efactor_source' and list_value='IPCC')
    ,now()
    ,'nidhish'
    ,now()
    ,'nidhish'
    );
insert into static.t_ref_config_emissions_factor
(
    continent_id
,region_id
,country_id
,industry_sector_id
,industry_subsector_id
,config_etype_id
,emission_factor
,emission_source_id
,date_added
,added_by
,date_modified
,modified_by
)
values
    (
        null
    ,null
    ,null
    ,null
    ,null
    ,(select t1.id from static.t_ref_config_emissions_type t1
                            inner join static.t_ref_list 		t2	ON t2.list_id = t1.etype_id
                            inner join static.t_ref_list 		t3	on t3.list_id = t1.etypeattr1_id
                            left outer join  static.t_ref_list 	t4  on t4.list_id = t1.etypeattr2_id
                            left outer join  static.t_ref_list 	t5  on t5.list_id = t1.etypeattr3_id
                            left outer join  static.t_ref_list 	t6  on t6.list_id = t1.etypeattr4_id
                            inner join static.t_ref_list 		t8	ON 	t8.list_id = t1.etype_unit1_id
                            inner join static.t_ref_list 		t9	ON 	t9.list_id = t1.etype_unit2_id
      WHERE
              t2.list_value ='Fuel_combustion'
        and t3.list_value = 'Petrol'
        and t8.list_value = 'Kiloleter'
        and t9.list_value = 'tCO2'
        )
    ,2.3
    ,(select list_id from static.t_ref_list where list_key='impactperformance_efactor_source' and list_value='IPCC')
    ,now()
    ,'nidhish'
    ,now()
    ,'nidhish'
    );

insert into static.t_ref_config_emissions_factor
(
    continent_id
,region_id
,country_id
,industry_sector_id
,industry_subsector_id
,config_etype_id
,emission_factor
,emission_source_id
,date_added
,added_by
,date_modified
,modified_by
)
values
    (
        null
    ,null
    ,null
    ,null
    ,null
    ,(select t1.id from static.t_ref_config_emissions_type t1
                            inner join static.t_ref_list 		t2	ON t2.list_id = t1.etype_id
                            inner join static.t_ref_list 		t3	on t3.list_id = t1.etypeattr1_id
                            left outer join  static.t_ref_list 	t4  on t4.list_id = t1.etypeattr2_id
                            left outer join  static.t_ref_list 	t5  on t5.list_id = t1.etypeattr3_id
                            left outer join  static.t_ref_list 	t6  on t6.list_id = t1.etypeattr4_id
                            inner join static.t_ref_list 		t8	ON 	t8.list_id = t1.etype_unit1_id
                            inner join static.t_ref_list 		t9	ON 	t9.list_id = t1.etype_unit2_id
      WHERE
              t2.list_value ='Fuel_combustion'
        and t3.list_value = 'LPG'
        and t8.list_value = 'Tons'
        and t9.list_value = 'tCO2'
        )
    ,3.0
    ,(select list_id from static.t_ref_list where list_key='impactperformance_efactor_source' and list_value='IPCC')
    ,now()
    ,'nidhish'
    ,now()
    ,'nidhish'
    );

insert into static.t_ref_config_emissions_factor
(
    continent_id
,region_id
,country_id
,industry_sector_id
,industry_subsector_id
,config_etype_id
,emission_factor
,emission_source_id
,date_added
,added_by
,date_modified
,modified_by
)
values
    (
        null
    ,null
    ,null
    ,null
    ,null
    ,(select t1.id from static.t_ref_config_emissions_type t1
                            inner join static.t_ref_list 		t2	ON t2.list_id = t1.etype_id
                            inner join static.t_ref_list 		t3	on t3.list_id = t1.etypeattr1_id
                            left outer join  static.t_ref_list 	t4  on t4.list_id = t1.etypeattr2_id
                            left outer join  static.t_ref_list 	t5  on t5.list_id = t1.etypeattr3_id
                            left outer join  static.t_ref_list 	t6  on t6.list_id = t1.etypeattr4_id
                            inner join static.t_ref_list 		t8	ON 	t8.list_id = t1.etype_unit1_id
                            inner join static.t_ref_list 		t9	ON 	t9.list_id = t1.etype_unit2_id
      WHERE
              t2.list_value ='Fuel_combustion'
        and t3.list_value = 'SKO'
        and t8.list_value = 'Kiloleter'
        and t9.list_value = 'tCO2'
        )
    ,2.5
    ,(select list_id from static.t_ref_list where list_key='impactperformance_efactor_source' and list_value='IPCC')
    ,now()
    ,'nidhish'
    ,now()
    ,'nidhish'
    );

insert into static.t_ref_config_emissions_factor
(
    continent_id
,region_id
,country_id
,industry_sector_id
,industry_subsector_id
,config_etype_id
,emission_factor
,emission_source_id
,date_added
,added_by
,date_modified
,modified_by
)
values
    (
        null
    ,null
    ,null
    ,null
    ,null
    ,(select t1.id from static.t_ref_config_emissions_type t1
                            inner join static.t_ref_list 		t2	ON t2.list_id = t1.etype_id
                            inner join static.t_ref_list 		t3	on t3.list_id = t1.etypeattr1_id
                            left outer join  static.t_ref_list 	t4  on t4.list_id = t1.etypeattr2_id
                            left outer join  static.t_ref_list 	t5  on t5.list_id = t1.etypeattr3_id
                            left outer join  static.t_ref_list 	t6  on t6.list_id = t1.etypeattr4_id
                            inner join static.t_ref_list 		t8	ON 	t8.list_id = t1.etype_unit1_id
                            inner join static.t_ref_list 		t9	ON 	t9.list_id = t1.etype_unit2_id
      WHERE
              t2.list_value ='Fuel_combustion'
        and t3.list_value = 'Furnace Oil'
        and t8.list_value = 'Kiloleter'
        and t9.list_value = 'tCO2'
        )
    ,2.0
    ,(select list_id from static.t_ref_list where list_key='impactperformance_efactor_source' and list_value='INCCA Report 2007')
    ,now()
    ,'nidhish'
    ,now()
    ,'nidhish'
    );

insert into static.t_ref_config_emissions_factor
(
    continent_id
,region_id
,country_id
,industry_sector_id
,industry_subsector_id
,config_etype_id
,emission_factor
,emission_source_id
,date_added
,added_by
,date_modified
,modified_by
)
values
    (
        null
    ,null
    ,(select id from static.t_ref_countries where country='India')
    ,null
    ,null
    ,(select t1.id from static.t_ref_config_emissions_type t1
                            inner join static.t_ref_list 		t2	ON t2.list_id = t1.etype_id
                            inner join static.t_ref_list 		t3	on t3.list_id = t1.etypeattr1_id
                            left outer join  static.t_ref_list 	t4  on t4.list_id = t1.etypeattr2_id
                            left outer join  static.t_ref_list 	t5  on t5.list_id = t1.etypeattr3_id
                            left outer join  static.t_ref_list 	t6  on t6.list_id = t1.etypeattr4_id
                            inner join static.t_ref_list 		t8	ON 	t8.list_id = t1.etype_unit1_id
                            inner join static.t_ref_list 		t9	ON 	t9.list_id = t1.etype_unit2_id
      WHERE
              t2.list_value ='Distance_travelled'
        and t3.list_value = 'Passenger'
        and t4.list_value = 'Car - petrol'
        and t5.list_value = 'Petrol'
        and t8.list_value = 'KM'
        and t9.list_value = 'KgCO2'
        )
    ,0.18932
    ,null
    ,now()
    ,'nidhish'
    ,now()
    ,'nidhish'
    );

insert into static.t_ref_config_emissions_factor
(
    continent_id
,region_id
,country_id
,industry_sector_id
,industry_subsector_id
,config_etype_id
,emission_factor
,emission_source_id
,date_added
,added_by
,date_modified
,modified_by
)
values
    (
        null
    ,null
    ,(select id from static.t_ref_countries where country='India')
    ,null
    ,null
    ,(select t1.id from static.t_ref_config_emissions_type t1
                            inner join static.t_ref_list 		t2	ON t2.list_id = t1.etype_id
                            inner join static.t_ref_list 		t3	on t3.list_id = t1.etypeattr1_id
                            left outer join  static.t_ref_list 	t4  on t4.list_id = t1.etypeattr2_id
                            left outer join  static.t_ref_list 	t5  on t5.list_id = t1.etypeattr3_id
                            left outer join  static.t_ref_list 	t6  on t6.list_id = t1.etypeattr4_id
                            inner join static.t_ref_list 		t8	ON 	t8.list_id = t1.etype_unit1_id
                            inner join static.t_ref_list 		t9	ON 	t9.list_id = t1.etype_unit2_id
      WHERE
              t2.list_value ='Distance_travelled'
        and t3.list_value = 'Passenger'
        and t4.list_value = 'Car - diesel'
        and t5.list_value = 'Diesel'
        and t8.list_value = 'KM'
        and t9.list_value = 'KgCO2'
        )
    ,0.17631
    ,null
    ,now()
    ,'nidhish'
    ,now()
    ,'nidhish'
    );

insert into static.t_ref_config_emissions_factor
(
    continent_id
,region_id
,country_id
,industry_sector_id
,industry_subsector_id
,config_etype_id
,emission_factor
,emission_source_id
,date_added
,added_by
,date_modified
,modified_by
)
values
    (
        null
    ,null
    ,(select id from static.t_ref_countries where country='India')
    ,null
    ,null
    ,(select t1.id from static.t_ref_config_emissions_type t1
                            inner join static.t_ref_list 		t2	ON t2.list_id = t1.etype_id
                            inner join static.t_ref_list 		t3	on t3.list_id = t1.etypeattr1_id
                            left outer join  static.t_ref_list 	t4  on t4.list_id = t1.etypeattr2_id
                            left outer join  static.t_ref_list 	t5  on t5.list_id = t1.etypeattr3_id
                            left outer join  static.t_ref_list 	t6  on t6.list_id = t1.etypeattr4_id
                            inner join static.t_ref_list 		t8	ON 	t8.list_id = t1.etype_unit1_id
                            inner join static.t_ref_list 		t9	ON 	t9.list_id = t1.etype_unit2_id
      WHERE
              t2.list_value ='Distance_travelled'
        and t3.list_value = 'Passenger'
        and t4.list_value = 'Car - CNG'
        and t5.list_value = 'CNG'
        and t8.list_value = 'KM'
        and t9.list_value = 'KgCO2'
        )
    ,0.1496
    ,null
    ,now()
    ,'nidhish'
    ,now()
    ,'nidhish'
    );

insert into static.t_ref_config_emissions_factor
(
    continent_id
,region_id
,country_id
,industry_sector_id
,industry_subsector_id
,config_etype_id
,emission_factor
,emission_source_id
,date_added
,added_by
,date_modified
,modified_by
)
values
    (
        null
    ,null
    ,(select id from static.t_ref_countries where country='India')
    ,null
    ,null
    ,(select t1.id from static.t_ref_config_emissions_type t1
                            inner join static.t_ref_list 		t2	ON t2.list_id = t1.etype_id
                            inner join static.t_ref_list 		t3	on t3.list_id = t1.etypeattr1_id
                            left outer join  static.t_ref_list 	t4  on t4.list_id = t1.etypeattr2_id
                            left outer join  static.t_ref_list 	t5  on t5.list_id = t1.etypeattr3_id
                            left outer join  static.t_ref_list 	t6  on t6.list_id = t1.etypeattr4_id
                            inner join static.t_ref_list 		t8	ON 	t8.list_id = t1.etype_unit1_id
                            inner join static.t_ref_list 		t9	ON 	t9.list_id = t1.etype_unit2_id
      WHERE
              t2.list_value ='Distance_travelled'
        and t3.list_value = 'Passenger'
        and t4.list_value = 'Car - LPG'
        and t5.list_value = 'LPG'
        and t8.list_value = 'KM'
        and t9.list_value = 'KgCO2'
        )
    ,0.14923
    ,null
    ,now()
    ,'nidhish'
    ,now()
    ,'nidhish'
    );

insert into static.t_ref_config_emissions_factor
(
    continent_id
,region_id
,country_id
,industry_sector_id
,industry_subsector_id
,config_etype_id
,emission_factor
,emission_source_id
,date_added
,added_by
,date_modified
,modified_by
)
values
    (
        null
    ,null
    ,(select id from static.t_ref_countries where country='India')
    ,null
    ,null
    ,(select t1.id from static.t_ref_config_emissions_type t1
                            inner join static.t_ref_list 		t2	ON t2.list_id = t1.etype_id
                            inner join static.t_ref_list 		t3	on t3.list_id = t1.etypeattr1_id
                            left outer join  static.t_ref_list 	t4  on t4.list_id = t1.etypeattr2_id
                            left outer join  static.t_ref_list 	t5  on t5.list_id = t1.etypeattr3_id
                            left outer join  static.t_ref_list 	t6  on t6.list_id = t1.etypeattr4_id
                            inner join static.t_ref_list 		t8	ON 	t8.list_id = t1.etype_unit1_id
                            inner join static.t_ref_list 		t9	ON 	t9.list_id = t1.etype_unit2_id
      WHERE
              t2.list_value ='Distance_travelled'
        and t3.list_value = 'Passenger'
        and t4.list_value = 'Auto - petrol'
        and t5.list_value = 'Petrol'
        and t8.list_value = 'KM'
        and t9.list_value = 'KgCO2'
        )
    ,0.09087
    ,null
    ,now()
    ,'nidhish'
    ,now()
    ,'nidhish'
    );

insert into static.t_ref_config_emissions_factor
(
    continent_id
,region_id
,country_id
,industry_sector_id
,industry_subsector_id
,config_etype_id
,emission_factor
,emission_source_id
,date_added
,added_by
,date_modified
,modified_by
)
values
    (
        null
    ,null
    ,(select id from static.t_ref_countries where country='India')
    ,null
    ,null
    ,(select t1.id from static.t_ref_config_emissions_type t1
                            inner join static.t_ref_list 		t2	ON t2.list_id = t1.etype_id
                            inner join static.t_ref_list 		t3	on t3.list_id = t1.etypeattr1_id
                            left outer join  static.t_ref_list 	t4  on t4.list_id = t1.etypeattr2_id
                            left outer join  static.t_ref_list 	t5  on t5.list_id = t1.etypeattr3_id
                            left outer join  static.t_ref_list 	t6  on t6.list_id = t1.etypeattr4_id
                            inner join static.t_ref_list 		t8	ON 	t8.list_id = t1.etype_unit1_id
                            inner join static.t_ref_list 		t9	ON 	t9.list_id = t1.etype_unit2_id
      WHERE
              t2.list_value ='Distance_travelled'
        and t3.list_value = 'Passenger'
        and t4.list_value = 'Auto - CNG'
        and t5.list_value = 'CNG'
        and t8.list_value = 'KM'
        and t9.list_value = 'KgCO2'
        )
    ,0.07694
    ,null
    ,now()
    ,'nidhish'
    ,now()
    ,'nidhish'
    );

insert into static.t_ref_config_emissions_factor
(
    continent_id
,region_id
,country_id
,industry_sector_id
,industry_subsector_id
,config_etype_id
,emission_factor
,emission_source_id
,date_added
,added_by
,date_modified
,modified_by
)
values
    (
        null
    ,null
    ,(select id from static.t_ref_countries where country='India')
    ,null
    ,null
    ,(select t1.id from static.t_ref_config_emissions_type t1
                            inner join static.t_ref_list 		t2	ON t2.list_id = t1.etype_id
                            inner join static.t_ref_list 		t3	on t3.list_id = t1.etypeattr1_id
                            left outer join  static.t_ref_list 	t4  on t4.list_id = t1.etypeattr2_id
                            left outer join  static.t_ref_list 	t5  on t5.list_id = t1.etypeattr3_id
                            left outer join  static.t_ref_list 	t6  on t6.list_id = t1.etypeattr4_id
                            inner join static.t_ref_list 		t8	ON 	t8.list_id = t1.etype_unit1_id
                            inner join static.t_ref_list 		t9	ON 	t9.list_id = t1.etype_unit2_id
      WHERE
              t2.list_value ='Distance_travelled'
        and t3.list_value = 'Passenger'
        and t4.list_value = 'Auto - LPG'
        and t5.list_value = 'LPG'
        and t8.list_value = 'KM'
        and t9.list_value = 'KgCO2'
        )
    ,0.14923
    ,null
    ,now()
    ,'nidhish'
    ,now()
    ,'nidhish'
    );

insert into static.t_ref_config_emissions_factor
(
    continent_id
,region_id
,country_id
,industry_sector_id
,industry_subsector_id
,config_etype_id
,emission_factor
,emission_source_id
,date_added
,added_by
,date_modified
,modified_by
)
values
    (
        null
    ,null
    ,(select id from static.t_ref_countries where country='India')
    ,null
    ,null
    ,(select t1.id from static.t_ref_config_emissions_type t1
                            inner join static.t_ref_list 		t2	ON t2.list_id = t1.etype_id
                            inner join static.t_ref_list 		t3	on t3.list_id = t1.etypeattr1_id
                            left outer join  static.t_ref_list 	t4  on t4.list_id = t1.etypeattr2_id
                            left outer join  static.t_ref_list 	t5  on t5.list_id = t1.etypeattr3_id
                            left outer join  static.t_ref_list 	t6  on t6.list_id = t1.etypeattr4_id
                            inner join static.t_ref_list 		t8	ON 	t8.list_id = t1.etype_unit1_id
                            inner join static.t_ref_list 		t9	ON 	t9.list_id = t1.etype_unit2_id
      WHERE
              t2.list_value ='Distance_travelled'
        and t3.list_value = 'Commercial'
        and t4.list_value = 'Light Duty Vehicle (<3.5T)'
        and t5.list_value = 'Diesel'
        and t8.list_value = 'KM'
        and t9.list_value = 'KgCO2'
        )
    ,0.307
    ,null
    ,now()
    ,'nidhish'
    ,now()
    ,'nidhish'
    );

insert into static.t_ref_config_emissions_factor
(
    continent_id
,region_id
,country_id
,industry_sector_id
,industry_subsector_id
,config_etype_id
,emission_factor
,emission_source_id
,date_added
,added_by
,date_modified
,modified_by
)
values
    (
        null
    ,null
    ,(select id from static.t_ref_countries where country='India')
    ,null
    ,null
    ,(select t1.id from static.t_ref_config_emissions_type t1
                            inner join static.t_ref_list 		t2	ON t2.list_id = t1.etype_id
                            inner join static.t_ref_list 		t3	on t3.list_id = t1.etypeattr1_id
                            left outer join  static.t_ref_list 	t4  on t4.list_id = t1.etypeattr2_id
                            left outer join  static.t_ref_list 	t5  on t5.list_id = t1.etypeattr3_id
                            left outer join  static.t_ref_list 	t6  on t6.list_id = t1.etypeattr4_id
                            inner join static.t_ref_list 		t8	ON 	t8.list_id = t1.etype_unit1_id
                            inner join static.t_ref_list 		t9	ON 	t9.list_id = t1.etype_unit2_id
      WHERE
              t2.list_value ='Distance_travelled'
        and t3.list_value = 'Commercial'
        and t4.list_value = 'Medium Duty Vehicle (<12T)'
        and t5.list_value = 'Diesel'
        and t8.list_value = 'KM'
        and t9.list_value = 'KgCO2'
        )
    ,0.5928
    ,null
    ,now()
    ,'nidhish'
    ,now()
    ,'nidhish'
    );

insert into static.t_ref_config_emissions_factor
(
    continent_id
,region_id
,country_id
,industry_sector_id
,industry_subsector_id
,config_etype_id
,emission_factor
,emission_source_id
,date_added
,added_by
,date_modified
,modified_by
)
values
    (
        null
    ,null
    ,(select id from static.t_ref_countries where country='India')
    ,null
    ,null
    ,(select t1.id from static.t_ref_config_emissions_type t1
                            inner join static.t_ref_list 		t2	ON t2.list_id = t1.etype_id
                            inner join static.t_ref_list 		t3	on t3.list_id = t1.etypeattr1_id
                            left outer join  static.t_ref_list 	t4  on t4.list_id = t1.etypeattr2_id
                            left outer join  static.t_ref_list 	t5  on t5.list_id = t1.etypeattr3_id
                            left outer join  static.t_ref_list 	t6  on t6.list_id = t1.etypeattr4_id
                            inner join static.t_ref_list 		t8	ON 	t8.list_id = t1.etype_unit1_id
                            inner join static.t_ref_list 		t9	ON 	t9.list_id = t1.etype_unit2_id
      WHERE
              t2.list_value ='Distance_travelled'
        and t3.list_value = 'Commercial'
        and t4.list_value = 'Heavy Duty Vehicle (>12 T)'
        and t5.list_value = 'Diesel'
        and t8.list_value = 'KM'
        and t9.list_value = 'KgCO2'
        )
    ,0.7375
    ,null
    ,now()
    ,'nidhish'
    ,now()
    ,'nidhish'
    );


insert into static.t_ref_config_emissions_factor
(
    continent_id
,region_id
,country_id
,industry_sector_id
,industry_subsector_id
,config_etype_id
,emission_factor
,emission_source_id
,date_added
,added_by
,date_modified
,modified_by
)
values
    (
        null
    ,null
    ,(select id from static.t_ref_countries where country='India')
    ,null
    ,null
    ,(select t1.id from static.t_ref_config_emissions_type t1
                            inner join static.t_ref_list 		t2	ON t2.list_id = t1.etype_id
                            inner join static.t_ref_list 		t3	on t3.list_id = t1.etypeattr1_id
                            left outer join  static.t_ref_list 	t4  on t4.list_id = t1.etypeattr2_id
                            left outer join  static.t_ref_list 	t5  on t5.list_id = t1.etypeattr3_id
                            left outer join  static.t_ref_list 	t6  on t6.list_id = t1.etypeattr4_id
                            inner join static.t_ref_list 		t8	ON 	t8.list_id = t1.etype_unit1_id
                            inner join static.t_ref_list 		t9	ON 	t9.list_id = t1.etype_unit2_id
      WHERE
              t2.list_value ='Distance_travelled'
        and t3.list_value = 'Commercial'
        and t4.list_value = 'Truck >16T'
        and t5.list_value = 'Diesel'
        and t8.list_value = 'KM'
        and t9.list_value = 'KgCO2'
        )
    ,0.88154
    ,null
    ,now()
    ,'nidhish'
    ,now()
    ,'nidhish'
    );

insert into static.t_ref_config_emissions_factor
(
    continent_id
,region_id
,country_id
,industry_sector_id
,industry_subsector_id
,config_etype_id
,emission_factor
,emission_source_id
,date_added
,added_by
,date_modified
,modified_by
)
values
    (
        null
    ,null
    ,(select id from static.t_ref_countries where country='India')
    ,null
    ,null
    ,(select t1.id from static.t_ref_config_emissions_type t1
                            inner join static.t_ref_list 		t2	ON t2.list_id = t1.etype_id
                            inner join static.t_ref_list 		t3	on t3.list_id = t1.etypeattr1_id
                            left outer join  static.t_ref_list 	t4  on t4.list_id = t1.etypeattr2_id
                            left outer join  static.t_ref_list 	t5  on t5.list_id = t1.etypeattr3_id
                            left outer join  static.t_ref_list 	t6  on t6.list_id = t1.etypeattr4_id
                            inner join static.t_ref_list 		t8	ON 	t8.list_id = t1.etype_unit1_id
                            inner join static.t_ref_list 		t9	ON 	t9.list_id = t1.etype_unit2_id
      WHERE
              t2.list_value ='Distance_travelled'
        and t3.list_value = 'Commercial'
        and t4.list_value = 'Bus'
        and t5.list_value = 'Diesel'
        and t8.list_value = 'KM'
        and t9.list_value = 'KgCO2'
        )
    ,0.52893
    ,null
    ,now()
    ,'nidhish'
    ,now()
    ,'nidhish'
    );

insert into static.t_ref_config_emissions_factor
(
    continent_id
,region_id
,country_id
,industry_sector_id
,industry_subsector_id
,config_etype_id
,emission_factor
,emission_source_id
,date_added
,added_by
,date_modified
,modified_by
)
values
    (
        null
    ,null
    ,(select id from static.t_ref_countries where country='India')
    ,null
    ,null
    ,(select t1.id from static.t_ref_config_emissions_type t1
                            inner join static.t_ref_list 		t2	ON t2.list_id = t1.etype_id
                            inner join static.t_ref_list 		t3	on t3.list_id = t1.etypeattr1_id
                            left outer join  static.t_ref_list 	t4  on t4.list_id = t1.etypeattr2_id
                            left outer join  static.t_ref_list 	t5  on t5.list_id = t1.etypeattr3_id
                            left outer join  static.t_ref_list 	t6  on t6.list_id = t1.etypeattr4_id
                            inner join static.t_ref_list 		t8	ON 	t8.list_id = t1.etype_unit1_id
                            inner join static.t_ref_list 		t9	ON 	t9.list_id = t1.etype_unit2_id
      WHERE
              t2.list_value ='Distance_travelled'
        and t3.list_value = 'Commercial'
        and t4.list_value = 'Van/Omni'
        and t5.list_value = 'Petrol'
        and t8.list_value = 'KM'
        and t9.list_value = 'KgCO2'
        )
    ,0.2
    ,null
    ,now()
    ,'nidhish'
    ,now()
    ,'nidhish'
    );

insert into static.t_ref_config_emissions_factor
(
    continent_id
,region_id
,country_id
,industry_sector_id
,industry_subsector_id
,config_etype_id
,emission_factor
,emission_source_id
,date_added
,added_by
,date_modified
,modified_by
)
values
    (
        null
    ,null
    ,(select id from static.t_ref_countries where country='United Kingdom')
    ,null
    ,null
    ,(select t1.id from static.t_ref_config_emissions_type t1
                            inner join static.t_ref_list 		t2	ON t2.list_id = t1.etype_id
                            inner join static.t_ref_list 		t3	on t3.list_id = t1.etypeattr1_id
                            left outer join  static.t_ref_list 	t4  on t4.list_id = t1.etypeattr2_id
                            left outer join  static.t_ref_list 	t5  on t5.list_id = t1.etypeattr3_id
                            left outer join  static.t_ref_list 	t6  on t6.list_id = t1.etypeattr4_id
                            inner join static.t_ref_list 		t8	ON 	t8.list_id = t1.etype_unit1_id
                            inner join static.t_ref_list 		t9	ON 	t9.list_id = t1.etype_unit2_id
      WHERE
              t2.list_value ='Distance_travelled'
        and t3.list_value = 'Passenger'
        and t4.list_value = 'Car - petrol'
        and t5.list_value = 'Petrol'
        and t8.list_value = 'KM'
        and t9.list_value = 'KgCO2'
        )
    ,0.1421
    ,null
    ,now()
    ,'nidhish'
    ,now()
    ,'nidhish'
    );

insert into static.t_ref_config_emissions_factor
(
    continent_id
,region_id
,country_id
,industry_sector_id
,industry_subsector_id
,config_etype_id
,emission_factor
,emission_source_id
,date_added
,added_by
,date_modified
,modified_by
)
values
    (
        null
    ,null
    ,(select id from static.t_ref_countries where country='United Kingdom')
    ,null
    ,null
    ,(select t1.id from static.t_ref_config_emissions_type t1
                            inner join static.t_ref_list 		t2	ON t2.list_id = t1.etype_id
                            inner join static.t_ref_list 		t3	on t3.list_id = t1.etypeattr1_id
                            left outer join  static.t_ref_list 	t4  on t4.list_id = t1.etypeattr2_id
                            left outer join  static.t_ref_list 	t5  on t5.list_id = t1.etypeattr3_id
                            left outer join  static.t_ref_list 	t6  on t6.list_id = t1.etypeattr4_id
                            inner join static.t_ref_list 		t8	ON 	t8.list_id = t1.etype_unit1_id
                            inner join static.t_ref_list 		t9	ON 	t9.list_id = t1.etype_unit2_id
      WHERE
              t2.list_value ='Distance_travelled'
        and t3.list_value = 'Passenger'
        and t4.list_value = 'Car - diesel'
        and t5.list_value = 'Diesel'
        and t8.list_value = 'KM'
        and t9.list_value = 'KgCO2'
        )
    ,0.1365
    ,null
    ,now()
    ,'nidhish'
    ,now()
    ,'nidhish'
    );

insert into static.t_ref_config_emissions_factor
(
    continent_id
,region_id
,country_id
,industry_sector_id
,industry_subsector_id
,config_etype_id
,emission_factor
,emission_source_id
,date_added
,added_by
,date_modified
,modified_by
)
values
    (
        null
    ,null
    ,(select id from static.t_ref_countries where country='United Kingdom')
    ,null
    ,null
    ,(select t1.id from static.t_ref_config_emissions_type t1
                            inner join static.t_ref_list 		t2	ON t2.list_id = t1.etype_id
                            inner join static.t_ref_list 		t3	on t3.list_id = t1.etypeattr1_id
                            left outer join  static.t_ref_list 	t4  on t4.list_id = t1.etypeattr2_id
                            left outer join  static.t_ref_list 	t5  on t5.list_id = t1.etypeattr3_id
                            left outer join  static.t_ref_list 	t6  on t6.list_id = t1.etypeattr4_id
                            inner join static.t_ref_list 		t8	ON 	t8.list_id = t1.etype_unit1_id
                            inner join static.t_ref_list 		t9	ON 	t9.list_id = t1.etype_unit2_id
      WHERE
              t2.list_value ='Distance_travelled'
        and t3.list_value = 'Commercial'
        and t4.list_value = 'Light Duty Vehicle (<3.5T)'
        and t5.list_value = 'Diesel'
        and t8.list_value = 'KM'
        and t9.list_value = 'KgCO2'
        )
    ,0.24116
    ,null
    ,now()
    ,'nidhish'
    ,now()
    ,'nidhish'
    );

insert into static.t_ref_config_emissions_factor
(
    continent_id
,region_id
,country_id
,industry_sector_id
,industry_subsector_id
,config_etype_id
,emission_factor
,emission_source_id
,date_added
,added_by
,date_modified
,modified_by
)
values
    (
        null
    ,null
    ,(select id from static.t_ref_countries where country='United Kingdom')
    ,null
    ,null
    ,(select t1.id from static.t_ref_config_emissions_type t1
                            inner join static.t_ref_list 		t2	ON t2.list_id = t1.etype_id
                            inner join static.t_ref_list 		t3	on t3.list_id = t1.etypeattr1_id
                            left outer join  static.t_ref_list 	t4  on t4.list_id = t1.etypeattr2_id
                            left outer join  static.t_ref_list 	t5  on t5.list_id = t1.etypeattr3_id
                            left outer join  static.t_ref_list 	t6  on t6.list_id = t1.etypeattr4_id
                            inner join static.t_ref_list 		t8	ON 	t8.list_id = t1.etype_unit1_id
                            inner join static.t_ref_list 		t9	ON 	t9.list_id = t1.etype_unit2_id
      WHERE
              t2.list_value ='Distance_travelled'
        and t3.list_value = 'Commercial'
        and t4.list_value = 'Medium Duty Vehicle (<12T)'
        and t5.list_value = 'Diesel'
        and t8.list_value = 'KM'
        and t9.list_value = 'KgCO2'
        )
    ,0.48058
    ,null
    ,now()
    ,'nidhish'
    ,now()
    ,'nidhish'
    );

insert into static.t_ref_config_emissions_factor
(
    continent_id
,region_id
,country_id
,industry_sector_id
,industry_subsector_id
,config_etype_id
,emission_factor
,emission_source_id
,date_added
,added_by
,date_modified
,modified_by
)
values
    (
        null
    ,null
    ,(select id from static.t_ref_countries where country='United Kingdom')
    ,null
    ,null
    ,(select t1.id from static.t_ref_config_emissions_type t1
                            inner join static.t_ref_list 		t2	ON t2.list_id = t1.etype_id
                            inner join static.t_ref_list 		t3	on t3.list_id = t1.etypeattr1_id
                            left outer join  static.t_ref_list 	t4  on t4.list_id = t1.etypeattr2_id
                            left outer join  static.t_ref_list 	t5  on t5.list_id = t1.etypeattr3_id
                            left outer join  static.t_ref_list 	t6  on t6.list_id = t1.etypeattr4_id
                            inner join static.t_ref_list 		t8	ON 	t8.list_id = t1.etype_unit1_id
                            inner join static.t_ref_list 		t9	ON 	t9.list_id = t1.etype_unit2_id
      WHERE
              t2.list_value ='Distance_travelled'
        and t3.list_value = 'Commercial'
        and t4.list_value = 'Heavy Duty Vehicle (>12 T)'
        and t5.list_value = 'Diesel'
        and t8.list_value = 'KM'
        and t9.list_value = 'KgCO2'
        )
    ,0.58692
    ,null
    ,now()
    ,'nidhish'
    ,now()
    ,'nidhish'
    );


insert into static.t_ref_config_emissions_factor
(
    continent_id
,region_id
,country_id
,industry_sector_id
,industry_subsector_id
,config_etype_id
,emission_factor
,emission_source_id
,date_added
,added_by
,date_modified
,modified_by
)
values
    (
        null
    ,null
    ,(select id from static.t_ref_countries where country='United Kingdom')
    ,null
    ,null
    ,(select t1.id from static.t_ref_config_emissions_type t1
                            inner join static.t_ref_list 		t2	ON t2.list_id = t1.etype_id
                            inner join static.t_ref_list 		t3	on t3.list_id = t1.etypeattr1_id
                            left outer join  static.t_ref_list 	t4  on t4.list_id = t1.etypeattr2_id
                            left outer join  static.t_ref_list 	t5  on t5.list_id = t1.etypeattr3_id
                            left outer join  static.t_ref_list 	t6  on t6.list_id = t1.etypeattr4_id
                            inner join static.t_ref_list 		t8	ON 	t8.list_id = t1.etype_unit1_id
                            inner join static.t_ref_list 		t9	ON 	t9.list_id = t1.etype_unit2_id
      WHERE
              t2.list_value ='Distance_travelled'
        and t3.list_value = 'Commercial'
        and t4.list_value = 'Truck >16T'
        and t5.list_value = 'Diesel'
        and t8.list_value = 'KM'
        and t9.list_value = 'KgCO2'
        )
    ,0.95752
    ,null
    ,now()
    ,'nidhish'
    ,now()
    ,'nidhish'
    );

insert into static.t_ref_config_emissions_factor
(
    continent_id
,region_id
,country_id
,industry_sector_id
,industry_subsector_id
,config_etype_id
,emission_factor
,emission_source_id
,date_added
,added_by
,date_modified
,modified_by
)
values
    (
        null
    ,null
    ,(select id from static.t_ref_countries where country='United Kingdom')
    ,null
    ,null
    ,(select t1.id from static.t_ref_config_emissions_type t1
                            inner join static.t_ref_list 		t2	ON t2.list_id = t1.etype_id
                            inner join static.t_ref_list 		t3	on t3.list_id = t1.etypeattr1_id
                            left outer join  static.t_ref_list 	t4  on t4.list_id = t1.etypeattr2_id
                            left outer join  static.t_ref_list 	t5  on t5.list_id = t1.etypeattr3_id
                            left outer join  static.t_ref_list 	t6  on t6.list_id = t1.etypeattr4_id
                            inner join static.t_ref_list 		t8	ON 	t8.list_id = t1.etype_unit1_id
                            inner join static.t_ref_list 		t9	ON 	t9.list_id = t1.etype_unit2_id
      WHERE
              t2.list_value ='Distance_travelled'
        and t3.list_value = 'Commercial'
        and t4.list_value = 'Bus'
        and t5.list_value = 'Diesel'
        and t8.list_value = 'KM'
        and t9.list_value = 'KgCO2'
        )
    ,0.10227
    ,null
    ,now()
    ,'nidhish'
    ,now()
    ,'nidhish'
    );

insert into static.t_ref_config_emissions_factor
(
    continent_id
,region_id
,country_id
,industry_sector_id
,industry_subsector_id
,config_etype_id
,emission_factor
,emission_source_id
,date_added
,added_by
,date_modified
,modified_by
)
values
    (
        null
    ,null
    ,(select id from static.t_ref_countries where country='United Kingdom')
    ,null
    ,null
    ,(select t1.id from static.t_ref_config_emissions_type t1
                            inner join static.t_ref_list 		t2	ON t2.list_id = t1.etype_id
                            inner join static.t_ref_list 		t3	on t3.list_id = t1.etypeattr1_id
                            left outer join  static.t_ref_list 	t4  on t4.list_id = t1.etypeattr2_id
                            left outer join  static.t_ref_list 	t5  on t5.list_id = t1.etypeattr3_id
                            left outer join  static.t_ref_list 	t6  on t6.list_id = t1.etypeattr4_id
                            inner join static.t_ref_list 		t8	ON 	t8.list_id = t1.etype_unit1_id
                            inner join static.t_ref_list 		t9	ON 	t9.list_id = t1.etype_unit2_id
      WHERE
              t2.list_value ='Distance_travelled'
        and t3.list_value = 'Commercial'
        and t4.list_value = 'Van/Omni'
        and t5.list_value = 'Petrol'
        and t8.list_value = 'KM'
        and t9.list_value = 'KgCO2'
        )
    ,0.2402
    ,null
    ,now()
    ,'nidhish'
    ,now()
    ,'nidhish'
    );

insert into static.t_ref_config_emissions_factor
(
    continent_id
,region_id
,country_id
,industry_sector_id
,industry_subsector_id
,config_etype_id
,emission_factor
,emission_source_id
,date_added
,added_by
,date_modified
,modified_by
)
values
    (
        null
    ,null
    ,(select id from static.t_ref_countries where country='United Kingdom')
    ,null
    ,null
    ,(select t1.id from static.t_ref_config_emissions_type t1
                            inner join static.t_ref_list 		t2	ON t2.list_id = t1.etype_id
                            inner join static.t_ref_list 		t3	on t3.list_id = t1.etypeattr1_id
                            left outer join  static.t_ref_list 	t4  on t4.list_id = t1.etypeattr2_id
                            left outer join  static.t_ref_list 	t5  on t5.list_id = t1.etypeattr3_id
                            left outer join  static.t_ref_list 	t6  on t6.list_id = t1.etypeattr4_id
                            inner join static.t_ref_list 		t8	ON 	t8.list_id = t1.etype_unit1_id
                            inner join static.t_ref_list 		t9	ON 	t9.list_id = t1.etype_unit2_id
      WHERE
              t2.list_value ='Grid_emission'
        and t3.list_value = 'Grid_emission'
        and t8.list_value = 'kWh'
        and t9.list_value = 'KgCO2'
        )
    ,0.21233
    ,(select list_id from static.t_ref_list where list_key='impactperformance_efactor_source' and list_value='DEFRA factors SB file')
    ,now()
    ,'nidhish'
    ,now()
    ,'nidhish'
    );

insert into static.t_ref_config_emissions_factor
(
    continent_id
,region_id
,country_id
,industry_sector_id
,industry_subsector_id
,config_etype_id
,emission_factor
,emission_source_id
,date_added
,added_by
,date_modified
,modified_by
)
values
    (
        null
    ,null
    ,null
    ,null
    ,null
    ,(select t1.id from static.t_ref_config_emissions_type t1
                            inner join static.t_ref_list 		t2	ON t2.list_id = t1.etype_id
                            inner join static.t_ref_list 		t3	on t3.list_id = t1.etypeattr1_id
                            left outer join  static.t_ref_list 	t4  on t4.list_id = t1.etypeattr2_id
                            left outer join  static.t_ref_list 	t5  on t5.list_id = t1.etypeattr3_id
                            left outer join  static.t_ref_list 	t6  on t6.list_id = t1.etypeattr4_id
                            inner join static.t_ref_list 		t8	ON 	t8.list_id = t1.etype_unit1_id
                            inner join static.t_ref_list 		t9	ON 	t9.list_id = t1.etype_unit2_id
      WHERE
              t2.list_value ='Grid_emission'
        and t3.list_value = 'Grid_emission'
        and t8.list_value = 'kWh'
        and t9.list_value = 'KgCO2'
        )
    ,0.281
    ,null
    ,now()
    ,'nidhish'
    ,now()
    ,'nidhish'
    );

insert into static.t_ref_config_emissions_factor
(
    continent_id
,region_id
,country_id
,industry_sector_id
,industry_subsector_id
,config_etype_id
,emission_factor
,emission_source_id
,date_added
,added_by
,date_modified
,modified_by
)
values
    (
        (select id from static.t_ref_continent where continent='Europe')
    ,null
    ,null
    ,null
    ,null
    ,(select t1.id from static.t_ref_config_emissions_type t1
                            inner join static.t_ref_list 		t2	ON t2.list_id = t1.etype_id
                            inner join static.t_ref_list 		t3	on t3.list_id = t1.etypeattr1_id
                            left outer join  static.t_ref_list 	t4  on t4.list_id = t1.etypeattr2_id
                            left outer join  static.t_ref_list 	t5  on t5.list_id = t1.etypeattr3_id
                            left outer join  static.t_ref_list 	t6  on t6.list_id = t1.etypeattr4_id
                            inner join static.t_ref_list 		t8	ON 	t8.list_id = t1.etype_unit1_id
                            inner join static.t_ref_list 		t9	ON 	t9.list_id = t1.etype_unit2_id
      WHERE
              t2.list_value ='Grid_emission'
        and t3.list_value = 'Grid_emission'
        and t8.list_value = 'kWh'
        and t9.list_value = 'KgCO2'
        )
    ,0.281
    ,null
    ,now()
    ,'nidhish'
    ,now()
    ,'nidhish'
    );

insert into static.t_ref_config_emissions_factor
(
    continent_id
,region_id
,country_id
,industry_sector_id
,industry_subsector_id
,config_etype_id
,emission_factor
,emission_source_id
,date_added
,added_by
,date_modified
,modified_by
)
values
    (
        null
    ,null
    ,(select id from static.t_ref_countries where country='India')
    ,null
    ,null
    ,(select t1.id from static.t_ref_config_emissions_type t1
                            inner join static.t_ref_list 		t2	ON t2.list_id = t1.etype_id
                            inner join static.t_ref_list 		t3	on t3.list_id = t1.etypeattr1_id
                            left outer join  static.t_ref_list 	t4  on t4.list_id = t1.etypeattr2_id
                            left outer join  static.t_ref_list 	t5  on t5.list_id = t1.etypeattr3_id
                            left outer join  static.t_ref_list 	t6  on t6.list_id = t1.etypeattr4_id
                            inner join static.t_ref_list 		t8	ON 	t8.list_id = t1.etype_unit1_id
                            inner join static.t_ref_list 		t9	ON 	t9.list_id = t1.etype_unit2_id
      WHERE
              t2.list_value ='Grid_emission'
        and t3.list_value = 'Grid_emission'
        and t8.list_value = 'kWh'
        and t9.list_value = 'KgCO2'
        )
    ,0.82
    ,(select list_id from static.t_ref_list where list_key='impactperformance_efactor_source' and list_value='Dec 2018, CEA')
    ,now()
    ,'nidhish'
    ,now()
    ,'nidhish'
    );

insert into static.t_ref_config_emissions_factor
(
    continent_id
,region_id
,country_id
,industry_sector_id
,industry_subsector_id
,config_etype_id
,emission_factor
,emission_source_id
,date_added
,added_by
,date_modified
,modified_by
)
values
    (
        null
    ,null
    ,(select id from static.t_ref_countries where country='Ireland')
    ,null
    ,null
    ,(select t1.id from static.t_ref_config_emissions_type t1
                            inner join static.t_ref_list 		t2	ON t2.list_id = t1.etype_id
                            inner join static.t_ref_list 		t3	on t3.list_id = t1.etypeattr1_id
                            left outer join  static.t_ref_list 	t4  on t4.list_id = t1.etypeattr2_id
                            left outer join  static.t_ref_list 	t5  on t5.list_id = t1.etypeattr3_id
                            left outer join  static.t_ref_list 	t6  on t6.list_id = t1.etypeattr4_id
                            inner join static.t_ref_list 		t8	ON 	t8.list_id = t1.etype_unit1_id
                            inner join static.t_ref_list 		t9	ON 	t9.list_id = t1.etype_unit2_id
      WHERE
              t2.list_value ='Grid_emission'
        and t3.list_value = 'Grid_emission'
        and t8.list_value = 'kWh'
        and t9.list_value = 'KgCO2'
        )
    ,0.2786
    ,null
    ,now()
    ,'nidhish'
    ,now()
    ,'nidhish'
    );