# Complete Worked Examples

## Example 1: AI-Powered Backlog Prioritization Tool

### The Proposal

"Build an AI-powered tool that automatically prioritizes product backlog items for product teams, using machine learning to analyze ticket data and recommend the optimal sequence of work."

### Phase 1: Pre-Mortem Analysis

**Setup:** "It's 6 months from now. The AI backlog tool failed completely and has been shut down. Why?"

**Failure Modes Identified:**

| Category | Failure Scenario | L | I | Evidence | Early Warning |
|----------|------------------|---|---|----------|---------------|
| Market | PMs don't trust AI with strategic decisions | 4 | 5 | None | Low engagement in trials |
| Market | Only mid-stage companies have backlog chaos, market smaller than thought | 3 | 4 | Limited | Low conversion from specific segments |
| Technical | Can't parse unstructured ticket data with >90% accuracy | 3 | 5 | None | Low accuracy in beta |
| Technical | Integration with Jira/Linear/Asana too complex | 3 | 4 | None | Long integration time |
| Execution | Jira/Linear shipped native AI prioritization feature | 2 | 5 | None | Competitor announcements |
| Resource | Team burned out trying to support 10+ integrations | 3 | 3 | None | Velocity decline |
| Viability | Can't achieve <$2K CAC in crowded market | 3 | 4 | None | High CAC in early campaigns |

**Top 3 Failure Modes:**
1. PMs don't trust AI decisions (L:4, I:5) - Zero evidence
2. Can't parse unstructured data accurately (L:3, I:5) - Zero evidence  
3. Market timing: competitors ship this first (L:2, I:5) - Some monitoring possible

### Phase 2: Assumption Extraction

**Desirability Assumptions:**
- Product teams struggle significantly with backlog prioritization (Importance: 5, Evidence: 2)
- PMs will trust AI recommendations for strategic decisions (Importance: 5, Evidence: 1)
- Teams want automation vs. assistance (Importance: 4, Evidence: 1)
- Current solutions (spreadsheets, gut feel) are painful enough to warrant switching (Importance: 4, Evidence: 2)

**Feasibility Assumptions:**
- We can parse unstructured ticket text with 90%+ accuracy (Importance: 4, Evidence: 2)
- Integration with major tools (Jira, Linear, Asana) is achievable in 3 months (Importance: 4, Evidence: 2)
- ML model can learn from limited training data (Importance: 4, Evidence: 3)

**Viability Assumptions:**
- Addressable market is 50K+ product teams (Importance: 4, Evidence: 2)
- Teams will pay $99/seat/month for prioritization tool (Importance: 5, Evidence: 1)
- We can achieve <$2K CAC in this category (Importance: 4, Evidence: 1)
- Sales cycle is <2 months (Importance: 3, Evidence: 1)

**Adaptability Assumptions:**
- Jira/Linear won't ship this natively in next 12 months (Importance: 3, Evidence: 2)
- AI regulation won't prohibit automated decision-making in product management (Importance: 3, Evidence: 3)

### Phase 3: Assumption Mapping

```
        High Importance
             │
    Known    │    Unknown
─────────────┼─────────────
             │  DANGER ZONE:
             │  1. PMs trust AI (5,1)
             │  2. Pricing $99/mo (5,1)
             │  3. CAC <$2K (4,1)
    Low      │  4. Teams struggle (5,2)
 Importance  │  5. Parse accuracy (4,2)
             │
```

**Danger Zone (Must Validate First):**

1. **"PMs will trust AI recommendations"**
   - Importance: 5/5 (Core value prop)
   - Evidence: 1/5 (Zero evidence, pure assumption)
   
2. **"Teams will pay $99/seat/month"**
   - Importance: 5/5 (Business viability)
   - Evidence: 1/5 (No pricing research done)
   
3. **"Can achieve <$2K CAC"**
   - Importance: 4/5 (Unit economics)
   - Evidence: 1/5 (No go-to-market testing)

4. **"Product teams struggle with prioritization"**
   - Importance: 5/5 (Market existence)
   - Evidence: 2/5 (Anecdotal only)

