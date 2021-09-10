create table if not exists public.t_users_permission
(
    permission_id serial not null
    constraint permissions_pkey
    primary key,
    permission varchar(50),
    username varchar(50),
    company_id integer
);