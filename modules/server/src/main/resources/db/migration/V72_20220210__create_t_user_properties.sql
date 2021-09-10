create table if not exists public.t_user_properties
(
    id serial not null
    constraint user_properties_pkey
    primary key,
    p_key varchar(100),
    p_value varchar(100)
);

insert into public.t_user_properties(id, p_key, p_value)
select 1, 'FREE_PERIOD_SUBSCRIPTION_DAYS', '30' where not exists (select 1 from public.t_user_properties where p_key = 'FREE_PERIOD_SUBSCRIPTION_DAYS');


