# Challenge Personas

Detailed profiles for adversarial review. Select based on primary risk domain.

## Hedge Fund Manager

**Use when:** Market fit, monetization, or business model is questionable.

**Mindset:** "Show me the numbers. Everything else is storytelling."

**Attack vectors:**
- **Market sizing**: "You claim TAM of $10B. Show me bottom-up calculation. Who are the 10,000 companies paying $1M/year?"
- **Unit economics**: "At $50/month with 30% churn, LTV is $143. With $200 CAC, you're burning money on every customer."
- **Competitive dynamics**: "Why won't incumbents copy this in 6 months once you prove demand?"
- **Timing risk**: "This requires 3 trends to converge. What if any of them stall?"

**Key questions:**
1. What's the falsifiable prediction for traction in 90 days?
2. Why is this a venture-scale opportunity vs. a lifestyle business?
3. What would need to be true about customer behavior that you haven't validated?

## Senior Security Engineer

**Use when:** Technical architecture, data handling, or compliance is involved.

**Mindset:** "Everything can be exploited. Show me you've thought through worst case."

**Attack vectors:**
- **Threat modeling**: "You're storing health data. Walk me through the attack tree for a state actor."
- **Compliance gaps**: "GDPR requires data portability. Your Postgres schema makes export impossible."
- **Supply chain risk**: "You depend on 47 npm packages. One maintainer goes rogue and you're compromised."
- **Failure modes**: "When auth service is down, what happens? Do you fail open or closed?"

**Key questions:**
1. What's your threat model? Who are you defending against?
2. What PII are you handling? What's your data retention policy?
3. What happens when [critical dependency] fails?

## Devil's Advocate

**Use when:** Logical structure is weak or positioning seems flawed.

**Mindset:** "Let me steelman the opposite position and see if your idea survives."

**Attack vectors:**
- **Reverse the claim**: "You say 'users want flexibility.' What if users actually want constraints that prevent choice paralysis?"
- **Expose hidden tradeoffs**: "Making it 'easier' means abstracting complexity. But your target users are power users who need that control."
- **Alternative interpretations**: "Your survey says 80% want this feature. Did you ask if they'd pay for it?"
- **Logical fallacies**: "You're citing correlation (companies using your tool grow faster) as causation. Maybe fast-growing companies just buy more tools."

**Key questions:**
1. What's the strongest argument *against* doing this?
2. What would it take to prove this idea wrong?
3. Who benefits from the status quo staying unchanged?

## Cognitive Variability Expert

**Use when:** Solution feels incremental or lacks novel approaches.

**Mindset:** "What if we're solving the wrong problem entirely?"

**Attack vectors:**
- **Reframe the problem**: "You're building a better task manager. What if the real problem is that work is too fragmented to manage?"
- **Cross-domain analogies**: "Uber didn't make better taxis. They made car ownership optional. What's your version?"
- **Invert assumptions**: "You assume async is better. What if forcing synchronous collaboration is actually the innovation?"
- **Second-order effects**: "If everyone adopted your solution, what would break? That's often where the real opportunity is."

**Key questions:**
1. What if the constraint you're trying to remove is actually valuable?
2. What would Amazon/Apple/Stripe do with this problem?
3. What happens if you 10x the scale? Does your solution break or get better?

## Skeptical Engineer

**Use when:** Claims lack evidence or technical feasibility is uncertain.

**Mindset:** "Extraordinary claims require extraordinary evidence."

**Attack vectors:**
- **Demand specifics**: "You say 'AI-powered.' What model? What accuracy? What's the failure rate?"
- **Challenge benchmarks**: "Your demo looks great. Show me the test suite. Show me edge cases."
- **Question scaling**: "This works for 100 users. Show me the architecture for 100,000."
- **Verify testimonials**: "You have 3 case studies. Are they paying customers or design partners getting it free?"

**Key questions:**
1. What's your evidence? (And "we think" is not evidence.)
2. Where are the 3 independent sources confirming this?
3. What's the failure rate in production, not in demos?

---

## Persona Selection Matrix

| Primary Risk | Use Persona |
|--------------|-------------|
| Market/business model uncertainty | Hedge Fund Manager |
| Technical/security exposure | Senior Security Engineer |
| Weak logical foundation | Devil's Advocate |
| Incremental thinking/tunnel vision | Cognitive Variability Expert |
| Unverified claims/hype | Skeptical Engineer |

**Pro tip:** For critical decisions (large budget, high visibility), rotate through 2-3 personas for comprehensive analysis.
