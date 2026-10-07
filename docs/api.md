# API / Interface Spec — ImpactConnect

## Supabase client (frontend)

The frontend uses the Supabase JS client for:

- Auth: signup, login, OAuth, session management
- Database: queries and mutations on profiles, posts, connections, projects, etc.
- Realtime: subscribe to channels for chat, notifications, live updates
- Storage: upload/download avatars and files

All DB access is governed by RLS, so the client uses the anon key and policies do the authorization work.

### Common patterns

- Fetch current user profile from `profiles` by `auth.currentUser().id`
- Insert a post with the current user id
- Subscribe to a conversation channel keyed by conversation id
- Upload avatar to a storage bucket, store the public URL in `profiles.avatar_url`

## Edge Functions (future)

Edge Functions can handle server-side-only work that should not be exposed to the client, such as sending notifications, background jobs, or post-processing. Add them only when needed.

## ML service

The ML service is a separate Python FastAPI app. It is called by the frontend or Supabase Edge Functions over HTTP. Start with heuristics; full ML can be added later.

Base URL is `ML_SERVICE_URL` from env.

### POST /match/projects

Match volunteers to projects based on skills/tags.

Request body (example):
```json
{
  "project_id": "uuid",
  "context": {}
}
```

Response:
```json
{
  "matches": [
    { "user_id": "uuid", "score": 0.8, "reason": "skill overlap" }
  ]
}
```

MVP implementation: compute Jaccard/tag overlap between project needed skills and `profiles.skills`.

### POST /match/volunteers

Match volunteers to opportunities or food redistribution tasks.

Request body (example):
```json
{
  "opportunity_id": "uuid",
  "context": {}
}
```

Response:
```json
{
  "matches": [
    { "user_id": "uuid", "score": 0.7, "reason": "location + skill" }
  ]
}
```

### POST /forecast/demand

Forecast demand for a listing type or region (MVP heuristics).

Request body (example):
```json
{
  "listing_type": "food",
  "region": "city",
  "window_days": 7
}
```

Response:
```json
{
  "forecast": {
    "estimated_demand": 120,
    "unit": "servings",
    "confidence": 0.5,
    "note": "heuristic estimate, not production ML"
  }
}
```

### POST /recommend/connections

Suggest connections for a user.

Request body (example):
```json
{
  "user_id": "uuid",
  "limit": 10
}
```

Response:
```json
{
  "suggestions": [
    { "user_id": "uuid", "reason": "shared skill", "score": 0.6 }
  ]
}
```

## Errors

- ML service returns standard HTTP status codes and a JSON error body
- Supabase errors are surfaced via the client; frontend should handle common cases (unauthorized, not found, constraint violations)

## Versioning

Start without strict versioning. If the ML service grows, add `/v1/` prefix and document breaking changes.
