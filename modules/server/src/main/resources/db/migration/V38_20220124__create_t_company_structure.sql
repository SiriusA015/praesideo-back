
alter table public.t_companies ADD COLUMN IF NOT EXISTS is_parentcompany boolean;
alter table public.t_companies ADD COLUMN IF NOT EXISTS is_subsidiary boolean;
alter table public.t_companies ADD COLUMN IF NOT EXISTS is_jointventure boolean;
alter table public.t_companies ADD COLUMN IF NOT EXISTS is_standalone boolean;

create table if not exists static.t_ref_company_category
(
    id serial not null primary key
    ,category		varchar(100)
    ,date_added		timestamp
    ,added_by		varchar(100)
    ,date_modified	timestamp
    ,modified_by	varchar(100)
    );
INSERT INTO static.t_ref_company_category(category,date_added,added_by)
SELECT 'Parent Company',now(),'nidhish'
    WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_company_category WHERE category='Parent Company');

INSERT INTO static.t_ref_company_category(category,date_added,added_by)
SELECT 'Subsidiary',now(),'nidhish'
    WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_company_category WHERE category='Subsidiary');

INSERT INTO static.t_ref_company_category(category,date_added,added_by)
SELECT 'Joint Venture',now(),'nidhish'
    WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_company_category WHERE category='Joint Venture');

INSERT INTO static.t_ref_company_category(category,date_added,added_by)
SELECT 'Government',now(),'nidhish'
    WHERE NOT EXISTS (SELECT 1 FROM static.t_ref_company_category WHERE category='Government');

create table if not exists public.t_company_structure
(
    id serial not null primary key
    ,company_id 				integer
    ,rel_company_id 			integer
    ,rel_company_category_id	integer
    ,economic_interest_percentage	numeric(24,2)
    ,is_operating_policies_control	boolean
    ,is_financial_accounting		boolean
    ,date_added						timestamp
    ,added_by						varchar(100)
    ,date_modified					timestamp
    ,modified_by					varchar(100)
    ,CONSTRAINT fk_t_company_structure_company_id FOREIGN KEY (company_id) REFERENCES public.t_companies (company_id)
    ,CONSTRAINT fk_t_company_structure_rel_company_id FOREIGN KEY (rel_company_id) REFERENCES public.t_companies (company_id)
    ,CONSTRAINT fk_t_company_structure_rel_company_category_id  FOREIGN KEY (rel_company_category_id) REFERENCES static.t_ref_company_category (id)
    );
