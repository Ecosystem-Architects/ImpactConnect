-- 002_connections.sql
-- Connection requests between users

create table if not exists public.connections (
  id uuid primary key default gen_random_uuid(),
  requester_id uuid references public.profiles on delete cascade not null,
  addressee_id uuid references public.profiles on delete cascade not null,
  status text not null default 'pending', -- pending, accepted, declined
  created_at timestamptz default now() not null
);

alter table public.connections enable row level security;

create policy "Participants can view their connections"
  on public.connections for select
  using (
    auth.uid() = requester_id or auth.uid() = addressee_id
  );

create policy "Users can create connection requests"
  on public.connections for insert
  with check (
    auth.uid() = requester_id
  );

create policy "Participants can update their connection rows"
  on public.connections for update
  using (
    auth.uid() = requester_id or auth.uid() = addressee_id
  );
