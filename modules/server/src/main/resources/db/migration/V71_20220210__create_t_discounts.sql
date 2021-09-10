create table if not exists public.t_discounts
(
    id serial not null primary key
    ,product_variant_id integer
    ,subscription_id integer
    ,customer_id integer
    ,is_discount_on_product boolean
    ,is_discount_on_subscription boolean
    ,is_discount_on_customer boolean
    ,is_discount_absolute boolean
    ,is_discount_percentage boolean
    ,is_discount_on_supplier_usage boolean
    ,is_discount_on_api_usage boolean
    ,is_discount_on_total boolean
    ,discount_on_product_absolute numeric(24,2)
    ,discount_on_product_percentage numeric(24,2)
    ,discount_on_subscription_absolute numeric(24,2)
    ,discount_on_subscription_percentage numeric(24,2)
    ,discount_on_supplier_usage_absolute numeric(24,2)
    ,discount_on_supplier_usage_percentage numeric(24,2)
    ,discount_on_api_usage_absolute numeric(24,2)
    ,discount_on_api_usage_percentage numeric(24,2)
    ,discount_on_total_absolute numeric(24,2)
    ,discount_on_total_percentage numeric(24,2)
    ,discount_start_date date
    ,discount_end_date date
    ,date_added timestamp
    ,added_by varchar(100)
    ,date_modified timestamp
    ,modified_by varchar(100)
    ,CONSTRAINT fk_t_product_discounts_product_variant_id FOREIGN KEY (product_variant_id) REFERENCES public.t_product_variant(product_variant_id)
    ,CONSTRAINT fk_t_product_discounts_product_subscription_id FOREIGN KEY (subscription_id) REFERENCES public.t_product_subscription(product_subscription_id)
    ,CONSTRAINT fk_t_product_discounts_product_customer_id FOREIGN KEY (customer_id) REFERENCES public.t_companies(company_id)
);

create table if not exists public.t_invoice
(
    id serial not null primary key
    ,subscription_id integer
    ,invoice_type_id integer
    ,invoice_status_id integer
    ,invoice_currency_id integer
    ,invoice_date date
    ,invoice_due_date date
    ,invoice_amount numeric(24,2)
    ,invoice_reference varchar(200)
    ,date_added timestamp
    ,added_by varchar(100)
    ,date_modified timestamp
    ,modified_by varchar(100)
    ,CONSTRAINT fk_t_invoice_subscription_id FOREIGN KEY (subscription_id) REFERENCES public.t_product_subscription (product_subscription_id)
    ,CONSTRAINT fk_t_invoice_invoice_type_id FOREIGN KEY (invoice_type_id) REFERENCES static.t_ref_list (list_id)
    ,CONSTRAINT fk_t_invoice_invoice_status_id FOREIGN KEY (invoice_status_id) REFERENCES static.t_ref_list (list_id)
    ,CONSTRAINT fk_t_invoice_invoice_currency_id FOREIGN KEY (invoice_currency_id) REFERENCES static.t_ref_base_currency (base_currency_id)
);
INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'Invoice_Type','Yearly Subscription',now(),'nidhish' WHERE NOT
EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='Invoice_Type' and
list_value='Yearly Subscription');
INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'Invoice_Type','Yearly supply chain usage',now(),'nidhish' WHERE NOT
EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='Invoice_Type' and
list_value='Yearly supply chain usage');
INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'Invoice_Type','Yearly platform API usage',now(),'nidhish' WHERE NOT
EXISTS (SELECT 1 FROM static.t_ref_list WHERE list_key='Invoice_Type' and
list_value='Yearly platform API usage');

INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'Invoice_Status','New',now(),'nidhish' WHERE NOT EXISTS (SELECT 1
FROM static.t_ref_list WHERE list_key='Invoice_Status' and
list_value='New');
INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'Invoice_Status','Paid',now(),'nidhish' WHERE NOT EXISTS (SELECT 1
FROM static.t_ref_list WHERE list_key='Invoice_Status' and
list_value='Paid');
INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'Invoice_Status','Cancelled',now(),'nidhish' WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_list WHERE list_key='Invoice_Status' and
list_value='Cancelled');

