update public.t_users set email=lower(email), username=lower(username);
update public.t_users_authentication set username=lower(username);
update public.t_users_permission set username=lower (username);