DROP VIEW if exists public.v_product_variant;
create or replace view public.v_product_variant
as
select
    t1.product_variant_id
     ,t1.product_id
     ,t1.product_variant_name
     ,t1.product_variant_description
     ,t1.product_subscription_currency_id
     ,t1.product_subscription_annual_cost
     ,t1.product_subscription_tier_cost_per_supplier
     ,t1.date_added
     ,t1.added_by
     ,t1.date_modified
     ,t1.modified_by
     ,t1.max_num_supplier_allowed
     ,t2.product_name
     ,t3.code as product_subscription_currency
from
    public.t_product_variant t1
        inner join public.t_product t2 on t2.product_id = t1.product_id
        inner join static.t_ref_base_currency t3 on t3.base_currency_id = t1.product_subscription_currency_id;


DROP VIEW if exists public.v_discounts;
CREATE OR REPLACE VIEW public.v_discounts
as
select
    t2.product_variant_name
     ,t3.company_name
     ,t1.id
     ,t1.product_variant_id
     ,t1.subscription_id
     ,t1.customer_id
     ,t1.is_discount_on_product
     ,t1.is_discount_on_subscription
     ,t1.is_discount_on_customer
     ,t1.is_discount_absolute
     ,t1.is_discount_percentage
     ,t1.is_discount_on_supplier_usage
     ,t1.is_discount_on_api_usage
     ,t1.is_discount_on_total
     ,t1.discount_on_product_absolute
     ,t1.discount_on_product_percentage
     ,t1.discount_on_subscription_absolute
     ,t1.discount_on_subscription_percentage
     ,t1.discount_on_supplier_usage_absolute
     ,t1.discount_on_supplier_usage_percentage
     ,t1.discount_on_api_usage_absolute
     ,t1.discount_on_api_usage_percentage
     ,t1.discount_on_total_absolute
     ,t1.discount_on_total_percentage
     ,t1.discount_on_customer_absolute
     ,t1.discount_on_customer_percentage
     ,t1.discount_start_date
     ,t1.discount_end_date
     ,t1.date_added
     ,t1.added_by
     ,t1.date_modified
     ,t1.modified_by
from
    public.t_discounts t1
        inner join public.t_product_variant t2 on t2.product_variant_id=t1.product_variant_id
        left outer join public.t_companies t3 on t3.company_id = t1.customer_id;

update public.t_product_variant a set product_subscription_annual_cost = 700,date_modified=now()
    from public.v_product_variant b WHERe b.product_variant_id = a.product_variant_id AND b.product_variant_name='IMPACT MEASUREMENT';

update public.t_discounts a set discount_on_product_absolute = 200,date_modified=now()
    from public.v_discounts b WHERe b.id = a.id AND b.product_variant_name='IMPACT MEASUREMENT';

delete from public.t_invoice_items;
delete from public.t_invoice;