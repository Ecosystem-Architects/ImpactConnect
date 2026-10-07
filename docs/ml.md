# ML Service — ImpactConnect

## Purpose

The ML service provides matching, forecasting, and recommendation helpers that are too heavy or batch-oriented to do purely in the frontend or simple SQL.

## Starting point

We start with heuristics, not a full ML pipeline:

- Skill matching via tag overlap / Jaccard similarity
- Demand forecast via simple averages and heuristics
- Connection recommendations via shared skills, location, groups

Real ML (training, models, feature stores) is a later phase.

## Stack

- Python FastAPI
- scikit-learn (when we move beyond heuristics)
- Simple data from Supabase exports or API

## Service layout

```
ml-service/
├── main.py           # FastAPI app + endpoints
├── models/           # heuristic/matching logic
├── schemas/          # Pydantic request/response models
└── requirements.txt
```

## Endpoints

- `POST /match/projects` — match volunteers to projects
- `POST /match/volunteers` — match volunteers to opportunities
- `POST /forecast/demand` — forecast demand estimate
- `POST /recommend/connections` — suggest connections

See [docs/api.md](api.md) for request/response shapes.

## Data

The service will need a way to get profile skills, project requirements, and historical data. Early on, this can be passed in via request context or fetched through a Supabase client with a service role (carefully). Do not ship service role keys to the frontend.

## Milestones

- Phase 1: service scaffold + one heuristic endpoint
- Phase 2: more endpoints + basic evaluation
- Phase 3: scikit-learn models + better features
- Phase 4: evaluation pipeline + monitoring

## Testing

Each endpoint should have at least one example request and expected response. Add unit tests for matching logic as it grows.

## Ownership

ML/service work is advanced-level. Docs and stubs are open for intermediate contributors; heuristic logic can be a first ML contribution.
