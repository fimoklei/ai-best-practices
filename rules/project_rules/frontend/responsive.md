# Responsive Design

## Core Principles
- **Mobile-first** — Start with mobile layout, enhance for larger screens.
- **Fluid layouts** — Use percentage-based widths and flexible containers.
- **Relative units** — Use rem/em over fixed pixels.
- **Content priority** — Most important content first on smaller screens.

## Breakpoints
- Use framework-provided breakpoints (`sm`, `md`, `lg`, `xl`, `2xl`).
- Document custom breakpoints in config.
- Prefer container queries over viewport queries for parent-width adaptation.

## Touch & Mobile
- Minimum tap target: 44x44px.
- Readable font sizes across breakpoints without zoom.
- Optimize images and assets for mobile networks.

## Layout Patterns
- Use CSS Grid/Flexbox for adaptive layouts.
- Consolidate spacing via shared gap/spacing tokens.
- Respect mobile safe-area insets.

## Performance
- Optimize images with responsive source sets or transformation services.
- Code split routes and lazy load features.
- Monitor bundle sizes. Flag components exceeding budgets.

## Testing
- Test on mobile, tablet, desktop via responsive preview tools.