5. **"90%+ parsing accuracy achievable"**
   - Importance: 4/5 (Technical feasibility)
   - Evidence: 2/5 (Similar tech exists, not tested for our use case)

### Phase 4: Adversarial Testing

#### Assumption 1: "PMs will trust AI recommendations"

**Opposition Test:**
If PMs DON'T trust AI → Core value proposition collapses → YES, critical

**What Would Have to Be True:**
- AI explains reasoning clearly
- Confidence levels shown
- PM can override easily
- AI learns from PM feedback
- Track record of accuracy established

**Evidence Audit:**
Current evidence: None (zero research, just assumption that "AI is hot")
Strong evidence would be: Beta users accepting >50% of recommendations

**Falsification Test:**
Would prove false if: <30% acceptance rate in user testing

**Validation Experiment:**
- **Type:** Wizard of Oz prototype
- **What:** Human analyst creates recommendations, presents as "AI" to 20 PMs
- **Measure:** Acceptance rate, qualitative trust feedback
- **Success:** >50% acceptance + positive feedback
- **Failure:** <30% acceptance
- **Cost:** 2 weeks, $0 (internal resources)

#### Assumption 2: "Teams will pay $99/seat/month"

**Opposition Test:**
If they won't pay $99 → Unit economics collapse → Business not viable

**What Would Have to Be True:**
- Value perception >$99/user/month
- Budget available in this category
- Procurement process allows new tools
- Pain point severe enough to justify cost

**Evidence Audit:**
Current: Zero pricing research
Strong evidence: 20+ LOIs (letters of intent) at $99 price point

**Falsification Test:**
Would prove false if: <10% of prospects say "yes" to pricing in discovery

**Validation Experiment:**
- **Type:** Pre-sales / Pricing interviews
- **What:** Show prototype to 30 prospects, ask willingness to pay at various price points
- **Measure:** % saying yes at $99, $149, $49
- **Success:** >60% say yes at $99
- **Failure:** <40% say yes at $99
- **Cost:** 3 weeks, $0 (founder sales calls)

### Phase 5: IF-THEN Risk Statements

**Statement 1:**
IF PMs don't trust AI recommendations (validated by <30% acceptance rate in testing),
THEN core value proposition fails,
REQUIRING pivot to "AI assistant" model (suggests vs. decides) within 2 weeks OR kill project

**Statement 2:**
IF teams won't pay $99/seat/month (validated by <40% positive response in pricing interviews),
THEN unit economics don't work at projected CAC,
REQUIRING either: (1) increase value to justify price, (2) reduce price to $49 and cut costs 50%, or (3) kill project

**Statement 3:**
IF parsing accuracy is <70% (vs. required 90%) in technical testing,
THEN core AI value proposition not viable,
REQUIRING either: (1) 6-month ML improvement effort, or (2) pivot to structured-data-only approach, or (3) kill project

**Statement 4:**
IF only 20% of PMs report prioritization as "very painful" (vs. assumed 60%+),
THEN addressable market is 3x smaller than projected,
REQUIRING pivot to broader PM tooling OR kill project within 2 months

**Statement 5:**
IF Jira announces native AI prioritization feature before our launch,
THEN first-mover advantage lost and competitive positioning undermined,
REQUIRING either: (1) acceleration to launch in 3 months, or (2) pivot to vertical-specific positioning (e.g., healthcare PM tools), or (3) kill project

### Phase 6: Go/No-Go Decision

## 🟡 YELLOW - Validate First

**Recommendation:** DO NOT proceed with full build

**Critical unvalidated assumptions in danger zone:**
1. PMs will trust AI (I:5, E:1) - ZERO evidence
2. Pricing at $99/mo viable (I:5, E:1) - ZERO evidence  
3. CAC <$2K achievable (I:4, E:1) - ZERO evidence

**Required Validation (Before Any Coding):**

**Week 1-2: Trust & Acceptance Testing**
- Build Wizard of Oz prototype (humans as AI)
- Test with 20 target PMs
- Measure acceptance rate + gather trust feedback
- **Cost:** $0, **Timeline:** 2 weeks

