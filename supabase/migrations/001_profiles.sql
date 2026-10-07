-- 001_profiles.sql
-- Profiles table linked to Supabase Auth

create table if not exists public.profiles (
  id uuid references auth.users on delete cascade primary key,
  full_name text,
  bio text,
  avatar_url text,
  location text,
  skills text[],
  headline text,
  created_at timestamptz default now() not null,
  updated_at timestamptz default now() not null
);

alter table public.profiles enable row level security;

create policy "Users can view public profiles"
  on public.profiles for select
  using ( true );

create policy "Users can update own profile"
  on public.profiles for update
  using ( auth.uid() = id );

create policy "Users can insert own profile"
  on public.profiles for insert
  with check ( auth.uid() = id );
