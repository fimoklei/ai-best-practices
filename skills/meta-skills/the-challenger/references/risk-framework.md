# Risk Framework - IF-THEN Statements & Early Warning Systems

## Phase 4: IF-THEN Risk Statements

Convert each critical assumption into concrete, actionable risk statements.

### Statement Template

```
IF [specific assumption] proves false,
THEN [specific measurable consequence] occurs,
REQUIRING [specific contingency action] within [timeframe]
```

### Writing Guidelines

**Be Specific:**
❌ Bad: "IF customers don't like it, THEN we'll have problems"
✅ Good: "IF trial-to-paid conversion rate is <15%, THEN unit economics don't work, REQUIRING price increase to $99/mo or cost reduction of 40% within Q2"

**Make Consequences Measurable:**
❌ Bad: "THEN the product will fail"
✅ Good: "THEN revenue will be <$500K/year (below break-even)"

**Define Clear Contingencies:**
❌ Bad: "REQUIRING us to pivot"
✅ Good: "REQUIRING either: (1) pivot to enterprise segment with $50K ACV, or (2) kill product by end of Q3"

### Examples by Category

#### Desirability Risk Statements

```
IF <20% of target users report backlog prioritization as "very painful" (vs. our assumption of >60%),
THEN addressable market is 3x smaller than projected,
REQUIRING pivot to broader project management tooling or kill project within 2 months
```

```
IF Net Promoter Score is <20 after 90 days (vs. target of >40),
THEN product-market fit has not been achieved,
REQUIRING major feature pivot or market repositioning within Q2
```

#### Feasibility Risk Statements

```
IF parsing accuracy for unstructured ticket data is <70% (vs. required 90%),
THEN core AI value proposition is not viable,
REQUIRING either: (1) pivot to structured-data-only approach, or (2) 6-month ML model improvement effort
```

```
IF EU Data Act export API integration takes >4 months (vs. planned 2 months),
THEN Q3 launch deadline is missed,
REQUIRING delaying go-to-market OR launching with manual export process
```

#### Viability Risk Statements

```
IF Customer Acquisition Cost exceeds $5,000 (vs. budgeted $2,000),
THEN payback period is >3 years (unviable),
REQUIRING either: (1) pivot to product-led growth model, or (2) increase ACV to $30K minimum
```

```
IF <30 enterprise customers sign letters of intent during beta (vs. target of 50),
THEN demand validation has failed,
REQUIRING pivot to mid-market segment or kill project by end of Q1
```

#### Adaptability Risk Statements

```
IF primary competitor launches similar feature within 6 months,
THEN first-mover advantage is lost,
REQUIRING acceleration of roadmap differentiation features OR pivot to vertical-specific positioning
```

```
IF regulatory requirements change to mandate on-premise deployment,
THEN cloud-native architecture becomes liability,
REQUIRING either: (1) 12-month re-architecture to hybrid model, or (2) exit regulated markets
```

## Phase 5: Early Warning System Design

For each critical assumption, establish monitoring framework.

### Leading Indicators

**Definition:** Metrics that predict whether an assumption is proving true/false BEFORE it's too late to act.

**Examples:**

For assumption: "Users will adopt AI recommendations"
- Leading indicators:
  - % of users who engage with AI panel in first session
  - Time spent reviewing AI recommendations
  - Click-through rate on "learn more about AI"
  - Support tickets mentioning AI feature
  
For assumption: "We can build this in 6 months"
- Leading indicators:
  - Sprint velocity trend
  - Story point estimation accuracy
  - Technical debt accumulation rate
  - Time to resolve blockers

### Monitoring Plan Template

```
**Assumption:** [State the assumption]

**Metric to Monitor:** [Specific measurable metric]

**Measurement Frequency:** [Daily/Weekly/Monthly]

**Data Source:** [Where does this data come from?]

**Owner:** [Who is responsible for monitoring?]

**Threshold - Green:** [Value indicating assumption is holding]
**Threshold - Yellow:** [Value indicating concern, requires attention]
**Threshold - Red:** [Value indicating assumption is false, trigger contingency]

**Review Cadence:** [How often to review in team meeting]

**Escalation Path:** [Who gets alerted if Yellow/Red threshold hit?]
```

