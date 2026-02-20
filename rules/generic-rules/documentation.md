# Documentation

Documentation lives with code—version-controlled, reviewed in PRs, updated with implementation.

## When to Document
- **Architecture decisions** → Write ADR
- **New features** → Feature doc + API docs + setup guide updates
- **Config changes** → Update environment documentation
- **Complex business logic** → Inline comments explaining why

## What NOT to Document
- Obvious code behavior (let code speak)
- Standard tool usage (link official docs)
- Temporary workarounds (fix or track as tech debt)

## Structure
- **README.md** at root — Purpose, quick start, key links
- **docs/** — Organized by topic (architecture/, api/, features/, guides/)
- **Inline** — Public APIs get JSDoc/docstrings
- **ADRs** — `docs/adr/NNNN-descriptive-title.md`

## Feature Documentation
Location: `docs/features/feature-name.md`

Include:
- **Purpose** — What problem it solves, who it's for
- **Usage** — How to use the feature (with examples)
- **Configuration** — Required settings, environment variables, feature flags
- **API** — Endpoints, parameters, responses (or link to OpenAPI spec)
- **Limitations** — Known constraints, edge cases, unsupported scenarios

Write feature docs before or during implementation, not after.

## ADRs
- Format: Title, Status, Context, Decision, Consequences
- Status: Proposed | Accepted | Deprecated | Superseded
- Write for: significant architecture choices, technology selections, design patterns affecting multiple components

## API Documentation
- OpenAPI/Swagger as single source of truth
- Co-locate spec with implementation
- Include request/response examples for all endpoints

## Diagrams
Use text-based formats (Mermaid, PlantUML) for version control compatibility.

## Documentation Checklist
Before merging:
- [ ] README updated if setup/config changed
- [ ] Feature doc created for new features
- [ ] API changes reflected in OpenAPI spec
- [ ] ADR written for architectural decisions
- [ ] Public APIs have inline docs
- [ ] No dead links introduced
