---
name: the-challenger
description: Pre-launch red team analysis that identifies failure modes and validates assumptions before resource commitment. Use when evaluating new products/features/strategies, before significant resource allocation, when stakeholders seem overly optimistic, or when cost of failure would be high (reputation, budget, market position).
---

# The Challenger

A pre-launch red team skill that identifies failure modes and validates assumptions before you commit resources.

## When to Use This Skill

Use The Challenger:
- Before committing significant resources (time, budget, people) to an idea
- When evaluating whether to pursue a new product, feature, or initiative
- When stakeholders seem overly optimistic about a proposal
- After brainstorming but before implementation planning
- When the cost of failure would be high (reputation, market position, resources)

**Critical timing:** Use this AFTER idea development but BEFORE detailed implementation. Goal: identify fatal flaws while pivot costs are still low.

## The 6-Phase Process

**Phase 1: Pre-Mortem Analysis**
Assume the project has failed spectacularly in [appropriate timeframe]. Generate failure scenarios across Market, Technical, Resource, Execution, and External categories. Rate each: likelihood (1-5), impact (1-5), evidence level, early warning signals.
→ See references/pre-mortem-detailed.md for full guidance

**Phase 2: Assumption Extraction**
Extract all implicit assumptions from the proposal and failure scenarios. Categorize by type: Desirability (do they want this?), Feasibility (can we build?), Viability (should we?), Adaptability (can it survive change?).

**Phase 3: Assumption Mapping**
Map each assumption on two axes: Importance (1-5) × Evidence (1-5). Focus on DANGER ZONE: high importance + low evidence.
→ See references/assumption-mapping-detailed.md for mapping guidance

**Phase 4: Adversarial Testing**
For each danger-zone assumption, apply:
- Opposition test: "If opposite is true, does it matter?"
- "What would have to be true" test
- Evidence audit: What proof do we have?
- Falsification test: What would prove this wrong?
→ See references/assumption-mapping-detailed.md for testing protocols

**Phase 5: IF-THEN Risk Statements**
Convert critical assumptions into: "IF [assumption] proves false, THEN [specific consequence] occurs, requiring [contingency action]"
→ See references/risk-framework.md for statement templates

**Phase 6: Go/No-Go Decision**
- 🔴 RED (Don't Proceed): Multiple high-impact failures, no validation path
- 🟡 YELLOW (Validate First): Critical assumptions need testing before commitment
- 🟢 GREEN (Proceed with Monitoring): Strong evidence, mitigation plans in place

## Output Template

ALWAYS structure your final output exactly as follows:

```
# [Project Name] - Challenger Analysis

## Executive Summary
- **Recommendation:** 🔴 RED / 🟡 YELLOW / 🟢 GREEN
- **Top 3 Failure Modes:** 
  1. [Failure mode] (Likelihood: X/5, Impact: Y/5)
  2. [Failure mode] (Likelihood: X/5, Impact: Y/5)
  3. [Failure mode] (Likelihood: X/5, Impact: Y/5)
- **Critical Assumption:** [Most dangerous unvalidated assumption]
- **Next Steps:** [Minimum validation required to proceed]

## Failure Mode Analysis

| Category | Scenario | L | I | Evidence | Warning Signal |
|----------|----------|---|---|----------|----------------|
| Market   | [scenario] | X | Y | [level] | [signal] |
| Technical| [scenario] | X | Y | [level] | [signal] |
| Resource | [scenario] | X | Y | [level] | [signal] |

[Continue for top 8-10 failure modes]

## Assumption Map

```
        High Importance
             │
    Known    │    Unknown
─────────────┼─────────────
             │  DANGER ZONE:
    Low      │  1. [Assumption]
 Importance  │  2. [Assumption]
             │  3. [Assumption]
```

**Danger Zone (Validate First):**
- [Assumption]: Importance X/5, Evidence Y/5
- [Assumption]: Importance X/5, Evidence Y/5

## Validation Roadmap

| Assumption | Validation Experiment | Timeline | Cost | Success Criteria |
|------------|----------------------|----------|------|------------------|
| [assumption] | [experiment] | [time] | [cost] | [criteria] |

## IF-THEN Risk Statements

1. IF [assumption] proves false, THEN [consequence], requiring [contingency]
2. IF [assumption] proves false, THEN [consequence], requiring [contingency]
3. IF [assumption] proves false, THEN [consequence], requiring [contingency]

## Recommendation Details

[Elaborate on why RED/YELLOW/GREEN, what must happen next]
```

## Communication Protocol

Always announce at start: "I'm using The Challenger skill to stress-test this idea before implementation. This will feel adversarial - that's the point. The goal is to prevent expensive failures by identifying fatal flaws now while pivot costs are low."

## Integration with Other Skills

**Workflow positioning:**
```
Brainstorming → [Develop idea]
       ↓
The Challenger → [Identify failure modes & assumptions]
       ↓
Argument-Analyzer → [Validate logic of mitigation strategy]
       ↓
Domain Skill → [Ensure alignment with principles]
       ↓
Implementation Planning
```

**The Challenger is NOT:**
- A substitute for market research (use that to validate assumptions)
- A reason to never take risks (it helps you take SMART risks)
- An excuse for analysis paralysis (time-box validation experiments)
- A way to kill ideas you don't like (it's evidence-based, not opinion-based)

## Best Practices

**Time-box the analysis:** Pre-mortem 30-45 min, assumption mapping 30 min, adversarial testing 15 min per danger-zone assumption. Total: 2-3 hours maximum.

**Validation experiments must be CHEAP:** Learn before spending. If validation costs >10% of build cost, find cheaper methods (interviews, prototypes, landing pages).

**Focus ONLY on danger zone:** High importance + low evidence assumptions. Accept that some risk is inherent.

**Psychological safety essential:** Frame as "collaborative failure prevention." The facilitator declares failure occurred - criticism becomes constructive.

**Update the map as you learn:** Assumption maps are living documents. Revisit quarterly for strategic initiatives.

**Success indicators:** Projects killed/pivoted BEFORE expensive mistakes, critical assumptions validated before commitment, teams can articulate top 3 risks, fewer "how did we miss this?" post-mortems.

**Failure indicators:** Every idea gets killed (misused as pessimism), analysis paralysis, teams feel attacked, validation experiments never run, recommendations ignored.

## Further Reading

- **references/pre-mortem-detailed.md** - Full Phase 1 guidance with failure mode catalogs
- **references/assumption-mapping-detailed.md** - Phases 2-3 with adversarial testing protocols
- **references/risk-framework.md** - Phases 4-5 with IF-THEN templates and early warning systems
- **references/examples.md** - Complete worked examples including AI backlog prioritization case
