insert into public.t_user_properties (id,p_key,p_value,date_added,added_by)
select
    2
     ,'IS_CONTENT_BLOCKING_ENABLED'
     ,'Yes'
     ,now()
     ,'nidhish'
    where not exists
(select 1 from  public.t_user_properties where p_key='IS_CONTENT_BLOCKING_ENABLED');

insert into tech.t_app_data_text (id,textkey,textvalue,culture,date_added,added_by)
select
    (select max(id)+1 from tech.t_app_data_text)
     ,'blockEmissionsTabMessage_account_owner'
     ,'You have an outstanding invoice, please pay the invoice to access the emissions tab. Go to Account settings / Billing & payments.'
     ,'en-us'
     ,now()
     ,'nidhish'
    where not exists (select 1 from tech.t_app_data_text where textkey='blockEmissionsTabMessage_account_owner');

insert into tech.t_app_data_text (id,textkey,textvalue,culture,date_added,added_by)
select
    (select max(id)+1 from tech.t_app_data_text)
     ,'blockImpactPerformanceMessage_account_owner'
     ,'You have an outstanding invoice, please pay the invoice to access the performance tab. Go to Account settings / Billing & payments.'
     ,'en-us'
     ,now()
     ,'nidhish'
    where not exists (select 1 from tech.t_app_data_text where textkey='blockImpactPerformanceMessage_account_owner');

insert into tech.t_app_data_text (id,textkey,textvalue,culture,date_added,added_by)
select
    (select max(id)+1 from tech.t_app_data_text)
     ,'blockTracePerformanceMessage_account_owner'
     ,'You have an outstanding invoice, please pay the invoice to access the performance tab. Go to Account settings / Billing & payments.'
     ,'en-us'
     ,now()
     ,'nidhish'
    where not exists (select 1 from tech.t_app_data_text where textkey='blockTracePerformanceMessage_account_owner');


insert into tech.t_app_data_text (id,textkey,textvalue,culture,date_added,added_by)
select
    (select max(id)+1 from tech.t_app_data_text)
     ,'blockEmissionsTabMessage_member'
     ,'You have an outstanding invoice, please approach your company account owner to pay the invoice. Once the invoice is paid, emissions tab will be avialable.'
     ,'en-us'
     ,now()
     ,'nidhish'
    where not exists (select 1 from tech.t_app_data_text where textkey='blockEmissionsTabMessage_member');

insert into tech.t_app_data_text (id,textkey,textvalue,culture,date_added,added_by)
select
    (select max(id)+1 from tech.t_app_data_text)
     ,'blockImpactPerformanceMessage_member'
     ,'You have an outstanding invoice, please approach your company account owner to pay the invoice. Once the invoice is paid, performance tab will be avialable.'
     ,'en-us'
     ,now()
     ,'nidhish'
    where not exists (select 1 from tech.t_app_data_text where textkey='blockImpactPerformanceMessage_member');

insert into tech.t_app_data_text (id,textkey,textvalue,culture,date_added,added_by)
select
    (select max(id)+1 from tech.t_app_data_text)
     ,'blockTracePerformanceMessage_member'
     ,'You have an outstanding invoice, please approach your company account owner to pay the invoice. Once the invoice is paid, performance tab will be avialable.'
     ,'en-us'
     ,now()
     ,'nidhish'
    where not exists (select 1 from tech.t_app_data_text where textkey='blockTracePerformanceMessage_member');