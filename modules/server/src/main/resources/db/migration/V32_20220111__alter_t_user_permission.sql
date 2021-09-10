ALTER TABLE IF EXISTS public.t_permission_service DROP CONSTRAINT fk_t_permission_service;
TRUNCATE TABLE public.t_users_permission;
ALTER TABLE IF EXISTS public.t_permission_service ADD constraint fk_t_permission_service
    FOREIGN KEY (permission_id)
    REFERENCES  public.t_users_permission;

ALTER TABLE IF EXISTS public.t_users_permission
    RENAME COLUMN permission TO impact_permission;
ALTER TABLE IF EXISTS public.t_users_permission
    ADD COLUMN IF NOT EXISTS trace_permission varchar(50);
ALTER TABLE IF EXISTS public.t_users_permission
    ADD COLUMN IF NOT EXISTS role varchar(50);
