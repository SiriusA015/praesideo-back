
create table if not exists public.t_company_facilities
(
    facility_id serial not null primary key
    ,company_id 					integer
    ,facility_name 					varchar(2000)
    ,facility_city					varchar(100)
    ,facility_country 				varchar(500)
    ,facility_address				varchar(500)
    ,facility_owner_company_id		integer
    ,facility_operation_company_id	integer
    ,date_added						timestamp
    ,added_by						varchar(100)
    ,date_modified					timestamp
    ,modified_by					varchar(100)
    ,CONSTRAINT fk_t_company_facilities_company_id FOREIGN KEY (company_id) REFERENCES public.t_companies (company_id)
    ,CONSTRAINT fk_t_company_facilities_owner_company_id FOREIGN KEY (facility_owner_company_id) REFERENCES public.t_companies (company_id)
    ,CONSTRAINT fk_t_company_facilities_operation_company_id FOREIGN KEY (facility_operation_company_id) REFERENCES public.t_companies (company_id)
    );
