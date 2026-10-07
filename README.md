# ImpactConnect

> Open-source professional networking, community collaboration, and social impact platform for young changemakers.

**License:** MIT  
**Project Admin:** Shanaya Mahendran
**Repo:** `https://github.com/Ecosystem-Architects/ImpactConnect`  

---

## What it is

ImpactConnect gives young professionals and changemakers a single digital home to connect, collaborate on real-world projects, and track social impact.

## Quick start
Fork this Repository

```bash
# Clone
git clone https://github.com/your-username/ImpactConnect.git
cd impactconnect

# Frontend
cd frontend
cp .env.example .env          # fill in Supabase URL/anon key
npm install
npm run dev

# Supabase (local or cloud)
# Apply migrations in supabase/migrations/ and seed with supabase/seed.sql

# ML service (optional, stub)
cd ml-service
pip install -r requirements.txt
uvicorn main:app --reload
```

See [docs/architecture.md](docs/architecture.md) for how the pieces fit together and [CONTRIBUTING.md](CONTRIBUTING.md) to make your first contribution.

## Tech stack

- **Frontend:** React + Vite + Tailwind CSS + shadcn/ui + Framer Motion + React Query
- **Backend/infra:** Supabase (Postgres, Auth, Realtime, Storage, Edge Functions)
- **ML service:** Python FastAPI + scikit-learn (heuristics first, full ML later)
- **Hosting:** Vercel (frontend), Supabase (DB/auth), Railway/Render (ML service)

## MVP scope

**In scope:**
- Auth + profiles
- Connection requests + search
- Community feed + groups
- Project board + applications
- Basic skill matching (SQL/tags first)
- Impact dashboard skeleton
- Docs, CI, seed data

**Out of scope for MVP:**
- Full ML recommendation engine
- Production-grade food logistics
- Payments
- Mobile apps
- Advanced analytics

## Contributing

We welcome contributors of all levels. See [CONTRIBUTING.md](CONTRIBUTING.md) for how to get started, then pick an open issue labeled `good first issue`, `frontend`, `backend`, `database`, `ml`, or `docs`.

## Admin & response SLA

- **PR review:** within 24–48 hours
- **Issue triage:** weekly
- **Communication:** GitHub Discussions + Discord/Slack channel

I will maintain, review, and mentor — I will not implement all features myself.

## Project board

Work is tracked on the GitHub project board with columns: Backlog, Ready, In Progress, Review, Blocked, Done.

Milestones:
- Phase 1 — Foundation
- Phase 2 — Networking
- Phase 3 — Collaboration
- Phase 4 — Impact
- Phase 5 — Polish

## License

MIT — see [LICENSE](LICENSE).
