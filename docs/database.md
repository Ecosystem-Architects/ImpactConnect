# Database Schema — ImpactConnect

## Tables

### profiles
Stores user profile info linked to Supabase Auth.

- id (uuid, references auth.users, pk)
- full_name (text)
- bio (text)
- avatar_url (text)
- location (text)
- skills (text[]) — tags for skill matching
- headline (text)
- created_at (timestamptz)
- updated_at (timestamptz)

### connections
Tracks connection requests between users.

- id (uuid, pk)
- requester_id (uuid, references profiles)
- addressee_id (uuid, references profiles)
- status (text) — pending / accepted / declined
- created_at (timestamptz)

### posts
Feed posts in communities or global feed.

- id (uuid, pk)
- author_id (uuid, references profiles)
- community_id (uuid, nullable, references groups)
- content (text)
- created_at (timestamptz)

### comments
Comments on posts.

- id (uuid, pk)
- post_id (uuid, references posts)
- author_id (uuid, references profiles)
- content (text)
- created_at (timestamptz)

### groups
Community groups.

- id (uuid, pk)
- name (text)
- description (text)
- owner_id (uuid, references profiles)
- created_at (timestamptz)

### group_members
Membership of users in groups.

- id (uuid, pk)
- group_id (uuid, references groups)
- user_id (uuid, references profiles)
- role (text) — member / admin
- joined_at (timestamptz)

### projects
Projects people can collaborate on.

- id (uuid, pk)
- title (text)
- description (text)
- owner_id (uuid, references profiles)
- status (text) — open / in_progress / completed
- created_at (timestamptz)

### project_members
People working on / applied to a project.

- id (uuid, pk)
- project_id (uuid, references projects)
- user_id (uuid, references profiles)
- status (text) — applied / member / lead
- joined_at (timestamptz)

### events
Events / meetups.

- id (uuid, pk)
- title (text)
- description (text)
- organizer_id (uuid, references profiles)
- starts_at (timestamptz)
- ends_at (timestamptz)
- location (text)
- created_at (timestamptz)

### mentorships
Mentorship pairings.

- id (uuid, pk)
- mentor_id (uuid, references profiles)
- mentee_id (uuid, references profiles)
- status (text) — requested / active / completed
- created_at (timestamptz)

### food_listings
Food redistribution listings (stretch/MVP-light).

- id (uuid, pk)
- org_id (uuid, references profiles or org table)
- description (text)
- quantity (text)
- pickup_location (text)
- available_from (timestamptz)
- available_until (timestamptz)
- status (text) — available / claimed / expired
- created_at (timestamptz)

### impact_metrics
Aggregated impact metrics (skeleton).

- id (uuid, pk)
- user_id (uuid, references profiles, nullable)
- metric_type (text)
- metric_value (numeric)
- recorded_at (timestamptz)

## Relationships (ERD, text)

- profiles 1→many connections (as requester or addressee)
- profiles 1→many posts
- profiles 1→many groups (as owner)
- profiles 1→many projects (as owner)
- profiles 1→many groups via group_members
- profiles 1→many projects via project_members
- profiles 1→many events (as organizer)
- profiles 1→many mentorships (as mentor or mentee)
- profiles 1→many food_listings (as org)
- posts 1→many comments
- groups 1→many group_members
- projects 1→many project_members

## RLS rules (principles)

- **profiles:** users can read public profiles; each user can update their own profile row only
- **connections:** participants can read/write their own connection rows; others cannot
- **posts:** author can edit/delete own posts; readers can read based on visibility; group posts scoped to group members where relevant
- **comments:** author can edit/delete own comments; readers can read where post is visible
- **groups:** owner/admins manage group; members read group; RLS enforces membership for private groups
- **projects:** owner can edit project; project_members manage membership per role; applicants can submit applications
- **messages/chat:** visible only to conversation participants (channel scoped by conversation id)
- **food_listings:** visible to verified NGOs/volunteers; only the listing org can update status
- **impact_metrics:** users can insert their own metrics; aggregations are read-only views or dashboard queries

## Migrations

All schema changes live in `supabase/migrations/` as SQL files. Each migration should be idempotent where possible and include comments. Seed data lives in `supabase/seed.sql`.

## Skill matching (MVP)

For MVP, skill matching is SQL/tags-based: overlap between `profiles.skills` arrays and project/volunteer needs. The ML service starts as a thin wrapper around these heuristics.