**Week 3-5: Pricing & Demand Validation**
- Conduct 30 problem/pricing discovery interviews
- Show prototype, ask willingness to pay at various price points
- Gather pain point severity data
- **Cost:** $0, **Timeline:** 3 weeks

**Week 6: Technical Feasibility Spike**
- Test parsing accuracy on sample of real ticket data
- Validate 90% accuracy is achievable
- **Cost:** 1 engineer-week, **Timeline:** 1 week

**Total Validation Investment:**
- **Time:** 6 weeks
- **Cost:** ~$5K (1 engineer-week)
- **vs. Full Build:** 6 months, 2 engineers = $200K+

**Decision Criteria After Validation:**

🟢 **GREEN (Proceed to Build):**
- Trust test: >50% acceptance rate
- Pricing test: >60% say yes at $99
- Tech test: >85% parsing accuracy
- Pain validation: >50% report as "very painful"

🟡 **YELLOW (Pivot & Retest):**
- Trust test: 30-50% acceptance → Redesign for transparency, retest
- Pricing test: 40-60% say yes → Adjust pricing or value prop
- Tech test: 70-85% accuracy → Additional ML work needed

🔴 **RED (Kill or Major Pivot):**
- Trust test: <30% acceptance → Core value prop invalid, kill or pivot to assistant model
- Pricing test: <40% say yes → Economics don't work, kill
- Tech test: <70% accuracy → Technical infeasibility, kill or pivot to structured data only

### Monitoring Plan (If Proceeding After Validation)

**Assumption 1 Monitoring: PM Trust**
- **Metric:** % of AI recommendations accepted by users
- **Frequency:** Weekly
- **Green:** >45%, **Yellow:** 30-45%, **Red:** <30%
- **Owner:** Product Lead
- **Action:** Red threshold triggers assistant model pivot discussion

**Assumption 2 Monitoring: Pricing**
- **Metric:** Trial-to-paid conversion rate
- **Frequency:** Weekly
- **Green:** >15%, **Yellow:** 10-15%, **Red:** <10%
- **Owner:** Sales Lead  
- **Action:** Red threshold triggers pricing review or value enhancement sprint

**Assumption 3 Monitoring: CAC**
- **Metric:** Customer acquisition cost from paid channels
- **Frequency:** Monthly
- **Green:** <$2K, **Yellow:** $2-3K, **Red:** >$3K
- **Owner:** Marketing Lead
- **Action:** Red threshold triggers channel strategy review or price increase discussion

## Key Insights from This Example

1. **6 weeks of validation prevents 6 months of waste:** Total validation cost is <3% of full build cost
2. **Multiple critical assumptions had ZERO evidence:** Would have built on pure speculation
3. **Trust assumption is most critical:** Can't be validated through surveys, requires behavioral testing
4. **Cheap experiments exist for every assumption:** Wizard of Oz, interviews, technical spikes
5. **Clear decision criteria prevent bias:** Know exactly what success/failure looks like before testing

---

## Example 2: EU Data Act Compliance Feature

### The Proposal

"Build comprehensive EU Data Act data export capability into our B2B SaaS platform to enable customers to comply with new regulations."

### Abbreviated Analysis

**Top Failure Modes:**
- Technical complexity underestimated (L:4, I:4)
- Timeline too aggressive for compliance depth required (L:4, I:5)
- Customers don't prioritize compliance until enforced (L:3, I:4)

**Danger Zone Assumptions:**
1. Can implement within 3 months (I:5, E:2)
2. Customers will upgrade for compliance (I:4, E:2)
3. Current architecture supports required data export (I:5, E:2)

**Key IF-THEN Statement:**
IF implementation takes >4 months (vs. planned 3),
THEN Q3 launch deadline missed and competitive advantage lost,
REQUIRING either: (1) manual export process as stopgap, or (2) delay go-to-market to Q4

**Validation Experiment:**
- 2-week technical spike on architecture feasibility
- 20 customer interviews on compliance urgency and willingness to pay
- Cost: $8K (2 engineer-weeks)
- vs. Full build: 6 months, 3 engineers = $300K

**Outcome:**
🟡 YELLOW - Technical spike revealed 5-month timeline needed, manual process implemented as interim solution
