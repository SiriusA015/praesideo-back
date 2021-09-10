
create table if not exists public.t_product
(
    product_id serial not null
        constraint product_pkey primary key,
    product_name VARCHAR(100),
    product_description VARCHAR(500),
    product_active bit default(B'0'),
    date_added TIMESTAMP,
    added_by VARCHAR(500),
    date_modified TIMESTAMP,
    modified_by VARCHAR(500)
);

create table if not exists public.t_product_variant
(
    product_variant_id serial not null
        constraint product_variant_pkey primary key,
    product_id integer
        constraint fk_t_product_variant_t_product
        references public.t_product,
    product_variant_name varchar(100),
    product_variant_description varchar(500),
    product_subscription_currency_id integer
        constraint fk_t_product_variant_t_ref_base_currency
        references static.t_ref_base_currency,
    product_subscription_annual_cost numeric(24,2),
    product_subscription_tier_cost_per_supplier numeric(24,2),
    date_added TIMESTAMP,
    added_by VARCHAR(500),
    date_modified TIMESTAMP,
    modified_by VARCHAR(500)
);

create table if not exists public.t_product_subscription
(
    product_subscription_id serial not null
        constraint product_subscription_pkey primary key,
    product_variant_id integer
        constraint fk_t_product_subscription_t_product_variant
        references public.t_product_variant,
    company_id integer
        constraint fk_t_product_subscription_t_companies
        references public.t_companies,
    start_date DATE,
    end_date DATE,
    date_added TIMESTAMP,
    added_by VARCHAR(500),
    date_modified TIMESTAMP,
    modified_by VARCHAR(500)
);
