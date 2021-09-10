
alter table if exists public.t_discounts
    add column if not exists discount_on_customer_absolute numeric(24,2);
alter table if exists public.t_discounts
    add column if not exists discount_on_customer_percentage numeric(24,2);
