INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'impactm_business_travel_transport_mode', 'Motorcycle/Scooter', now(),'song'
    WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_business_travel_transport_mode' and list_value='Motorcycle/Scooter');

INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'impactm_business_travel_transport_mode', 'Three wheeler', now(),'song'
    WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_business_travel_transport_mode' and list_value='Three wheeler');

INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'impactm_business_travel_transport_mode', 'Car - petrol', now(),'song'
    WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_business_travel_transport_mode' and list_value='Car - petrol');

INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'impactm_business_travel_transport_mode', 'Car - diesel', now(),'song'
    WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_business_travel_transport_mode' and list_value='Car - diesel');

INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'impactm_business_travel_transport_mode', 'Bus', now(),'song'
    WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_business_travel_transport_mode' and list_value='Bus');

INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'impactm_business_travel_transport_mode', 'Subway/Metro/Train', now(),'song'
    WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_business_travel_transport_mode' and list_value='Subway/Metro/Train');

INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'impactm_emission_factor_source', 'Motorcycle/Scooter European Environment Agency', now(),'song'
    WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_emission_factor_source' and list_value='Motorcycle/Scooter European Environment Agency');

INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'impactm_emission_factor_source', 'Three wheeler European Environment Agency', now(),'song'
    WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_emission_factor_source' and list_value='Three wheeler European Environment Agency');

INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'impactm_emission_factor_source', 'Car- Petrol European Environment Agency', now(),'song'
    WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_emission_factor_source' and list_value='Car - Petrol European Environment Agency');

INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'impactm_emission_factor_source', 'Car - diesel European Environment Agency', now(),'song'
    WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_emission_factor_source' and list_value='Car - diesel European Environment Agency');

INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'impactm_emission_factor_source', 'Car - Taxi European Environment Agency', now(),'song'
    WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_emission_factor_source' and list_value='Car - Taxi European Environment Agency');

INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'impactm_emission_factor_source', 'Bus European Environment Agency', now(),'song'
    WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_emission_factor_source' and list_value='Bus European Environment Agency');

INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'impactm_emission_factor_source', 'Subway /Metro/Train European Environment Agency', now(),'song'
    WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_emission_factor_source' and list_value='Subway /Metro/Train European Environment Agency');