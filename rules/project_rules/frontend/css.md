---
paths:
  - "**/*.css"
  - "**/*.scss"
  - "**/*.module.css"
  - "**/globals.css"
  - "tailwind.config.*"
  - "postcss.config.*"
---

# CSS (Tailwind + shadcn/ui)

## Stack
- **Tailwind CSS** — utility-first, all styling via class names.
- **shadcn/ui** — component primitives with built-in accessibility.
- **`cn()` utility** — `lib/utils.ts` exports `cn(clsx(...), twMerge(...))` for conditional class merging.

## Conventions
- Use Tailwind utilities directly. Avoid custom CSS unless absolutely necessary.
- Extend theme in `tailwind.config` for project-specific tokens. No hardcoded color/spacing values.
- Use `cn()` for dynamic class composition — never manual string concatenation.
- Use `cva` (class-variance-authority) for component variant patterns.
- One dark mode strategy project-wide (class-based via shadcn/ui theme provider).

## shadcn/ui
- Customize via utility classes on component slots. Don't modify underlying component styles.
- Preserve accessibility attributes (ARIA roles, props) when extending.
- shadcn components live in `components/ui/` — treat as editable primitives.

## Custom CSS
- Scope custom styles by feature. Document rationale.
- Remove custom CSS when Tailwind/shadcn gains native support.
- Keep PostCSS plugins aligned with config.