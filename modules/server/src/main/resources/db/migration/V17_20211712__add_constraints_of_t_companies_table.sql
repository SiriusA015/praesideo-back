alter table impact.t_data_climate_mechanisms_influence
                                              add column if not exists company_id integer
                                                  constraint fk_t_companies
                                                      references public.t_companies;

update impact.t_data_climate_mechanisms_influence tdcmi set company_id = (
    select company_id
    from public.t_users
             join impact.t_data_versions tdv on t_users.user_id = tdv.user_id
    where tdcmi.user_data_set_id = tdv.user_data_set_id

);

alter table impact.t_data_climate_mechanisms_influence drop column if exists user_data_set_id;