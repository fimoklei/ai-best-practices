# Security Controls and Asset Reference

Structured reference for security assessment. Prefer specific, system-grounded items over generic checklists.

---

## Asset Categories

Use these categories to build your asset inventory. For each asset, note its location in the repository and its CIA sensitivity.

| Category | Examples |
|----------|---------|
| User data | PII, user-generated content, uploads, profile data |
| Authentication materials | Passwords (hashed), session tokens, API keys, OAuth tokens |
| Authorization data | Roles, permission policies, ACLs, entitlements |
| Cryptographic assets | Encryption keys, signing keys, certificates, secrets |
| Configuration | Feature flags, environment variables, infrastructure config |
| ML models | Model weights, training data, inference pipelines |
| Source code and artifacts | Build outputs, compiled binaries, container images |
| Audit and telemetry | Logs, traces, metrics, security events |
| Availability-critical resources | Queues, caches, rate limit counters, compute budgets |
| Tenant isolation boundaries | Tenant identifiers, namespace separators, cross-tenant controls |

---

## Security Control Categories

### Identity and Access Management
- Authentication mechanisms (password, MFA, SSO, API key, mTLS)
- Session management (token lifetime, rotation, revocation)
- Authorization model (RBAC, ABAC, ownership checks)
- Privilege separation and least-privilege enforcement

### Input Protection
- Schema validation at API boundaries
- Input sanitization and encoding
- File upload validation (type, size, content)
- Query parameterization (SQL, NoSQL, LDAP)

### Network Safeguards
- TLS enforcement and certificate validation
- Network segmentation and firewall rules
- Rate limiting and throttling
- DDoS protection

### Data Protection
- Encryption at rest (algorithm, key management)
- Encryption in transit (TLS version, cipher suites)
- Data minimization and retention policies
- Backup encryption

### Isolation
- Process isolation (containers, sandboxes, VMs)
- Tenant data isolation (row-level security, namespace separation)
- Dependency sandboxing
- Resource quotas and limits

### Observability
- Security event logging (auth attempts, privilege changes, errors)
- Anomaly detection and alerting
- Audit trail integrity
- Centralized log aggregation

### Supply Chain
- Dependency pinning and lockfiles
- Vulnerability scanning (SCA, SAST, DAST)
- Container image provenance
- CI/CD pipeline integrity

### Change Control
- Code review requirements
- Deployment approval gates
- Infrastructure-as-code review
- Secret rotation procedures

---

## Mitigation Pattern Templates

Use these patterns when writing mitigation recommendations. Always bind to a specific location.

```
- Enforce JSON schema validation at [entry point path] before passing to business logic.
- Require authorization check for [action] verifying [subject] owns [resource] before [operation].
- Apply sandbox isolation to [component] with resource constraints: [CPU/memory/network limits].
- Rate-limit [endpoint] by [key: user ID / IP / tenant] to [N requests per window].
- Encrypt [asset] at rest using AES-256-GCM with keys stored in [KMS/vault]; implement key rotation every [N days].
- Validate [file type] uploads by inspecting magic bytes at [handler path], not file extension.
- Parameterize all [database] queries in [module path] to prevent injection.
- Add Content-Security-Policy header in [middleware path] to restrict script sources.
```
