
update static.t_ref_list set list_value = 'tons' where list_value='Tons';
update static.t_ref_list set list_value = 'KL' where list_value='Kiloleter';
update static.t_ref_list set list_value = 'Liquefied petroleum gas (LPG)' where list_value='LPG';
update static.t_ref_list set list_value = 'km' where list_value='KM';
update static.t_ref_list set list_value = 'miles' where list_value='Miles';
update static.t_ref_list set list_value = 'kWh' where list_value='KWH';
update static.t_ref_list set list_value = 'kgCO2e' where list_value='KgCO2';

INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'impactperformance_measurement_unit','kg',now(),'nidhish'
    WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactperformance_measurement_unit' and list_value='kg');

INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'impactm_refrigerant_aerosols','Carbon dioxide',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_refrigerant_aerosols' and list_value='Carbon dioxide');
INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'impactm_refrigerant_aerosols','Methane',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_refrigerant_aerosols' and list_value='Methane');
INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'impactm_refrigerant_aerosols','Nitrous oxide',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_refrigerant_aerosols' and list_value='Nitrous oxide');
INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'impactm_refrigerant_aerosols','HFC-23',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_refrigerant_aerosols' and list_value='HFC-23');
INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'impactm_refrigerant_aerosols','HFC-32',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_refrigerant_aerosols' and list_value='HFC-32');
INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'impactm_refrigerant_aerosols','HFC-41',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_refrigerant_aerosols' and list_value='HFC-41');
INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'impactm_refrigerant_aerosols','HFC-125',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_refrigerant_aerosols' and list_value='HFC-125');
INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'impactm_refrigerant_aerosols','HFC-134',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_refrigerant_aerosols' and list_value='HFC-134');
INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'impactm_refrigerant_aerosols','HFC-134a',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_refrigerant_aerosols' and list_value='HFC-134a');
INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'impactm_refrigerant_aerosols','HFC-143',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_refrigerant_aerosols' and list_value='HFC-143');
INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'impactm_refrigerant_aerosols','HFC-143a',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_refrigerant_aerosols' and list_value='HFC-143a');
INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'impactm_refrigerant_aerosols','HFC-152a',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_refrigerant_aerosols' and list_value='HFC-152a');
INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'impactm_refrigerant_aerosols','HFC-227ea',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_refrigerant_aerosols' and list_value='HFC-227ea');
INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'impactm_refrigerant_aerosols','HFC-236fa',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_refrigerant_aerosols' and list_value='HFC-236fa');
INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'impactm_refrigerant_aerosols','HFC-245fa',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_refrigerant_aerosols' and list_value='HFC-245fa');
INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'impactm_refrigerant_aerosols','HFC-43-I0mee',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_refrigerant_aerosols' and list_value='HFC-43-I0mee');
INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'impactm_refrigerant_aerosols','Perfluoromethane (PFC-14)',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_refrigerant_aerosols' and list_value='Perfluoromethane (PFC-14)');
INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'impactm_refrigerant_aerosols','Perfluoroethane (PFC-116)',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_refrigerant_aerosols' and list_value='Perfluoroethane (PFC-116)');
INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'impactm_refrigerant_aerosols','Perfluoropropane (PFC-218)',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_refrigerant_aerosols' and list_value='Perfluoropropane (PFC-218)');
INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'impactm_refrigerant_aerosols','Perfluorocyclobutane (PFC-318)',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_refrigerant_aerosols' and list_value='Perfluorocyclobutane (PFC-318)');
INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'impactm_refrigerant_aerosols','Perfluorobutane (PFC-3-1-10)',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_refrigerant_aerosols' and list_value='Perfluorobutane (PFC-3-1-10)');
INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'impactm_refrigerant_aerosols','Perfluoropentane (PFC-4-1-12)',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_refrigerant_aerosols' and list_value='Perfluoropentane (PFC-4-1-12)');
INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'impactm_refrigerant_aerosols','Perfluorohexane (PFC-5-1-14)',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_refrigerant_aerosols' and list_value='Perfluorohexane (PFC-5-1-14)');
INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'impactm_refrigerant_aerosols','Sulphur hexafluoride (SF6)',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_refrigerant_aerosols' and list_value='Sulphur hexafluoride (SF6)');
INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'impactm_refrigerant_aerosols','HFC-152',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_refrigerant_aerosols' and list_value='HFC-152');
INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'impactm_refrigerant_aerosols','HFC-161',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_refrigerant_aerosols' and list_value='HFC-161');
INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'impactm_refrigerant_aerosols','HFC-236cb',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_refrigerant_aerosols' and list_value='HFC-236cb');
INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'impactm_refrigerant_aerosols','HFC-236ea',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_refrigerant_aerosols' and list_value='HFC-236ea');
INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'impactm_refrigerant_aerosols','HFC-245ca',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_refrigerant_aerosols' and list_value='HFC-245ca');
INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'impactm_refrigerant_aerosols','HFC-365mfc',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_refrigerant_aerosols' and list_value='HFC-365mfc');
INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'impactm_refrigerant_aerosols','HFC-23 (R-23)',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_refrigerant_aerosols' and list_value='HFC-23 (R-23)');
INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'impactm_refrigerant_aerosols','HFC-32 (R-32)',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_refrigerant_aerosols' and list_value='HFC-32 (R-32)');
INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'impactm_refrigerant_aerosols','HFC-41 (R-41)',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_refrigerant_aerosols' and list_value='HFC-41 (R-41)');
INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'impactm_refrigerant_aerosols','HFC-125 (R-125)',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_refrigerant_aerosols' and list_value='HFC-125 (R-125)');
INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'impactm_refrigerant_aerosols','HFC-134 (R-134)',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_refrigerant_aerosols' and list_value='HFC-134 (R-134)');
INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'impactm_refrigerant_aerosols','HFC-134a (R-134a)',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_refrigerant_aerosols' and list_value='HFC-134a (R-134a)');
INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'impactm_refrigerant_aerosols','HFC-143 (R-143)',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_refrigerant_aerosols' and list_value='HFC-143 (R-143)');
INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'impactm_refrigerant_aerosols','HFC-143a (R-143a)',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_refrigerant_aerosols' and list_value='HFC-143a (R-143a)');
INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'impactm_refrigerant_aerosols','HFC-152 (R-152)',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_refrigerant_aerosols' and list_value='HFC-152 (R-152)');
INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'impactm_refrigerant_aerosols','HFC-152a (R-152a)',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_refrigerant_aerosols' and list_value='HFC-152a (R-152a)');
INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'impactm_refrigerant_aerosols','HFC-161 (R-161)',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_refrigerant_aerosols' and list_value='HFC-161 (R-161)');
INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'impactm_refrigerant_aerosols','HFC-227ea (R-227ea)',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_refrigerant_aerosols' and list_value='HFC-227ea (R-227ea)');
INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'impactm_refrigerant_aerosols','HFC-236cb (R-236cb)',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_refrigerant_aerosols' and list_value='HFC-236cb (R-236cb)');
INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'impactm_refrigerant_aerosols','HFC-236ea (R-236ea)',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_refrigerant_aerosols' and list_value='HFC-236ea (R-236ea)');
INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'impactm_refrigerant_aerosols','HFC-236fa (R-236fa)',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_refrigerant_aerosols' and list_value='HFC-236fa (R-236fa)');
INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'impactm_refrigerant_aerosols','HFC-245ca (R-245ca)',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_refrigerant_aerosols' and list_value='HFC-245ca (R-245ca)');
INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'impactm_refrigerant_aerosols','HFC-245fa (R-245fa)',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_refrigerant_aerosols' and list_value='HFC-245fa (R-245fa)');
INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'impactm_refrigerant_aerosols','HFC-365mfc  ',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_refrigerant_aerosols' and list_value='HFC-365mfc  ');
INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'impactm_refrigerant_aerosols','HFC-43-10mee (R-4310)',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_refrigerant_aerosols' and list_value='HFC-43-10mee (R-4310)');
INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'impactm_refrigerant_aerosols','Perfluorocarbons (PFCs)',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_refrigerant_aerosols' and list_value='Perfluorocarbons (PFCs)');
INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'impactm_refrigerant_aerosols','PFC-14 (Perfluoromethane)',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_refrigerant_aerosols' and list_value='PFC-14 (Perfluoromethane)');
INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'impactm_refrigerant_aerosols','PFC-116 (Perfluoroethane)  ',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_refrigerant_aerosols' and list_value='PFC-116 (Perfluoroethane)  ');
INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'impactm_refrigerant_aerosols','PFC-218 (Perfluoropropane)  ',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_refrigerant_aerosols' and list_value='PFC-218 (Perfluoropropane)  ');
INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'impactm_refrigerant_aerosols','PFC-318 (Perfluorocyclobutane)',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_refrigerant_aerosols' and list_value='PFC-318 (Perfluorocyclobutane)');
INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'impactm_refrigerant_aerosols','PFC-3-1-10 (Perfluorobutane)  ',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_refrigerant_aerosols' and list_value='PFC-3-1-10 (Perfluorobutane)  ');
INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'impactm_refrigerant_aerosols','PFC-4-1-12 (Perfluoropentane)  ',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_refrigerant_aerosols' and list_value='PFC-4-1-12 (Perfluoropentane)  ');
INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'impactm_refrigerant_aerosols','PFC-5-1-14 (Perfluorohexane)  ',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_refrigerant_aerosols' and list_value='PFC-5-1-14 (Perfluorohexane)  ');
INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'impactm_refrigerant_aerosols','PFC-9-1-18 (Perfluorodecalin)  ',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_refrigerant_aerosols' and list_value='PFC-9-1-18 (Perfluorodecalin)  ');
INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'impactm_refrigerant_aerosols','R-401A',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_refrigerant_aerosols' and list_value='R-401A');
INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'impactm_refrigerant_aerosols','R-401B',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_refrigerant_aerosols' and list_value='R-401B');
INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'impactm_refrigerant_aerosols','R-401C',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_refrigerant_aerosols' and list_value='R-401C');
INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'impactm_refrigerant_aerosols','R-402A',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_refrigerant_aerosols' and list_value='R-402A');
INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'impactm_refrigerant_aerosols','R-402B',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_refrigerant_aerosols' and list_value='R-402B');
INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'impactm_refrigerant_aerosols','R-403A',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_refrigerant_aerosols' and list_value='R-403A');
INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'impactm_refrigerant_aerosols','R-403B',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_refrigerant_aerosols' and list_value='R-403B');
INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'impactm_refrigerant_aerosols','R-404A',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_refrigerant_aerosols' and list_value='R-404A');
INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'impactm_refrigerant_aerosols','R-407A',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_refrigerant_aerosols' and list_value='R-407A');
INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'impactm_refrigerant_aerosols','R-407B',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_refrigerant_aerosols' and list_value='R-407B');
INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'impactm_refrigerant_aerosols','R-407C',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_refrigerant_aerosols' and list_value='R-407C');
INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'impactm_refrigerant_aerosols','R-407D',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_refrigerant_aerosols' and list_value='R-407D');
INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'impactm_refrigerant_aerosols','R-407E',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_refrigerant_aerosols' and list_value='R-407E');
INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'impactm_refrigerant_aerosols','R-407F',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_refrigerant_aerosols' and list_value='R-407F');
INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'impactm_refrigerant_aerosols','R-408A',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_refrigerant_aerosols' and list_value='R-408A');
INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'impactm_refrigerant_aerosols','R-410A',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_refrigerant_aerosols' and list_value='R-410A');
INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'impactm_refrigerant_aerosols','R-410B',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_refrigerant_aerosols' and list_value='R-410B');
INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'impactm_refrigerant_aerosols','R-411A',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_refrigerant_aerosols' and list_value='R-411A');
INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'impactm_refrigerant_aerosols','R-411B',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_refrigerant_aerosols' and list_value='R-411B');
INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'impactm_refrigerant_aerosols','R-412A',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_refrigerant_aerosols' and list_value='R-412A');
INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'impactm_refrigerant_aerosols','R-415A',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_refrigerant_aerosols' and list_value='R-415A');
INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'impactm_refrigerant_aerosols','R-415B',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_refrigerant_aerosols' and list_value='R-415B');
INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'impactm_refrigerant_aerosols','R-416A',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_refrigerant_aerosols' and list_value='R-416A');
INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'impactm_refrigerant_aerosols','R-417A',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_refrigerant_aerosols' and list_value='R-417A');
INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'impactm_refrigerant_aerosols','R-417B',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_refrigerant_aerosols' and list_value='R-417B');
INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'impactm_refrigerant_aerosols','R-417C',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_refrigerant_aerosols' and list_value='R-417C');
INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'impactm_refrigerant_aerosols','R-418A',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_refrigerant_aerosols' and list_value='R-418A');
INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'impactm_refrigerant_aerosols','R-419A',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_refrigerant_aerosols' and list_value='R-419A');
INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'impactm_refrigerant_aerosols','R-419B',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_refrigerant_aerosols' and list_value='R-419B');
INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'impactm_refrigerant_aerosols','R-420A',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_refrigerant_aerosols' and list_value='R-420A');
INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'impactm_refrigerant_aerosols','R-421A',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_refrigerant_aerosols' and list_value='R-421A');
INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'impactm_refrigerant_aerosols','R-421B',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_refrigerant_aerosols' and list_value='R-421B');
INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'impactm_refrigerant_aerosols','R-422A',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_refrigerant_aerosols' and list_value='R-422A');
INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'impactm_refrigerant_aerosols','R-422B',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_refrigerant_aerosols' and list_value='R-422B');
INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'impactm_refrigerant_aerosols','R-422C',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_refrigerant_aerosols' and list_value='R-422C');
INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'impactm_refrigerant_aerosols','R-422D',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_refrigerant_aerosols' and list_value='R-422D');
INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'impactm_refrigerant_aerosols','R-422E',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_refrigerant_aerosols' and list_value='R-422E');
INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'impactm_refrigerant_aerosols','R-423A',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_refrigerant_aerosols' and list_value='R-423A');
INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'impactm_refrigerant_aerosols','R-424A',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_refrigerant_aerosols' and list_value='R-424A');
INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'impactm_refrigerant_aerosols','R-425A',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_refrigerant_aerosols' and list_value='R-425A');
INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'impactm_refrigerant_aerosols','R-426A',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_refrigerant_aerosols' and list_value='R-426A');
INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'impactm_refrigerant_aerosols','R-427A',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_refrigerant_aerosols' and list_value='R-427A');
INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'impactm_refrigerant_aerosols','R-428A',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_refrigerant_aerosols' and list_value='R-428A');
INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'impactm_refrigerant_aerosols','R-429A',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_refrigerant_aerosols' and list_value='R-429A');
INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'impactm_refrigerant_aerosols','R-430A',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_refrigerant_aerosols' and list_value='R-430A');
INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'impactm_refrigerant_aerosols','R-431A',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_refrigerant_aerosols' and list_value='R-431A');
INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'impactm_refrigerant_aerosols','R-434A',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_refrigerant_aerosols' and list_value='R-434A');
INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'impactm_refrigerant_aerosols','R-435A',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_refrigerant_aerosols' and list_value='R-435A');
INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'impactm_refrigerant_aerosols','R-437A',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_refrigerant_aerosols' and list_value='R-437A');
INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'impactm_refrigerant_aerosols','R-438A',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_refrigerant_aerosols' and list_value='R-438A');
INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'impactm_refrigerant_aerosols','R-439A',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_refrigerant_aerosols' and list_value='R-439A');
INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'impactm_refrigerant_aerosols','R-439A',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_refrigerant_aerosols' and list_value='R-439A');
INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'impactm_refrigerant_aerosols','R-439A',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_refrigerant_aerosols' and list_value='R-439A');
INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'impactm_refrigerant_aerosols','R-444A',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_refrigerant_aerosols' and list_value='R-444A');
INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'impactm_refrigerant_aerosols','R-445A',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_refrigerant_aerosols' and list_value='R-445A');
INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'impactm_refrigerant_aerosols','R-500',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_refrigerant_aerosols' and list_value='R-500');
INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'impactm_refrigerant_aerosols','R-503',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_refrigerant_aerosols' and list_value='R-503');
INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'impactm_refrigerant_aerosols','R-504',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_refrigerant_aerosols' and list_value='R-504');
INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'impactm_refrigerant_aerosols','R-507',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_refrigerant_aerosols' and list_value='R-507');
INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'impactm_refrigerant_aerosols','R-507A',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_refrigerant_aerosols' and list_value='R-507A');
INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'impactm_refrigerant_aerosols','R-509',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_refrigerant_aerosols' and list_value='R-509');
INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'impactm_refrigerant_aerosols','R-509A',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_refrigerant_aerosols' and list_value='R-509A');
INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'impactm_refrigerant_aerosols','R-512A',now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_refrigerant_aerosols' and list_value='R-512A');
update static.t_ref_list SET list_key='impactm_emission_factor_source' where list_key='impactperformance_efactor_source';
update static.t_ref_list SET list_key='impactm_emission_type' where list_key='impactperformance_emission_type';
update static.t_ref_list SET list_value='Scope1_stationary_fuel_combustion' where list_value='Fuel_combustion';
update static.t_ref_list SET list_value='Scope1_distance_travelled' where list_value='Distance_travelled';
update static.t_ref_list SET list_value='Scope2_grid_emission' where list_value='Grid_emission';
INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'impactm_emission_type','Scope1_mobile_fuel_combustion', now(),'nidhish'
    WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_emission_type' and list_value='Scope1_mobile_fuel_combustion');
INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'impactm_emission_type','Scope1_refrigerators_chillers', now(),'nidhish'
    WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_emission_type' and list_value='Scope1_refrigerators_chillers');
INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'impactm_emission_type','Scope1_fire_extinguishers', now(),'nidhish'
    WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_emission_type' and list_value='Scope1_fire_extinguishers');
update static.t_ref_list set list_key= 'impactm_measurement_unit' where list_key='impactperformance_measurement_unit';
update static.t_ref_list SET list_key='impactm_vehicle_type' where list_key='impactperformance_vehicle_type';
update static.t_ref_list SET list_key='impactm_vehicle_category' where list_key='impactperformance_vehicle_category';
update static.t_ref_list SET list_key='impactm_fueltype' where list_key='impactperformance_fueltype';
update static.t_ref_list SET list_key='impactm_facilitydata_unit' where list_key='ImpactPerformance_FacilityData_unit';
update static.t_ref_list SET list_key='impactm_stationary_fueltype' where list_key='impactm_fueltype' and list_value='Sub Bituminous';
update static.t_ref_list SET list_key='impactm_stationary_fueltype' where list_key='impactm_fueltype' and list_value='Other Bituminous';
update static.t_ref_list SET list_key='impactm_stationary_fueltype' where list_key='impactm_fueltype' and list_value='Coking Coal';
update static.t_ref_list SET list_key='impactm_stationary_fueltype' where list_key='impactm_fueltype' and list_value='Anthracite';
update static.t_ref_list SET list_key='impactm_stationary_fueltype' where list_key='impactm_fueltype' and list_value='Lignite';
update static.t_ref_list SET list_key='impactm_stationary_fueltype' where list_key='impactm_fueltype' and list_value='Naptha';
update static.t_ref_list SET list_key='impactm_stationary_fueltype' where list_key='impactm_fueltype' and list_value='SKO';
update static.t_ref_list SET list_key='impactm_stationary_fueltype' where list_key='impactm_fueltype' and list_value='Petcoke';
update static.t_ref_list SET list_key='impactm_stationary_fueltype' where list_key='impactm_fueltype' and list_value='Furnace Oil';
update static.t_ref_list SET list_key='impactm_mobile_fueltype' where list_key='impactm_fueltype' and list_value='CNG';
INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'impactm_stationary_fueltype','Gasoline', now(),'nidhish'
    WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_stationary_fueltype' and list_value='Gasoline');
INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'impactm_stationary_fueltype','Kerosene', now(),'nidhish'
    WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_stationary_fueltype' and list_value='Kerosene');
INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'impactm_stationary_fueltype','Heating oil', now(),'nidhish'
    WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_stationary_fueltype' and list_value='Heating oil');
INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'impactm_stationary_fueltype','Fuel oil', now(),'nidhish'
    WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='impactm_stationary_fueltype' and list_value='Fuel oil');
