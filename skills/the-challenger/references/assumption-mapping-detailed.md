# Assumption Mapping & Adversarial Testing - Detailed Guide

## Phase 2: Assumption Extraction

### Four Types of Assumptions

#### 1. Desirability Assumptions (Do they want this?)
Questions to uncover:
- Who are the target customers for our solution?
- What problem do our customers want to solve?
- How do our customers solve this problem today?
- Why can't our customers solve this problem today with existing solutions?
- What is the outcome our customers want to achieve?
- Why will our customers stop using their current solution?
- Will they pay for this solution / allocate budget to it?
- What switching costs will they accept?

#### 2. Feasibility Assumptions (Can we build this?)
Questions to uncover:
- Do we have the technical capability to build this?
- Can we deliver at the required scale?
- Do we have the right team skills?
- Can we integrate with existing systems?
- Are the technologies mature enough?
- Can we maintain/support this long-term?
- What are the technical dependencies?
- Are there hidden complexity risks?

#### 3. Viability Assumptions (Should we do this?)
Questions to uncover:
- Is the market large enough to justify investment?
- Can we acquire customers profitably?
- What are the unit economics?
- Does this align with our strategy?
- Do we have distribution channels?
- Can we defend against competition?
- What's the revenue model?
- What's the path to profitability?

#### 4. Adaptability Assumptions (Can this survive change?)
Questions to uncover:
- Will this work if market conditions shift?
- Can we pivot if assumptions prove false?
- Is this resilient to regulatory change?
- Will this scale beyond initial market?
- Can we maintain competitive advantage?
- How easily can we iterate?
- What's our exit strategy if wrong?

## Creating the Assumption Map

### The Two Axes

**Y-axis: Importance (How critical to success?)**
1. Nice to have - Would improve but not critical
2. Helpful - Significant benefit if true
3. Important - Major impact on success
4. Very important - Core to value proposition
5. Critical - Absolute requirement for success

**X-axis: Evidence (How confident are we?)**
1. None - Pure assumption, no data
2. Weak - Anecdotal or single source
3. Moderate - Some research or analysis
4. Strong - Multiple validated sources
5. Validated - Proven through experiment/data

### The Four Quadrants

```
        High Importance
             │
    Known    │    Unknown
─────────────┼─────────────
 Top Left    │  Top Right
 Important + │  Important +
 Known       │  Unknown
             │  DANGER ZONE
─────────────┼─────────────
 Bottom Left │  Bottom Right
 Unimportant │  Unimportant
 + Known     │  + Unknown
    Low      │
 Importance  │
```

**Top Right (DANGER ZONE): Test immediately**
These are your highest-risk assumptions. They're critical to success but you have little evidence. These MUST be validated before proceeding.

**Top Left: Verify these are in your plan**
Important assumptions with strong evidence. Make sure your plan actually accounts for these validated truths.

**Bottom Right: Park for later exploration**
Low importance but unknown. These might reveal future opportunities. Test them after danger zone is clear.

**Bottom Left: Defer/ignore**
Low importance and already known. Don't spend time here.

## Phase 3: Adversarial Assumption Testing

For each DANGER ZONE assumption, apply all four tests:

### Test 1: The Opposition Test

**Question:** "If the OPPOSITE of this assumption is true, does it have significant bearing on the outcome?"

**Example:**
Assumption: "Product teams struggle with backlog prioritization"
Opposition: "Product teams have effective prioritization methods"
Impact if opposite is true: Core value proposition collapses - YES, significant bearing
→ Keep in danger zone

**Decision:**
- If NO impact → Assumption isn't actually critical, downgrade importance
- If YES, major impact → Keep in danger zone, requires validation

### Test 2: "What Would Have to Be True" Test

**Question:** For this assumption to be valid, what conditions must exist?

**Process:**
1. Break the assumption into sub-assumptions
2. Identify which sub-assumptions are independently testable
3. Determine if any sub-assumptions are already falsified
4. Find the cheapest sub-assumption to test first

**Example:**
Assumption: "Enterprise customers will pay $50K/year for our solution"

Sub-assumptions:
- Enterprises have budget allocated for this category
- Current solutions cost less than $50K
- Our solution provides >$50K in value
- Procurement process allows new vendor onboarding
- Decision makers have authority at this price point
- Contract cycles align with our timeline

Test the cheapest/easiest sub-assumption first (e.g., budget allocation through sales calls).

### Test 3: Evidence Audit

**Questions:**
- What evidence do we currently have for this assumption?
- What is the source of this evidence?
  - Data/research
  - Expert opinion
  - Analogy to similar cases
  - Pure intuition/theory
- How reliable is this evidence?
- What would constitute STRONG evidence?
- How can we obtain that evidence cheaply and quickly?

**Evidence Quality Hierarchy:**
1. Validated experiment (did it with real users)
2. Direct research (asked real users)
3. Market data (found patterns in data)
4. Expert opinion (asked someone knowledgeable)
5. Analogy (similar thing worked elsewhere)
6. Theory (logical reasoning)
7. Intuition (feels right)

### Test 4: Falsification Test

**Question:** What data or outcome would PROVE this assumption wrong?

**Purpose:** Design experiments to test assumptions by looking for evidence that would disprove them, not just confirm them.

**Example:**
Assumption: "Users want AI-powered recommendations"

Falsification criteria:
- If <30% of users engage with AI recommendations in first week
- If users actively disable AI feature
- If user satisfaction scores are lower with AI than without
- If support tickets mention "too much AI" or "don't trust AI"

**Then design experiment:** Build Wizard of Oz prototype (humans pretending to be AI) and measure these criteria with 20 beta users.

## Validation Experiment Design

For each danger-zone assumption, define:

### Hypothesis
"We believe [assumption]. We will know we're right when we see [measurable outcome]."

### Experiment Type
- **Customer interviews:** Talk to 10-20 target users
- **Landing page test:** Drive traffic, measure conversion
- **Wizard of Oz:** Manually deliver service presented as automated
- **Concierge MVP:** Manually deliver service presented as manual
- **Prototype test:** Build enough to demonstrate concept
- **Pre-sales:** Try to sell before building
- **Smoke test:** Advertise non-existent feature, measure interest

### Success Criteria
- What specific metric indicates validation?
- What's the threshold for success?
- What's the threshold for failure?
- What's the gray zone requiring more testing?

### Cost & Timeline
- How much will this cost (time, money, opportunity cost)?
- How long will it take?
- Who needs to be involved?

### Example

**Assumption:** "Product managers will trust AI for prioritization recommendations"

**Hypothesis:** "We believe PMs will trust AI recommendations. We'll know we're right when 50%+ of PMs accept at least 3 AI suggestions in their first week of use."

**Experiment:** Wizard of Oz - Human analyst creates prioritization recommendations, presents them as "AI-generated" to 20 PMs. Measure acceptance rate and gather qualitative feedback.

**Success Criteria:**
- SUCCESS: >50% acceptance rate + positive trust feedback
- GRAY: 30-50% acceptance rate → Redesign trust/transparency features
- FAILURE: <30% acceptance rate → Pivot to assistant model or kill

**Cost & Timeline:** 2 weeks, $0 (use internal resources)

## Decision Framework After Testing

Based on validation results:

**GREEN (Proceed):**
- Assumption validated with strong evidence
- Success criteria clearly met
- Team confident in results

**YELLOW (More Testing Needed):**
- Results in gray zone
- Need larger sample or different approach
- Some evidence but not conclusive

**RED (Pivot or Kill):**
- Assumption falsified
- Clear failure against success criteria
- No viable path to validation
