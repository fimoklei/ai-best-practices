---
paths:
  - "**/*.model.ts"
  - "**/*.model.tsx"
  - "**/models/**/*"
  - "lib/**/models/**/*"
  - "server/**/models/**/*"
---

## Data Models (Mongoose/MongoDB)

### Naming & Structure
- **Model names**: Singular (`Prompt`). Collection names: plural (`prompts`).
- **File names match models** — `prompt.model.ts` exports `Prompt`.
- **Timestamps** — Track `createdAt` and `updatedAt` on every model.

### Schema Integrity
- Enforce constraints at schema level: required fields, enums, defaults, custom validators.
- Define business rules in schema, not across service layer.
- Derive TypeScript types from Mongoose schemas using `InferSchemaType` or manual interfaces.
- Use Zod schemas for validation at API boundaries; Mongoose schema for persistence constraints.

### Mongoose Patterns
- Use `Schema.index()` for compound indexes inline with schema definition.
- Use `.toJSON()` transform to strip `_id`, `__v`, and remap `id`.
- Return serialized plain objects from query layer (`JSON.parse(JSON.stringify(doc.toJSON()))`).
- Use `.lean()` for read-only queries where model methods aren't needed.

### Relationships
- Embed for 1-to-few bounded relationships, reference for 1-to-many unbounded.
- Document ownership rules explicitly.
- Avoid deep nesting beyond 2-3 levels.

### API Boundary
- Keep DTOs separate from models. API response shape differs from database shape.
- Use virtuals for derived/computed fields that don't persist.

### TypeScript
- Export types for both persisted shape and API response shape.
- Type lean queries as plain objects, not Mongoose documents.