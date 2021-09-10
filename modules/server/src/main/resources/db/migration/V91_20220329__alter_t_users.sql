DROP INDEX IF EXISTS unique_t_users CASCADE;
CREATE UNIQUE INDEX unique_t_users ON public.t_users (email);

DROP INDEX IF EXISTS unique_t_users_authentication CASCADE;
CREATE UNIQUE INDEX unique_t_users_authentication ON public.t_users_authentication (username);

DROP INDEX IF EXISTS unique_t_users_permission CASCADE;
CREATE UNIQUE INDEX unique_t_users_permission ON public.t_users_permission (username);