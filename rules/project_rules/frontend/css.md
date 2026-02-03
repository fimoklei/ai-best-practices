# CSS

## Fundamentals
- **Consistent methodology** — Choose one approach (utility-first, BEM, CSS modules) and apply project-wide.
- **Work with framework** — Avoid excessive overrides that fight framework patterns.
- **Design tokens** — Use shared tokens (colors, spacing, typography). Avoid hardcoded values.
- **Minimize custom CSS** — Leverage framework utilities.
- **Performance** — Purge unused styles in production.

## Utility-First CSS (Tailwind, etc.)
- Extend theme for project-specific tokens. Avoid hardcoding in markup.
- Use layers (`@layer components`, `@layer utilities`) for custom additions.
- Use merge utilities for dynamic class composition.
- Adopt one dark mode strategy (data attribute or class) project-wide.

## Component Libraries
- Preserve accessibility attributes (ARIA roles, props) when extending.
- Adjust via utility classes on component slots. Avoid modifying underlying styles.
- Use variant utilities (`cva`) to centralize style variants.

## Custom CSS
- Scope custom styles by feature. Document rationale.
- Remove custom CSS when framework gains native support.
- Keep PostCSS plugins aligned with config.