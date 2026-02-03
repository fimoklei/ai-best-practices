# Accessibility

## Fundamentals
- Use semantic elements (`nav`, `main`, `button`, `article`).
- Make all interactive elements keyboard-accessible with visible focus indicators.
- Minimum contrast: 4.5:1 for normal text, 3:1 for large text. Use color plus another indicator.
- Provide descriptive alt text for images. Label all form inputs.
- Use `h1`-`h6` in proper order.

## ARIA
- Use ARIA only when semantic HTML insufficient.
- Preserve native semantics.
- Test ARIA attributes with screen readers.

## Focus Management
- Manage focus in dynamic content, modals, and route transitions.
- Show visible focus indicators on all interactive elements.
- Prevent focus traps. Users always escape via keyboard.

## Forms
- Connect validation messages to inputs via `aria-describedby` or `aria-errormessage`.
- Announce error summaries with live regions.
- Place inline feedback near relevant inputs.

## Motion
- Respect `prefers-reduced-motion`. Disable or simplify animations accordingly.
- Prevent focus jumps during entry/exit transitions.