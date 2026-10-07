-- seed.sql
-- Demo data for local development and contributor onboarding
-- Only run in a non-production environment.

do $$
begin
  if not exists (select 1 from public.profiles limit 1) then

    insert into public.profiles (id, full_name, bio, avatar_url, location, skills, headline)
    values
      ('00000000-0000-0000-0000-000000000001'::uuid, 'Aisha Khan', 'Community organizer focused on food redistribution.', 'https://example.com/avatars/aisha.png', 'Lahore', array['community organizing','food security','volunteer coordination'], 'Building local food networks'),
      ('00000000-0000-0000-0000-000000000002'::uuid, 'Marcus Ng', 'Full-stack developer interested in social impact tech.', 'https://example.com/avatars/marcus.png', 'Singapore', array['react','typescript','supabase','python'], 'Building tools for changemakers'),
      ('00000000-0000-0000-0000-000000000003'::uuid, 'Priya Sharma', 'NGO program lead exploring digital tools.', 'https://example.com/avatars/priya.png', 'Delhi', array['program management','grant writing','community outreach'], 'Scaling NGO collaboration')
    ;

    insert into public.projects (id, title, description, owner_id, status)
    values
      ('10000000-0000-0000-0000-000000000001'::uuid, 'Neighborhood Food Share', 'Pilot food redistribution across 3 neighborhoods.', '00000000-0000-0000-0000-000000000001'::uuid, 'open'),
      ('10000000-0000-0000-0000-000000000002'::uuid, 'ImpactConnect MVP', 'Build and launch the platform for SWOC.', '00000000-0000-0000-0000-000000000002'::uuid, 'in_progress')
    ;

    insert into public.project_members (project_id, user_id, status)
    values
      ('10000000-0000-0000-0000-000000000002'::uuid, '00000000-0000-0000-0000-000000000002'::uuid, 'lead'),
      ('10000000-0000-0000-0000-000000000002'::uuid, '00000000-0000-0000-0000-000000000003'::uuid, 'member')
    ;

  end if;
end $$;
