insert into public.t_user_properties (id,p_key,p_value,date_added,added_by)
select
    3
     ,'SCHEDULED_ANALYTICS_RUN_ENABLED'
     ,'no'
     ,now()
     ,'nidhish'
    where not exists
(select 1 from  public.t_user_properties where p_key='SCHEDULED_ANALYTICS_RUN_ENABLED');