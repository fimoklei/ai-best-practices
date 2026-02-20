# UI Components

## Design Principles
- **Single responsibility** — One clear purpose per component.
- **Reusable** — Configurable via props.
- **Composable** — Build complex UIs from smaller components. Avoid monolithic structures.
- **Clear interface** — Explicit props with sensible defaults.
- **Minimal props** — Many props signals need for composition or splitting.

## State Management
- Keep state local. Lift only when multiple components need it.
- Derive UI state from data sources (API cache, context, URL params).
- Colocate form validation with the form.

## Consistency
- Follow team naming conventions.
- Consume design tokens (colors, spacing, typography) from shared system.
- Keep implementation details private. Expose only necessary APIs.

## Data Fetching
- Centralize fetch logic in hooks or utilities.
- Handle loading and error states explicitly via Suspense or loading states.
- Cache strategically. Revalidate on mutation or time triggers.

## Forms
- Validate at submission boundary unless UX requires keystroke validation.
- Surface errors next to fields and in summary.
- Use validation schema (Zod, Yup) as single source of truth.

## Routing & Navigation
- Colocate route config with pages. Lazy load feature bundles.
- Sync filters/sort with URL params for shareable URLs.
- Provide metadata (title, description) per route.

## Testing
- Test component behavior and user interactions, not implementation details.
- Focus on what users see and do.