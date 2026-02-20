# Threat Modeling Prompt Template

Reference prompts for driving repository-grounded security threat modeling.

---

## System Prompt

You are a senior application security engineer performing a structured threat model.

Rules:
- **Ground every claim**: All architectural statements must reference a repository path with evidence anchors (file path, config key, or code snippet). Never invent components.
- **Redact secrets**: If credentials or tokens are encountered, redact them — describe only their presence and location.
- **Scope discipline**: Distinguish production runtime behavior from CI/build tooling and test/example code. Separate attacker-controlled inputs from operator-controlled and developer-controlled inputs.
- **No generics**: Threats must be specific to this system. Generic OWASP listings without system-specific evidence are not acceptable.

---

## Repository Summary Prompt

Use this prompt for initial codebase exploration before threat modeling:

```
Analyze this repository and provide a security-focused summary covering:

1. **Project overview**
   - Programming languages and frameworks
   - Build systems and tooling
   - Core purpose and high-level architecture

2. **Security posture**
   - User-facing entry points (APIs, CLI, webhooks, UI)
   - Trust boundaries between components
   - Existing security layers (authentication, authorization, input validation, isolation)

3. **Critical components**
   - Security-sensitive modules (auth, crypto, payment, data access)
   - Assumptions the system relies on to remain secure

Adapt to project type: web application, CLI tool, network daemon, background worker, or low-level library.
Cite specific file paths as evidence for each claim.
```

---

## Threat Model User Prompt

Ten-step process for producing the full threat model:

```
Perform a repository-grounded threat model for [REPO/PATH] following these steps:

1. **Repo discovery**
   Identify: languages, frameworks, entry points, and security-relevant surfaces
   (network listeners, authentication mechanisms, parsing logic, file operations,
   secrets handling, privilege boundaries).

2. **System model**
   Document primary components, data flows, and trust boundaries.
   State the security guarantees each boundary is expected to enforce.

3. **Assets and objectives**
   List assets with their confidentiality, integrity, and availability requirements.

4. **Attacker model**
   Define realistic attacker capabilities AND non-capabilities based on actual exposure.

5. **Threat enumeration**
   Generate concrete, system-specific threats tied to entry points and trust boundaries.
   Cite evidence for each.

6. **Risk prioritization**
   Assign likelihood and impact (low/medium/high) with one-sentence justifications.

7. **Assumption validation**
   Summarize key assumptions. Ask 1–3 clarifying questions. Pause for user feedback.

8. **Mitigations**
   For each high/critical threat: existing controls, gaps, and concrete recommendations
   with file path references and implementation hints.

9. **Focus paths**
   Identify 2–30 repository paths warranting deeper security review.

10. **Quality check**
    Verify: all entry points covered, trust boundaries mapped, runtime/CI separated,
    assumptions documented, output format matches template.

Write the final report to: [REPO-NAME]-threat-model.md
```

---

## Required Output Sections

| # | Section | Content |
|---|---------|---------|
| 1 | Executive Summary | Top risk themes and highest-risk areas |
| 2 | Scope and Assumptions | In-scope paths, explicit assumptions, open questions |
| 3 | System Model | Components, data flows, trust boundaries, Mermaid diagram |
| 4 | Assets and Security Objectives | Table: asset → CIA requirements |
| 5 | Attacker Model | Capabilities and non-capabilities |
| 6 | Entry Points and Attack Surfaces | Table: surface, boundary, evidence |
| 7 | Top Abuse Paths | 5–10 numbered attack sequences |
| 8 | Threat Model Table | TM-001… with source, prereqs, action, impact, controls, gaps, mitigations, detection, priority |
| 9 | Criticality Calibration | Definitions with system-specific examples |
| 10 | Focus Paths for Security Review | Table: repo path → threat IDs |

### Mermaid Diagram Rules

```
flowchart TD
    A["Component A"] --> B["Component B"]
    B --> C["Data Store"]
```

- Use `flowchart TD` or `flowchart LR` only
- Only `-->` arrows (no `---`, `-.->`, etc.)
- No `title` or `style` directives
- Node IDs: `[A-Za-z0-9_]` only; labels must be quoted
- Edge labels: plain words and spaces only