create table if not exists public.t_invoice_items
(
    id serial not null primary key
    ,invoice_id integer
    ,invoice_item_text varchar(500)
    ,invoice_item_currency_id integer
    ,invoice_item_amount numeric(24,2)
    ,invoice_item_type_id integer
    ,invoice_item_sequence integer
    ,discount_id integer
    ,date_added timestamp
    ,added_by varchar(100)
    ,date_modified timestamp
    ,modified_by varchar(100)
    ,CONSTRAINT fk_t_invoice_items_invoice_id FOREIGN KEY (invoice_id) REFERENCES public.t_invoice(id)
    ,CONSTRAINT fk_t_invoice_items_invoice_item_type_id FOREIGN KEY (invoice_item_type_id) REFERENCES static.t_ref_list(list_id)
    ,CONSTRAINT fk_t_invoice_items_currency_id FOREIGN KEY (invoice_item_currency_id) REFERENCES static.t_ref_base_currency(base_currency_id)
    ,CONSTRAINT fk_t_invoice_items_discount_id FOREIGN KEY (discount_id) REFERENCES public.t_discounts(id)
);
INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'invoice_item_type','Item',now(),'nidhish' WHERE NOT EXISTS (SELECT
1 FROM static.t_ref_list WHERE list_key='invoice_item_type' and
list_value='Item');

INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'invoice_item_type','discount',now(),'nidhish' WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_list WHERE list_key='invoice_item_type' and
list_value='discount');

INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'invoice_item_type','Subtotal',now(),'nidhish' WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_list WHERE list_key='invoice_item_type' and
list_value='Subtotal');

INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'invoice_item_type','Total',now(),'nidhish' WHERE NOT EXISTS (SELECT
1 FROM static.t_ref_list WHERE list_key='invoice_item_type' and
list_value='Total');


create table if not exists public.t_payments
(
    id serial not null primary key
    ,invoice_id integer
    ,payment_amount numeric(24,2)
    ,payment_currency_id integer
    ,payment_reference varchar(500)
    ,payment_method_id integer
    ,payment_info varchar(500)
    ,payment_status_id integer
    ,date_added timestamp
    ,added_by varchar(100)
    ,date_modified timestamp
    ,modified_by varchar(100)
    ,CONSTRAINT fk_t_payments_invoice_id FOREIGN KEY (invoice_id) REFERENCES public.t_invoice(id)
    ,CONSTRAINT fk_t_payments_payment_status_id FOREIGN KEY (payment_status_id) REFERENCES static.t_ref_list(list_id)
    ,CONSTRAINT fk_t_payments_payment_method_id FOREIGN KEY (payment_method_id) REFERENCES static.t_ref_list(list_id)
    ,CONSTRAINT fk_t_payments_payment_currency_id FOREIGN KEY (payment_currency_id) REFERENCES static.t_ref_base_currency(base_currency_id)
);

INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'Payment_Status','In progress',now(),'nidhish' WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_list WHERE list_key='Payment_Status' and
list_value='In progress');
INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'Payment_Status','Paid',now(),'nidhish' WHERE NOT EXISTS (SELECT 1
FROM static.t_ref_list WHERE list_key='Payment_Status' and
list_value='Paid');
INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'Payment_Status','Failed',now(),'nidhish' WHERE NOT EXISTS (SELECT 1
FROM static.t_ref_list WHERE list_key='Payment_Status' and
list_value='Failed');
INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'Payment_Status','Cancelled',now(),'nidhish' WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_list WHERE list_key='Payment_Status' and
list_value='Cancelled');
INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'Payment_Status','Reconciled',now(),'nidhish' WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_list WHERE list_key='Payment_Status' and
list_value='Reconciled');


INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'Payment_Method','Credit Card',now(),'nidhish' WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_list WHERE list_key='Payment_Method' and
list_value='Credit Card');
INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by)
SELECT 'Payment_Method','Wire Transfer',now(),'nidhish' WHERE NOT EXISTS
(SELECT 1 FROM static.t_ref_list WHERE list_key='Payment_Method' and
list_value='Wire Transfer');