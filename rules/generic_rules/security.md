 # Security Guidelines

## Mandatory Security Checks

Before ANY commit:
- [ ] No hardcoded secrets (API keys, passwords, tokens)
- [ ] All user inputs validated
- [ ] SQL injection prevention (parameterized queries)
- [ ] XSS prevention (sanitized HTML)
- [ ] CSRF protection enabled
- [ ] Authentication/authorization verified
- [ ] Rate limiting on all endpoints
- [ ] Error messages don't leak sensitive data

## Secret Management

```typescript
// NEVER: Hardcoded secrets
const apiKey = "sk-proj-xxxxx"

// ALWAYS: Environment variables
const apiKey = process.env.OPENAI_API_KEY

if (!apiKey) {
  throw new Error('OPENAI_API_KEY not configured')
}
```

## Security Response Protocol

If security issue found:
1. STOP immediately
2. Use **security-reviewer** agent
3. Fix CRITICAL issues before continuing
4. Rotate any exposed secrets
5. Review entire codebase for similar issues

## Dependency hygiene
- Before adding a package: check last release date and open issues.
- Unmaintained over 1 year = flag and discuss alternatives.
- Under 20 lines of logic? Implement it yourself. No dependency needed.

## Input validation at the boundary
- Validate all external data — HTTP bodies, query params, webhook payloads, file uploads — before it reaches business logic.
- Use the project's validation library (check package.json).
- Validation schemas live next to the route handler.
- Internal APIs validate too. Defense in depth.