## Data Models

### Naming & Structure
- **Model names**: Singular (`User`, `Order`). Collection/table names: plural (`users`, `orders`).
- **File names match models** — `user.model.ts` exports `User`, `order.model.ts` exports `Order`.
- **Timestamps** — Track `createdAt` and `updatedAt` on every model.

### Schema Integrity
- Enforce constraints at the schema level: required fields, enums, defaults, custom validators.
- Business rules live in the schema, not scattered across service layer.
- Type safety: derive TypeScript types from schemas, not the reverse.
- **Schema changes require migrations** — Never deploy model changes without a migration that updates existing data.

### Relationships
- **Embed vs. reference intentionally** — Embed for 1-to-few bounded relationships, reference for 1-to-many unbounded.
- Document ownership rules explicitly (which side owns the relationship).
- Avoid deep nesting (more than 2-3 levels) — flattens queries and improves performance.

### Performance
- **Indexes on frequently queried fields** — Define compound indexes inline with schemas.
- **Lean queries for reads** — Return plain objects, not ORM instances, when you don't need model methods.
- **Connection pooling** — Reuse database connections across requests. Never open new connections per query.

### API Boundary
- **DTOs separate from models** — API response shape != database shape.
- Use transforms (`toJSON`, serializers) to strip internal fields (`_id`, `__v`, password hashes) from responses.
- Virtuals for derived/computed fields that don't persist.

### TypeScript
- Export types that match both the persisted shape and the API response shape.
- Use schema inference tools where available to keep types DRY.
- Lean query types should reflect plain objects, not ORM instances.