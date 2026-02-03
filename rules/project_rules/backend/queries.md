## Database Queries

### Security
- Cast user input to expected types before queries. Prohibit raw user input in query operators.
- Use native query operators only. Prohibit `$where` and JavaScript evaluation.

### Performance
- Project only needed fields. Smaller payloads, faster responses.
- Query indexed fields. Verify execution plans catch full scans.
- Batch related data fetches. Avoid N+1 queries.
- Return plain objects for read-only operations. Skip ORM hydration.
- Set query timeouts and result limits. Require pagination for unbounded datasets.

### Data Integrity
- Use transactions for multi-record updates requiring consistency.
- Minimize lock duration. Fetch outside transaction, write inside.

### Optimization
- Cache aggregations, metadata, computed results when justified.
- Document cache invalidation strategy alongside caching logic.
- Profile and optimize queries exceeding performance budgets.