### Example Monitoring Plans

#### Example 1: Market Demand Assumption

```
**Assumption:** Enterprise customers have $50K budget for this category

**Metric to Monitor:** Average budget mentioned in sales discovery calls

**Measurement Frequency:** Weekly (after each call)

**Data Source:** Salesforce opportunity notes

**Owner:** Sales Lead

**Threshold - Green:** Average budget >$45K mentioned by prospects
**Threshold - Yellow:** Average budget $30-45K (requires pricing pivot discussion)
**Threshold - Red:** Average budget <$30K (invalidates pricing model)

**Review Cadence:** Weekly sales/product sync

**Escalation Path:** Yellow → Product Lead notified, Red → Executive team emergency meeting
```

#### Example 2: Technical Feasibility Assumption

```
**Assumption:** API response time will be <100ms at scale

**Metric to Monitor:** 95th percentile API response time in staging

**Measurement Frequency:** Continuous (automated monitoring)

**Data Source:** Datadog APM

**Owner:** Engineering Lead

**Threshold - Green:** <100ms consistently
**Threshold - Yellow:** 100-200ms (requires optimization sprint)
**Threshold - Red:** >200ms (architectural re-design needed)

**Review Cadence:** Daily engineering standup

**Escalation Path:** Yellow → Optimization task created, Red → CTO and product team emergency meeting
```

### Dashboard Design

Create a simple visual dashboard that shows status of all critical assumptions:

```
Critical Assumptions Status Dashboard

┌────────────────────────────────────────────────┐
│ Assumption                          │ Status   │
├────────────────────────────────────────────────┤
│ Market demand (>60% pain point)     │ 🟢 Green │
│ Budget availability ($50K)          │ 🟡 Yellow│
│ AI accuracy (>90%)                  │ 🟢 Green │
│ Integration time (<3 months)        │ 🔴 Red   │
│ CAC (<$2K)                          │ 🟢 Green │
└────────────────────────────────────────────────┘

Actions Required:
🔴 Integration time: Exceeded 3 months, trigger contingency plan
🟡 Budget availability: Average $35K vs target $50K - pricing review scheduled
```

## Contingency Planning

For each RED or YELLOW-threshold critical assumption, define:

### Contingency Plan Template

```
**If assumption fails:**

**Plan A (Pivot):**
- What: [Specific alternative approach]
- Timeline: [How long to implement]
- Resources: [What's needed]
- Success criteria: [How to measure if pivot works]

**Plan B (Reduce Scope):**
- What: [Scaled-back version]
- Trade-offs: [What we sacrifice]
- Timeline: [How long to implement]

**Plan C (Kill):**
- Decision criteria: [At what point do we kill vs. pivot]
- Exit strategy: [How to wind down]
- Sunk cost cutoff: [Maximum investment before kill decision]
```

### Example Contingency Plan

```
**If assumption fails:** "PMs will trust AI recommendations" (validated by <30% acceptance rate)

**Plan A (Pivot to Assistant Model):**
- What: Reposition as "AI assistant" that suggests, not decides. PMs remain in control.
- Timeline: 2 weeks to redesign UI/UX, 1 week to update messaging
- Resources: Design + front-end engineer
- Success criteria: >50% acceptance rate with new positioning in 2-week re-test

**Plan B (Reduce Scope to Transparency Layer):**
- What: Focus on explaining existing prioritization, not recommending changes
- Trade-offs: Less differentiation, lower value proposition
- Timeline: 1 month to build transparency features

**Plan C (Kill Product):**
- Decision criteria: If Plan A fails AND Plan B shows <40% engagement
- Exit strategy: Notify beta customers by end of Q2, redirect team to adjacent opportunity
- Sunk cost cutoff: $150K engineering investment is maximum before kill
```

## Review Cadence

**Weekly:** Review all yellow/red assumptions
**Monthly:** Review entire assumption map, update evidence levels
**Quarterly:** Full re-assessment of all assumptions for strategic initiatives
