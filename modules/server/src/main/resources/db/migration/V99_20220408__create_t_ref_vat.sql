create table if not exists static.t_ref_vat
(
    id serial not null primary key
    ,country_id 				integer
    ,vat_in_percentage			numeric(24,2)
    ,date_added					timestamp
    ,added_by					varchar(100)
    ,date_modified				timestamp
    ,modified_by				varchar(100)
    ,CONSTRAINT fk_t_ref_vat_country_id FOREIGN KEY (country_id) REFERENCES static.t_ref_countries (id)
    );

insert into static.t_ref_vat (country_id,vat_in_percentage,date_added,added_by)
select
    (select id from static.t_ref_countries where country= 'Switzerland' )
     ,7.7
     ,now()
     ,'nidhish'
    where not exists
(select 1 from  static.t_ref_vat where
country_id=(select id from static.t_ref_countries where country= 'Switzerland' )
);

insert into static.t_ref_list (list_key,list_value,date_added,added_by)
select
    'invoice_item_type'
     ,'VAT'
     ,now()
     ,'nidhish'
    where not exists
(select 1 from static.t_ref_list where list_key='invoice_item_type' and list_value='VAT');