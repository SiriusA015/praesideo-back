
alter table public.t_companies ADD COLUMN IF NOT EXISTS status_date TIMESTAMP;
update public.t_companies set status_date=current_date;