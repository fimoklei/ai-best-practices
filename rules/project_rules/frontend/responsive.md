# Responsive Design

## Core Principles
- **Mobile-first** — Start with mobile layout, enhance for larger screens.
- **Fluid layouts** — Percentage-based widths and flexible containers that adapt to screen size.
- **Relative units** — Use rem/em over fixed pixels for scalability and accessibility.
- **Content priority** — Most important content first on smaller screens.

## Breakpoints
- Use framework-provided breakpoints (e.g., `sm`, `md`, `lg`, `xl`, `2xl` in Tailwind).
- Document any custom breakpoints in config.
- Prefer container queries over viewport queries when adapting to parent width.

## Touch & Mobile
- Minimum tap target size: 44x44px.
- Readable font sizes across all breakpoints without zoom.
- Optimize images and assets for mobile network conditions.

## Layout Patterns
- Use CSS Grid/Flexbox for adaptive layouts.
- Consolidate spacing via shared gap/spacing tokens.
- Respect mobile safe-area insets where applicable.

## Performance
- Optimize images with responsive source sets or transformation services.
- Code split routes and lazy load features to keep initial payload small.
- Monitor bundle sizes. Flag components exceeding performance budgets.

## Testing
- Test on mobile, tablet, desktop using responsive preview tools.