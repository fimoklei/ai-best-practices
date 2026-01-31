# Pre-Mortem Analysis - Detailed Guide

## Setup the Temporal Inversion

"We are now [6 months / 1 year / appropriate timeframe] in the future. The [product/feature/strategy/initiative] you proposed has failed spectacularly. Not just underperformed - it was a complete, embarrassing disaster. The failure was so bad that [appropriate consequence: customers left, budget was wasted, team morale collapsed, market opportunity was lost]."

## Generate Failure Scenarios Across Categories

### 1. Market Failure Modes
- Wrong target audience identified
- No actual demand for the solution
- Existing solutions already good enough
- Market timing was wrong (too early or too late)
- Competitors responded faster/better
- Economic conditions shifted
- Regulatory environment changed
- Customer expectations misunderstood
- Value proposition unclear or uncompelling
- Switching costs too high for customers

### 2. Technical Failure Modes
- Cannot build at required scale
- Technical assumptions proved false
- Integration complexity underestimated
- Security vulnerabilities exposed
- Performance requirements unachievable
- Technology became obsolete during development
- Platform dependencies failed
- Data migration impossible
- Legacy system constraints insurmountable
- API limitations not discovered until late

### 3. Resource Failure Modes
- Budget exhausted before completion
- Required talent unavailable or left
- Team burned out from overcommitment
- Dependencies on other teams failed
- Timeline estimates wildly optimistic
- Opportunity cost of other projects too high
- Key person risk realized (someone left)
- Training requirements underestimated
- Support costs exceeded projections
- Infrastructure costs spiraled

### 4. Execution Failure Modes
- Scope creep destroyed focus
- Communication breakdowns between teams
- Stakeholder alignment never achieved
- Change management failed
- Training/onboarding inadequate
- Launch execution bungled
- Post-launch support insufficient
- Internal resistance killed adoption
- Documentation never completed
- Rollback plan inadequate when needed

### 5. External Failure Modes
- Organizational priorities shifted
- Leadership changed direction
- Partner/vendor relationships collapsed
- Compliance requirements emerged
- Public perception turned negative
- Macro trends moved against solution
- Natural disaster / pandemic impact
- Supply chain disruption
- Currency fluctuation impact
- Political/policy changes

## Analysis Framework

For each failure mode identified, assess:

### Likelihood (1-5 scale)
1. Very unlikely (<10% chance)
2. Unlikely (10-30% chance)
3. Possible (30-50% chance)
4. Likely (50-70% chance)
5. Very likely (>70% chance)

### Impact (1-5 scale)
1. Negligible - Minor inconvenience, easily recovered
2. Low - Some disruption, manageable impact
3. Moderate - Significant disruption, requires effort to recover
4. High - Major damage, difficult to recover
5. Critical - Catastrophic, possibly fatal to project/company

### Evidence Level
- **None**: Pure speculation, no supporting data
- **Anecdotal**: Heard from someone, single data point
- **Limited**: Small sample or indirect evidence
- **Moderate**: Some research or multiple data points
- **Strong**: Validated research, multiple sources, direct evidence

### Early Warning Signals
What metrics or indicators would show this failure mode is beginning to materialize?

Examples:
- Market failure: User engagement drops, conversion rates decline, competitor mentions increase
- Technical failure: Performance degrades, error rates increase, deployment times lengthen
- Resource failure: Team velocity decreases, bug count increases, turnover signals
- Execution failure: Meeting attendance drops, deadline slippage increases, communication frequency decreases

## Conducting the Session

**Duration:** 30-45 minutes

**Participants:** Project team, key stakeholders, cross-functional perspectives

**Process:**
1. Set the scene (5 min): Explain temporal inversion, establish psychological safety
2. Individual ideation (10 min): Each person writes failure modes independently
3. Round-robin sharing (15 min): Each person shares unique failures, document all
4. Rating & discussion (15 min): Group rates likelihood, impact, evidence for top failures

**Facilitation Tips:**
- Use dramatic language ("spectacular failure," "complete disaster")
- Emphasize "no judgment" - criticism is collaborative
- Capture everything, filter later
- Look for patterns across failure modes
- Ask "What else?" multiple times to go deeper
