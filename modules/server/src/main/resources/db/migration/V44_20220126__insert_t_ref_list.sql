INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'ImpactPerformance_FacilityData_unit', 'Hours', now(),'nidhish'
    WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='ImpactPerformance_FacilityData_unit' and list_value='Hours');

INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'ImpactPerformance_FacilityData_unit', 'Days', now(),'nidhish'
    WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='ImpactPerformance_FacilityData_unit' and list_value='Days');

INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'ImpactPerformance_FacilityData_unit', 'Number', now(),'nidhish'
    WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='ImpactPerformance_FacilityData_unit' and list_value='Number');

INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'ImpactPerformance_FacilityData_unit', 'Multiple', now(),'nidhish'
    WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='ImpactPerformance_FacilityData_unit' and list_value='Multiple');


alter table public.t_company_product_services ADD COLUMN IF NOT EXISTS total_quantity_unit_id Integer;
ALTER TABLE public.t_company_product_services DROP CONSTRAINT IF EXISTS fk_t_company_product_services_total_quantity_unit_id;
alter table public.t_company_product_services add CONSTRAINT fk_t_company_product_services_total_quantity_unit_id
    FOREIGN KEY (total_quantity_unit_id) REFERENCES static.t_ref_list(list_id);
ALTER TABLE public.t_company_product_services DROP IF EXISTS total_quantity_unit;


alter table public.t_company_facilities_data ADD COLUMN IF NOT EXISTS quantity_unit_id Integer;
ALTER TABLE public.t_company_facilities_data DROP CONSTRAINT IF EXISTS fk_t_company_facilities_data_quantity_unit_id;
alter table public.t_company_facilities_data add CONSTRAINT fk_t_company_facilities_data_quantity_unit_id
    FOREIGN KEY (quantity_unit_id) REFERENCES static.t_ref_list(list_id);
ALTER TABLE public.t_company_facilities_data DROP IF EXISTS quantity_in_unit;


