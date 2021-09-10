ALTER TABLE IF EXISTS public.t_users
    ADD COLUMN IF NOT EXISTS restore_key varchar(300);
