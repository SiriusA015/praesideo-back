
create table if not exists static.t_ref_supplier_category
(
    supplier_category_id serial not null
        constraint supplier_category_pkey primary key,
    supplier_category varchar(500),
    date_added TIMESTAMP,
    added_by varchar(100),
    date_removed TIMESTAMP,
    removed_by varchar(100)
);

create table if not exists static.t_ref_supplier_type
(
    supplier_type_id serial not null
        constraint supplier_type_pkey primary key,
    supplier_type varchar(500),
    date_added TIMESTAMP,
    added_by varchar(100),
    date_removed TIMESTAMP,
    removed_by varchar(100)
);

create table if not exists static.t_ref_supplier_invitation_status
(
    supplier_invitation_status_id serial not null
        constraint supplier_invitation_status_pkey primary key,
    supplier_invitation_status varchar(500),
    date_added TIMESTAMP,
    added_by varchar(100),
    date_removed TIMESTAMP,
    removed_by varchar(100)
);

create table if not exists trace.t_supply_chain
(
    supply_chain_id serial not null
        constraint supply_chain_pkey primary key,
    customer_id integer
        constraint fk_t_supply_chain_customer_t_companies
        references public.t_companies,
    supplier_id integer
        constraint fk_t_supply_chain_supplier_t_companies
        references public.t_companies,
    supplier_invitation_status_id integer
        constraint fk_t_supply_chain_t_ref_supplier_invitation_status
        references static.t_ref_supplier_invitation_status,
    supplier_invitation_date TIMESTAMP,
    supplier_contact_email varchar(500),
    date_added TIMESTAMP,
    added_by varchar(100),
    date_removed TIMESTAMP,
    removed_by varchar(100)
);

create table if not exists trace.t_supplier_allocation
(
    supplier_allocation_id serial not null
        constraint supplier_allocation_pkey primary key,
    supply_chain_id integer not null
        constraint fk_t_supplier_allocation_t_supply_chain
        references trace.t_supply_chain,
    supplier_category_id integer,
    supplier_type_id integer,
    supplier_currency_id integer,
    supplier_amount NUMERIC(24, 2),
    date_added TIMESTAMP,
    added_by varchar(100),
    date_removed TIMESTAMP,
    removed_by varchar(100)
);
