# CSS

## Fundamentals
- **Consistent methodology** — Choose one approach (utility-first, BEM, CSS modules) and apply it across the entire project.
- **Work with the framework** — Don't fight framework patterns with excessive overrides.
- **Design tokens** — Use shared tokens (colors, spacing, typography) for consistency. Don't hardcode values.
- **Document design tokens** — Keep tokens documented in a central location. Update documentation when tokens change.
- **Minimize custom CSS** — Leverage framework utilities to reduce maintenance burden.
- **Performance** — Purge unused styles in production builds.

## Utility-First CSS (Tailwind, etc.)
- Extend theme for project-specific tokens. Don't hardcode in markup.
- Use layers (`@layer components`, `@layer utilities`) for custom additions. Avoid global CSS outside layers.
- When composing dynamic class names, use merge utilities to prevent conflicting classes.
- Dark mode: adopt one strategy (data attribute or class) consistently across the project.

## Component Libraries
- When extending components, preserve accessibility attributes (ARIA roles, props).
- Prefer adjusting via utility classes on component slots over modifying underlying styles.
- Use variant utilities (e.g., `cva`) to centralize style variants. Avoid prop bloat.

## Custom CSS
- Scope custom styles by feature. Document why they exist.
- Remove custom CSS when framework gains native support.
- Keep PostCSS plugins aligned with config. Validate optimizations produce deterministic builds.