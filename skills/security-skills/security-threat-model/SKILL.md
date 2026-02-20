---
name: security-threat-model
description: Repository-grounded threat modeling that enumerates trust boundaries, assets, attacker capabilities, abuse paths, and mitigations, and writes a concise Markdown threat model. Trigger only when the user explicitly asks to threat model a codebase or path, enumerate threats/abuse paths, or perform AppSec threat modeling.
version: 1.0.0
languages: all
---

# Security Threat Model

## Overview

Deliver an actionable AppSec-grade threat model specific to a repository or project path, anchoring every architectural claim to evidence in the codebase with explicit assumptions.

**Core principle:** Every component, data store, endpoint, and flow must be derived from actual codebase analysis — not generic assumptions.

## Eight-Step Workflow

### Step 1: Scope and Extract

Identify from the repository:
- Components and services
- Data stores and their sensitivity
- External integrations and dependencies
- Runtime entrypoints (network listeners, APIs, CLI, webhooks)
- Explicit out-of-scope items (document these)

### Step 2: Derive Boundaries, Assets, Entry Points

Map trust boundaries between components, documenting:
- Protocol used
- Authentication mechanism
- Encryption in transit/at rest
- Input validation present
- Rate limiting applied

List assets driving risk. Identify all entry points attackers could reach.

### Step 3: Calibrate Assets and Attacker Capabilities

Define realistic attacker goals based on actual exposure. Note **non-capabilities** explicitly — this prevents inflated severity assessments and keeps the model credible.

### Step 4: Enumerate Threats as Abuse Paths

Map threats to assets and trust boundaries:
- Data exfiltration paths
- Privilege escalation vectors
- Integrity compromise opportunities
- Denial-of-service surfaces

Keep the count small but high quality. Generic threats add noise; specific abuse paths add value.

### Step 5: Prioritize with Likelihood and Impact

Use qualitative reasoning (low / medium / high) with short justifications. Set overall priority (critical / high / medium / low) adjusted for existing controls.

**Reference thresholds:**
- **Critical/High**: pre-auth RCE, auth bypass, cross-tenant access, sensitive data exfiltration, key/token theft, model/config integrity compromise, sandbox escape
- **Medium**: targeted DoS of critical components, partial data exposure, rate-limit bypass with measurable impact, log poisoning affecting detection
- **Low**: low-sensitivity info leaks, noisy DoS with easy mitigation, issues requiring unlikely preconditions

### Step 6: Validate with User

Before finalizing:
1. Summarize key assumptions made
2. Ask 1–3 targeted clarification questions
3. Pause for feedback

### Step 7: Recommend Mitigations

Distinguish existing controls from recommended ones. Tie each recommendation to:
- A specific file path or component
- The control type (validation, auth, encryption, rate limiting, etc.)
- An implementation hint

### Step 8: Quality Check

Confirm before delivering:
- [ ] All entrypoints enumerated
- [ ] All trust boundaries mapped
- [ ] Runtime vs CI/build tooling separated
- [ ] User clarifications incorporated
- [ ] Assumptions documented
- [ ] Output matches the required template

## Required Output Format

Write the final threat model to `<repo-or-dir-name>-threat-model.md` with these sections:

1. **Executive summary** — Top risk themes and highest-risk areas
2. **Scope and assumptions** — In-scope paths, explicit assumptions, open questions
3. **System model** — Primary components, data flows, trust boundaries, Mermaid diagram
4. **Assets and security objectives** — Table mapping assets to CIA goals
5. **Attacker model** — Capabilities and non-capabilities
6. **Entry points and attack surfaces** — Table with surfaces, boundaries, evidence
7. **Top abuse paths** — 5–10 numbered attack sequences
8. **Threat model table** — TM-001, TM-002… with source, prereqs, action, impact, controls, gaps, mitigations, detection, priority
9. **Criticality calibration** — Definitions with examples
10. **Focus paths for security review** — Table linking repo paths to threat IDs

### Mermaid Diagram Constraints

- Use `flowchart TD` or `flowchart LR`
- Only `-->` arrows
- No `title` or `style` directives
- Node IDs: letters, numbers, underscores only; labels in quotes
- Edge labels: plain words and spaces only

## Key Constraints

- Evidence anchors are **mandatory** for every major architectural claim (file path, config key, or code snippet)
- Redact any credentials or tokens encountered — describe only their presence and location
- Separate attacker-controlled inputs from operator-controlled and developer-controlled inputs
- Do not finalize the report before user validates assumptions (Step 6)
