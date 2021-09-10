
update public.t_product_variant a set product_subscription_annual_cost = 750,date_modified=now()
    from public.v_product_variant b WHERe b.product_variant_id = a.product_variant_id AND b.product_variant_name='IMPACT MEASUREMENT';

update public.t_discounts a set discount_on_product_absolute = 250,date_modified=now()
    from public.v_discounts b WHERe b.id = a.id AND b.product_variant_name='IMPACT MEASUREMENT';

delete from public.t_invoice_items;
delete from public.t_invoice;