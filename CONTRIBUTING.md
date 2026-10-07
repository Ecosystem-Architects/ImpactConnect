# Contributing to ImpactConnect

Thanks for contributing! ImpactConnect is a SWOC open-source project — we want first-time contributors to feel welcome.

## Before you start

- Read the [README](README.md) and [docs/architecture.md](docs/architecture.md)
- Pick an open issue — ideally one labeled `good first issue`
- Leave a comment on the issue so we can assign it to you and avoid duplicate work
- If you want to work on something not tracked yet, open an issue first

## Setup

1. Fork the repo and clone it locally
2. Create a `.env` from `.env.example` in `frontend/` (and `ml-service/` if working on ML)
3. Fill in Supabase credentials from your project dashboard
4. Run `npm install` in `frontend/`, `pip install -r requirements.txt` in `ml-service/`
5. Apply Supabase migrations and seed data

See the [README](README.md) quick start for full steps.

## How to contribute

- **New contributors:** pick a `good first issue`
- **Intermediate:** Supabase RLS, CRUD, realtime, search, forms
- **Advanced:** ML service, demand prediction, impact aggregations, GitHub integration

Each issue notes the likely files involved and acceptance criteria. If something is unclear, ask in the issue thread or Discussions.

## Pull requests

1. Create a branch from `main`: `git checkout -b feat/your-feature`
2. Make your changes, add tests where relevant
3. Run lint/format checks if the repo has them
4. Open a PR against `main` using the PR template
5. Keep PRs small and focused — one feature or fix per PR

PRs should include:
- What changed and why
- A screenshot or short demo link for UI changes
- Any new env vars or migrations
- Confirmation that no secrets are committed

## Code style

- Frontend: TypeScript + React, Tailwind utilities, shadcn/ui components where possible
- Database: SQL migrations, no ad-hoc schema changes in issues without a migration
- ML: keep stubs and heuristics readable; document assumptions
- Docs: update docs when behavior changes

## Reporting bugs

Open an issue with:
- What you expected vs what happened
- Steps to reproduce
- Your environment (browser, Node version, Supabase project type)
- Screenshots or logs if relevant

## Suggesting features

Open a feature request issue or post in Discussions. New features that are not MVP go to the Backlog / Post-MVP column — we will not add them to the current milestone without agreement.

## Code of Conduct

Please follow [CODE_OF_CONDUCT.md](CODE_OF_CONDUCT.md). Be respectful and constructive.

## Getting help

- GitHub Discussions for questions
- Discord/Slack channel linked from the repo
- Tag the Project Admin in issues if you are blocked

## Response SLA

- PR review: within 24–48 hours
- Issue triage: weekly
- Blocked contributors: please comment in the issue; we will unblock as soon as we can
