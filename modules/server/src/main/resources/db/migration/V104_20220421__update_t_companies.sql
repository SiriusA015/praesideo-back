update public.t_companies set status_id=1, status_date=now() where status_id=null;
alter table public.t_companies alter column status_id set default 1;