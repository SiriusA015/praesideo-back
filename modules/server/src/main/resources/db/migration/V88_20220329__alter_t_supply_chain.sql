alter table trace.t_supply_chain
    add column if not exists  date_modified date,
    add column if not exists modified_by varchar(100);

alter table trace.t_supplier_allocation
    add column if not exists  date_modified date,
    add column if not exists modified_by varchar(100);

alter table static.t_ref_supplier_invitation_status
    add column if not exists  date_modified date,
    add column if not exists modified_by varchar(100);
