# Architecture — ImpactConnect

## Overview

ImpactConnect has three main parts:

1. **Frontend** — React + Vite + Tailwind + shadcn/ui, hosted on Vercel
2. **Supabase** — Postgres database, Auth, Realtime, Storage, and Edge Functions
3. **ML service** — optional Python FastAPI service for skill matching, demand forecasting, and recommendations

## Data flow

```
User (browser)
  │
  ▼
Frontend (React)
  ├── Supabase client (auth, DB, realtime, storage)
  └── fetch() to ML service when needed
        │
        ▼
   Supabase (Postgres + Auth + Realtime)
        │
        ▼
   ML service (FastAPI) — optional, heuristics-first
```

The frontend talks to Supabase directly for most features. Heavy or batch computation (matching, forecasting) can go through the ML service.

## Responsibilities

- **Frontend:** UI, state, forms, realtime listeners, optimistic updates
- **Supabase:** auth, authorization via RLS, persistence, realtime channels, storage for avatars/uploads
- **ML service:** matching, forecasting, recommendations — started as heuristics, improved later

## Auth model

- Supabase Auth handles signup/login
- Profiles row is created/updated per user
- RLS enforces that users can only modify their own profile
- Optional GitHub OAuth added later

## Real-time

- Realtime used for chat, presence, and notifications
- Channels scoped to participants (e.g., conversation ID) for privacy

## Storage

- User avatars and uploaded files stored in Supabase Storage
- Buckets scoped with policies so users manage their own files

## Environments

- `main` → production-ish preview
- Feature branches → PR previews
- Local development uses `.env` filled from `.env.example`

## Where to start

New contributors should start with the frontend UI and Supabase schema. The ML service is intentionally small at first.
