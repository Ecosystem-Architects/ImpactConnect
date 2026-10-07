-- 003_projects.sql
-- Projects and project membership

create table if not exists public.projects (
  id uuid primary key default gen_random_uuid(),
  title text not null,
  description text,
  owner_id uuid references public.profiles on delete cascade not null,
  status text not null default 'open', -- open, in_progress, completed
  created_at timestamptz default now() not null
);

create table if not exists public.project_members (
  id uuid primary key default gen_random_uuid(),
  project_id uuid references public.projects on delete cascade not null,
  user_id uuid references public.profiles on delete cascade not null,
  status text not null default 'applied', -- applied, member, lead
  joined_at timestamptz default now() not null
);

alter table public.projects enable row level security;
alter table public.project_members enable row level security;

create policy "Projects are readable by authenticated users"
  on public.projects for select
  using ( auth.role() = 'authenticated' );

create policy "Project owners can update their projects"
  on public.projects for update
  using ( auth.uid() = owner_id );

create policy "Owners can delete their projects"
  on public.projects for delete
  using ( auth.uid() = owner_id );

create policy "Users can view project membership"
  on public.project_members for select
  using ( true );

create policy "Users can apply to projects"
  on public.project_members for insert
  with check ( auth.uid() = user_id );

create policy "Project members can update their own membership row"
  on public.project_members for update
  using ( auth.uid() = user_id );
