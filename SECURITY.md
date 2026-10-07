# Security Policy — ImpactConnect

## Supported versions

Only the latest `main` branch is actively supported for security fixes.

## Reporting a vulnerability

Do **not** open a public GitHub issue for a security vulnerability.

Instead, report it privately:
- Email: [your-email]
- GitHub: use the private vulnerability reporting feature on this repo if available, or contact the Project Admin directly

Please include:
- Description of the vulnerability
- Steps to reproduce or a proof of concept
- Potential impact
- Any remediation you have in mind

## What happens next

- The Project Admin will acknowledge receipt within a reasonable time
- We will work with you to understand and validate the issue
- We will coordinate a fix and public disclosure timeline with you
- We will credit reporters who wish to be credited, after the fix is released

## Good practices for contributors

- Never commit secrets, keys, or credentials
- Use `.env.example` as a template; add real values only to your local `.env`
- Do not commit `.env`, Supabase service role keys, or tokens
- Rotate any credential you suspect may have been exposed
