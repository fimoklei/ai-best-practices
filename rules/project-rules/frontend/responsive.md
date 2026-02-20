---
paths:
  - "**/*.tsx"
  - "**/*.css"
---

# Responsive Design

## Core Principles
- **Mobile-first** — Start with mobile layout, enhance with `md:`, `lg:` breakpoints.
- **Tailwind breakpoints** — Use `sm`, `md`, `lg`, `xl`, `2xl`. No custom breakpoints without discussion.
- **Fluid layouts** — Use percentage-based widths and flexible containers.
- **Relative units** — Use rem/em over fixed pixels.

## Project Patterns
- **Sidebar** — Hidden on mobile (`hidden md:block`), visible on desktop. Uses shadcn/ui `Sidebar` component.
- **Text sizing** — Base `text-base` on mobile, `md:text-sm` for tighter desktop typography (see input/textarea components).
- **Content priority** — Most important content first on smaller screens.

## Touch & Mobile
- Minimum tap target: 44x44px.
- Readable font sizes across breakpoints without zoom.

## Performance
- Optimize images with responsive source sets or transformation services.
- Code split routes and lazy load features.
