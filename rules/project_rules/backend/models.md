---
paths:
  - "**/*.model.ts"
  - "**/*.model.tsx"
  - "**/models/**/*"
  - "lib/**/models/**/*"
  - "server/**/models/**/*"
---

## Data Models

### Naming & Structure
- **Model names**: Singular (`User`, `Order`). Collection/table names: plural (`users`, `orders`).
- **File names match models** — `user.model.ts` exports `User`, `order.model.ts` exports `Order`.
- **Timestamps** — Track `createdAt` and `updatedAt` on every model.

### Schema Integrity
- Enforce constraints at schema level: required fields, enums, defaults, custom validators.
- Define business rules in schema, not across service layer.
- Derive TypeScript types from schemas, not reverse.
- Deploy model changes with migrations that update existing data.

### Relationships
- Embed for 1-to-few bounded relationships, reference for 1-to-many unbounded.
- Document ownership rules explicitly.
- Avoid deep nesting beyond 2-3 levels.

### Performance
- Define compound indexes inline with schemas on frequently queried fields.
- Return plain objects for reads when model methods unnecessary.
- Reuse database connections across requests via connection pooling.

### API Boundary
- Keep DTOs separate from models. API response shape differs from database shape.
- Use transforms (`toJSON`, serializers) to strip internal fields (`_id`, `__v`, password hashes).
- Use virtuals for derived/computed fields that don't persist.

### TypeScript
- Export types for both persisted shape and API response shape.
- Use schema inference tools to keep types DRY.
- Type lean queries as plain objects, not ORM instances.