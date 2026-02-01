# Security

## No hardcoded secrets
- All credentials, API keys, connection strings, and tokens must come from environment variables.
- Use placeholders like `YOUR_API_KEY_HERE` in test/example code. Never real values.
- If you see a hardcoded secret anywhere in the codebase, flag it immediately. Don't work around it silently.
- Never log raw request bodies or environment variables.

## Input validation at the boundary
- Validate all external data — HTTP bodies, query params, webhook payloads, file uploads — before it reaches business logic.
- Use the project's validation library (check package.json).
- Validation schemas live next to the route handler.
- Internal APIs validate too. Defense in depth.

## Dependency hygiene
- Before adding a package: check last release date and open issues.
- Unmaintained over 1 year = flag and discuss alternatives.
- Under 20 lines of logic? Implement it yourself. No dependency needed.

## Sensitive file exclusions
- Blocked files: `.env`, `.env.*`, `secrets/**`, `*.pem`, `.key`, `config/credentials`
- These must never be read or modified. If a task genuinely requires it, stop and ask first.