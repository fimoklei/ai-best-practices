---
paths:
  - "**/*.queries.ts"
  - "**/*.query.ts"
  - "**/queries/**/*"
  - "lib/**/queries/**/*"
  - "server/**/queries/**/*"
---

## Database Queries (MongoDB/Mongoose)

### File Convention
- Query files use `.queries.server.ts` suffix to enforce server-only execution.
- One query file per model (e.g., `prompt.queries.server.ts`).

### Security
- Cast user input to expected types before queries. Prohibit raw user input in query operators.
- Never use `$where` or JavaScript evaluation in queries.

### Mongoose Patterns
- Use `.lean()` for read-only queries — skips Mongoose hydration, returns plain objects.
- Serialize with `JSON.parse(JSON.stringify(doc.toJSON()))` for Next.js serialization (removes ObjectId, Date objects).
- Use native query operators (`$match`, `$in`, `$regex`) over application-level filtering.
- Project only needed fields with `.select()`.

### Performance
- Query indexed fields. Verify execution plans catch full scans.
- Batch related data fetches. Avoid N+1 queries.
- Set query timeouts and result limits. Require pagination for unbounded datasets.

### Data Integrity
- Use transactions for multi-record updates requiring consistency.
- Minimize lock duration. Fetch outside transaction, write inside.