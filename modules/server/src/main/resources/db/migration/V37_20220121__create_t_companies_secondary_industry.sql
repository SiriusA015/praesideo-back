create table if not exists public.t_companies_secondary_industry
(
    id serial not null primary key
    ,company_id 				integer
    ,industry_sector_id 		integer
    ,industry_subsector_id 		integer
    ,city						varchar(100)
    ,country 					varchar(500)
    ,date_added					timestamp
    ,added_by					varchar(100)
    ,date_modified				timestamp
    ,modified_by				varchar(100)
    ,CONSTRAINT fk_t_companies_secondary_industry_company_id FOREIGN KEY (company_id) REFERENCES public.t_companies (company_id)
    ,CONSTRAINT fk_t_companies_secondary_industry_sector_id FOREIGN KEY (industry_sector_id) REFERENCES static.t_ref_industry_sector (industry_sector_id)
    ,CONSTRAINT fk_t_companies_secondary_iindustry_subsector_id FOREIGN KEY (industry_subsector_id) REFERENCES static.t_ref_industry_subsector (industry_subsector_id)
    );