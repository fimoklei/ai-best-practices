# UI Components

## Design Principles
- **Single responsibility** — One clear purpose per component.
- **Reusable** — Configurable via props for use across contexts.
- **Composable** — Build complex UIs from smaller, simpler components. Not monolithic structures.
- **Clear interface** — Explicit, well-documented props with sensible defaults.
- **Minimal props** — If a component needs many props, consider composition or splitting it.

## State Management
- Keep state as local as possible. Lift only when multiple components need it.
- Derive UI state from data sources (API cache, context, URL params) instead of duplicating in component state.
- For forms: colocate validation logic with the form, not scattered across children.

## Consistency
- Follow naming conventions from team/project standards.
- Consume design tokens (colors, spacing, typography) from a shared system. Don't hardcode values.
- Keep internal implementation details private. Expose only necessary APIs.

## Data Fetching
- Centralize fetch logic in hooks or utilities. Don't scatter fetch calls across components.
- Handle loading and error states explicitly. Use Suspense boundaries or loading states, not inline conditionals scattered everywhere.
- Cache strategically. Revalidate on mutation or time-based triggers.

## Forms
- Validation at submission boundary. Don't validate on every keystroke unless UX requires it.
- Surface errors next to relevant fields and in summary when appropriate.
- Keep validation schema (e.g., Zod, Yup) as single source of truth. Don't duplicate rules in UI logic.

## Routing & Navigation
- Colocate route config with pages. Use lazy loading for feature bundles.
- Sync filters/sort state with URL params for shareable, bookmarkable URLs.
- Provide metadata (title, description) per route for SEO and sharing.

## Testing
- Test component behavior and user interactions, not implementation details.
- Focus on what users see and do.

## Documentation
- Document component usage, props, and examples when non-obvious.
- If a component has complex behavior or edge cases, document them inline or in adjacent docs.