
alter table static.t_ref_supplier_type
    add column if not exists  date_modified date,
    add column if not exists modified_by varchar(100);

alter table static.t_ref_supplier_category
    add column if not exists  date_modified date,
    add column if not exists modified_by varchar(100);
