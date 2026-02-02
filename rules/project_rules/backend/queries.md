## Database Queries

### Security
- **Sanitize all user input** — Cast to expected types before using in queries. Never pass raw user input to query operators.
- **Avoid dynamic execution** — No `$where`, no JavaScript evaluation in queries. Use native query operators only.

### Performance
- **Project only needed fields** — Use projections to return required properties only. Smaller payloads = faster responses.
- **Align queries with indexes** — Query on indexed fields. Verify execution plans to catch full collection/table scans.
- **Avoid N+1 queries** — Fetch related data in batch operations or joins, not iterative lookups per record.
- **Lean reads when possible** — Return plain objects for read-only operations. Skip ORM hydration overhead.
- **Timeouts and limits** — Set query timeouts and result limits. Require explicit pagination parameters for unbounded datasets.

### Data Integrity
- **Transactions for multi-record updates** — Use transactions when consistency across multiple records is required.
- **Keep transactions short** — Minimize lock duration. Fetch data outside transaction, write inside.

### Optimization
- **Cache expensive queries** — Cache aggregations, metadata lookups, or computed results when access patterns justify it.
- **Document cache invalidation** — Every cache has an invalidation strategy. Document it alongside the caching logic.
- **Explain plans for slow queries** — Profile and optimize queries that exceed performance budgets.