alter table impact.t_data_emissions_reduction
    add column if not exists company_id integer
    constraint fk_t_companies
    references public.t_companies;

update impact.t_data_emissions_reduction tdemr set company_id = (
    select t_users.company_id
    from public.t_users
             join impact.t_data_versions tdv on t_users.user_id = tdv.user_id
    where tdemr.user_data_set_id = tdv.user_data_set_id
);

alter table impact.t_data_emissions_reduction drop column if exists user_data_set_id;


alter table impact.t_data_ghg_inventory_method
    add column if not exists company_id integer
    constraint fk_t_companies
    references public.t_companies;

update impact.t_data_ghg_inventory_method tdgim set company_id = (
    select t_users.company_id
    from public.t_users
             join impact.t_data_versions tdv on t_users.user_id = tdv.user_id
    where tdgim.user_data_set_id = tdv.user_data_set_id
);

alter table impact.t_data_ghg_inventory_method drop column if exists user_data_set_id;


alter table impact.t_data_files
    add column if not exists company_id integer
    constraint fk_t_companies
    references public.t_companies;

update impact.t_data_files tdf set company_id = (
    select t_users.company_id
    from public.t_users
             join impact.t_data_versions tdv on t_users.user_id = tdv.user_id
    where tdf.user_data_set_id = tdv.user_data_set_id
);

alter table impact.t_data_files drop column if exists user_data_set_id;


alter table impact.t_data_recent_year_emissions
    add column if not exists company_id integer
    constraint fk_t_companies
    references public.t_companies;

update impact.t_data_recent_year_emissions tdrye set company_id = (
    select t_users.company_id
    from public.t_users
             join impact.t_data_versions tdv on t_users.user_id = tdv.user_id
    where tdrye.user_data_set_id = tdv.user_data_set_id
);

alter table impact.t_data_recent_year_emissions drop column if exists user_data_set_id;


alter table impact.t_data_versions
    add column if not exists company_id integer
    constraint fk_t_companies
    references public.t_companies;

UPDATE impact.t_data_versions tdv1
SET company_id = tu.company_id
    FROM public.t_users tu
WHERE tdv1.user_id = tu.user_id;


