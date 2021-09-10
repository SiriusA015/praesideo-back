INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'impactm_emission_type', 'Scope3_employee_commute', now(),'nidhish'
    WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_emission_type' and list_value='Scope3_employee_commute');

INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'impactm_emission_type', 'Scope3_business_travel', now(),'nidhish'
    WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_emission_type' and list_value='Scope3_business_travel');

INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'impactm_employee_commute_transport_mode', 'Motorcycle/Scooter', now(),'nidhish'
    WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_employee_commute_transport_mode' and list_value='Motorcycle/Scooter');

INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'impactm_employee_commute_transport_mode', 'Three wheeler', now(),'nidhish'
    WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_employee_commute_transport_mode' and list_value='Three wheeler');

INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'impactm_employee_commute_transport_mode', 'Car - petrol', now(),'nidhish'
    WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_employee_commute_transport_mode' and list_value='Car - petrol');

INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'impactm_employee_commute_transport_mode', 'Car - diesel', now(),'nidhish'
    WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_employee_commute_transport_mode' and list_value='Car - diesel');

INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'impactm_employee_commute_transport_mode', 'Bus', now(),'nidhish'
    WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_employee_commute_transport_mode' and list_value='Bus');

INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'impactm_employee_commute_transport_mode', 'Subway/Metro/Train', now(),'nidhish'
    WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_employee_commute_transport_mode' and list_value='Subway/Metro/Train');

INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'impactm_business_travel_transport_mode', 'Transit Rail (i.e. Subway, Tram)', now(),'nidhish'
    WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_business_travel_transport_mode' and list_value='Transit Rail (i.e. Subway, Tram)');

INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'impactm_business_travel_transport_mode', 'Intercity Rail (i.e. Amtrak)', now(),'nidhish'
    WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_business_travel_transport_mode' and list_value='Intercity Rail (i.e. Amtrak)');

INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'impactm_business_travel_transport_mode', 'Air Travel - Short Haul', now(),'nidhish'
    WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_business_travel_transport_mode' and list_value='Air Travel - Short Haul');

INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'impactm_business_travel_transport_mode', 'Air Travel - Medium Haul', now(),'nidhish'
    WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_business_travel_transport_mode' and list_value='Air Travel - Medium Haul');

INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'impactm_business_travel_transport_mode', 'Air Travel - Long Haul', now(),'nidhish'
    WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_business_travel_transport_mode' and list_value='Air Travel - Long Haul');





