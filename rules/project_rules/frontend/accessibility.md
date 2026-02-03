# Accessibility

## Fundamentals
- Use appropriate elements (`nav`, `main`, `button`, `article`) that convey meaning to assistive tech.
- All interactive elements accessible via keyboard with visible focus indicators.
- Minimum 4.5:1 for normal text, 3:1 for large text. Don't rely on color alone to convey information.
- Descriptive alt text for images. Meaningful labels for all form inputs.
- Use `h1`-`h6` in proper order to create clear document outline.

## ARIA
- Use ARIA only when semantic HTML isn't sufficient.
- Don't override native semantics unless necessary.
- Test that ARIA attributes behave as expected with screen readers.

## Focus Management
- Manage focus in dynamic content, modals, and route transitions.
- Visible focus indicators on all interactive elements.
- Prevent focus traps — users can always escape with keyboard.

## Forms
- Connect validation messages to inputs via `aria-describedby` or `aria-errormessage`.
- Error summaries announced with live regions where appropriate.
- Inline feedback appears near relevant inputs, not just at form top.

## Motion
- Respect `prefers-reduced-motion` — disable or simplify animations for users who opt out.
- Focus management during animations — prevent focus jumps on entry/exit transitions.