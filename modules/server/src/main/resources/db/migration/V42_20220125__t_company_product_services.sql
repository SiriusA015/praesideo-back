
create table if not exists static.t_ref_product_services
(
    id serial not null primary key
    ,prod_serv_name 				varchar(2000) NOT NULL
    ,date_added						timestamp
    ,added_by						varchar(100)
    ,date_modified					timestamp
    ,modified_by					varchar(100)
    );

INSERT INTO static.t_ref_product_services (prod_serv_name,date_added,added_by)
SELECT 'Consulting', now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_product_services WHERE prod_serv_name='Consulting');
INSERT INTO static.t_ref_product_services (prod_serv_name,date_added,added_by)
SELECT 'Product shippping', now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_product_services WHERE prod_serv_name='Product shippping');
INSERT INTO static.t_ref_product_services (prod_serv_name,date_added,added_by)
SELECT 'Other', now(),'nidhish' WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_product_services WHERE prod_serv_name='Other');

create table if not exists public.t_company_product_services
(
    id serial not null primary key
    ,company_id 					integer
    ,ref_prod_serv_id 				integer
    ,is_quant_per_facility			boolean
    ,total_quantity					numeric(24,2)
    ,total_quantity_unit			varchar(100)
    ,date_added						timestamp
    ,added_by						varchar(100)
    ,date_modified					timestamp
    ,modified_by					varchar(100)
    ,CONSTRAINT fk_t_company_product_services_ref_prod_serv_id FOREIGN KEY (ref_prod_serv_id) REFERENCES static.t_ref_product_services (id)
    );

create table if not exists public.t_company_facilities_data
(
    id serial not null primary key
    ,comp_prod_serv_id 				integer
    ,facility_id					integer
    ,quantity						numeric(24,2)
    ,quantity_in_unit				varchar(100)
    ,quantity_in_percentage			numeric(24,2)
    ,date_added						timestamp
    ,added_by						varchar(100)
    ,date_modified					timestamp
    ,modified_by					varchar(100)
    ,CONSTRAINT fk_t_company_facilities_data_comp_prod_serv_id FOREIGN KEY (comp_prod_serv_id) REFERENCES public.t_company_product_services (id)
    ,CONSTRAINT fk_t_company_facilities_data_facility_id FOREIGN KEY (facility_id) REFERENCES public.t_company_facilities (facility_id)
    );










