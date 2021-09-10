INSERT INTO static.t_ref_list (list_key,list_value,date_added,added_by,date_modified,modified_by)
select
    'praesideo_demo_company_id'
     ,tc.company_id
     ,now()
     ,'nidhish'
     ,now()
     ,'nidhish'
from
    public.t_companies tc
where company_name like '%demo%';
