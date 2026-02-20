# Skills

A catalog of reusable skills and mental models for AI work, organized by category.

## Table of contents

- [General skills](#general-skills)
- [Agentic skills](#agentic-skills)
- [Backend skills](#backend-skills)
- [Documentation skills](#documentation-skills)
- [Frontend skills](#frontend-skills)
- [Meta skills](#meta-skills)
- [Product management skills](#product-management-skills)
- [Testing skills](#testing-skills)
- [Security skills](#security-skills)

## General skills


| Name           | Purpose                              | When to use                              | Link                                     |
| ---------------- | -------------------------------------- | ------------------------------------------ | ------------------------------------------ |
| Skills website | Browse and discover skills resources | When browsing skills outside the repo | [https://skills.sh/](https://skills.sh/) |

## Agentic skills


| Name               | Purpose                                                            | When to use                                               | Link                                                                       |
| -------------------- | -------------------------------------------------------------------- | ----------------------------------------------------------- | ---------------------------------------------------------------------------- |
| Session summarizer | Captures session knowledge as a structured summary for future reference | After or during a coding session | [./agentic-skills/session-summarizer](./agentic-skills/session-summarizer) |
| Skill creator      | Formalize repeatable practices into skills                         | When you want a reusable workflow                         | [./agentic-skills/skill-creator](./agentic-skills/skill-creator)           |
| Karpathy guidelines | Behavioral guardrails to reduce LLM coding mistakes (think first, keep it simple, surgical diffs, goal-driven). | When writing, reviewing, or refactoring code | [./agentic-skills/karpathy-guidelines](./agentic-skills/karpathy-guidelines) |

## Backend skills


| Name             | Purpose                                                                                          | When to use                            | Link                                                                   |
| ------------------ | -------------------------------------------------------------------------------------------------- | ---------------------------------------- | ------------------------------------------------------------------------ |
| Backend Patterns | Backend architecture patterns, API design, database optimization, and server-side best practices | When building scalable backend systems | [./backend-skills/backend-patterns](./backend-skills/backend-patterns) |

## Documentation skills

| Name | Purpose | When to use | Link |
| --- | --- | --- | --- |
| Optimize docs | Condense markdown documentation for token efficiency while preserving all semantic meaning | When rules, documentation, or config files need a size reduction pass (targets 25–40%) | [./documentation-skills/optimize-docs](./documentation-skills/optimize-docs) |
| Writing clearly and concisely | Applies Strunk's rules to produce cleaner documentation, commit messages, error messages, and UI text | When writing documentation, commit messages, error messages, UI copy, reports, or any explanation for humans | [./documentation-skills/writing-clearly-and-concisely](./documentation-skills/writing-clearly-and-concisely) |

## Frontend skills


| Name                        | Purpose                                                                                          | When to use                                                                                       | Link                                                                                           |
| ----------------------------- | -------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------ |
| Agentation                  | Add Agentation visual feedback toolbar to a Next.js project                                      | When you need visual feedback on AI tool actions during front-end dev                             | [./frontend-skills/agentation](./frontend-skills/agentation)                                   |
| Frontend Design             | Create distinctive, production-grade frontend interfaces with high design quality                | When building web components, pages, artifacts, posters, or applications                          | [./frontend-skills/frontend-design](./frontend-skills/frontend-design)                         |
| Frontend Patterns           | Frontend development patterns for React, Next.js, state management, and performance optimization | When you want a reference for React/Next.js patterns, not just any frontend project              | [./frontend-skills/frontend-patterns](./frontend-skills/frontend-patterns)                     |
| Interface Design            | Craft-driven interface design for dashboards, admin panels, SaaS apps, and data-heavy tools      | When designing app interfaces that need to go beyond generic templates                            | [./frontend-skills/interface-design](./frontend-skills/interface-design)                       |
| UI/UX Pro Max               | UI/UX design intelligence with 50 styles, 21 palettes, 50 font pairings, 20 charts               | When designing UI components, choosing color palettes, reviewing UX code, or building interfaces  | [./frontend-skills/ui-ux-pro-max](./frontend-skills/ui-ux-pro-max)                             |
| Vercel React Best Practices | React and Next.js performance optimization guidelines from Vercel Engineering                    | When writing, reviewing, or refactoring React/Next.js code to ensure optimal performance patterns | [./frontend-skills/vercel-react-best-practices](./frontend-skills/vercel-react-best-practices) |

## Meta skills


| Name                           | Purpose                                                                                                                    | When to use                                                                                                  | Link                                                                                         |
| -------------------------------- | ---------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------- |
| Collision-Zone Thinking        | Force unrelated concepts together to discover emergent properties                                                          | When conventional approaches feel inadequate and you need breakthrough innovation                            | [./meta-skills/collision-zone-thinking](./meta-skills/collision-zone-thinking)               |
| Idea challenger                | Pressure-test new ideas and assumptions                                                                                    | Before committing to a new initiative                                                                        | [./meta-skills/idea-challenger](./meta-skills/idea-challenger)                               |
| Inversion exercise             | Flip assumptions to reveal constraints                                                                                     | When problem framing feels stuck                                                                             | [./meta-skills/inversion-exercise](./meta-skills/inversion-exercise)                         |
| Meta-pattern recognition       | Identify recurring patterns across domains                                                                                 | When you notice the same problem pattern recurring in 3+ different contexts                                  | [./meta-skills/meta-pattern-recognition](./meta-skills/meta-pattern-recognition)             |
| Root cause tracing             | Trace issues back to the original trigger                                                                                  | When debugging failures or regressions                                                                       | [./meta-skills/root-cause-tracing](./meta-skills/root-cause-tracing)                         |
| Scale game                     | Stress-test ideas at extreme scales                                                                                        | When validating robustness                                                                                   | [./meta-skills/scale-game](./meta-skills/scale-game)                                         |
| Simplification cascades        | Find one insight that removes components                                                                                   | When reducing complexity                                                                                     | [./meta-skills/simplification-cascades](./meta-skills/simplification-cascades)               |
| The challenger                 | Red-team product bets for failure modes                                                                                    | Before major investments or launches                                                                         | [./meta-skills/the-challenger](./meta-skills/the-challenger)                                 |
| Verification before completion | Validate results before declaring done                                                                                     | Before handing off or shipping                                                                               | [./meta-skills/verification-before-completion](./meta-skills/verification-before-completion) |
| When stuck                     | Pick a clear next troubleshooting move                                                                                     | When progress stalls or errors persist                                                                       | [./meta-skills/when-stuck](./meta-skills/when-stuck)                                         |
| Writing clearly and concisely  | Applies Strunk's rules to produce cleaner documentation, commit messages, error messages, and UI text | When writing documentation, commit messages, error messages, UI copy, reports, or any explanation for humans | [./documentation-skills/writing-clearly-and-concisely](./documentation-skills/writing-clearly-and-concisely)   |

## Product management skills

### Common PM Workflows

Use these as default sequences. Skip or loop steps as needed based on the decision risk.

| # | When to use | Workflow steps (skills) | Outcome | Example |
|---|-------------|--------------------------|---------|---------|
| 1 | **Extract and refine job stories** | 1. **JTBD Analyzer** → Define job, context, success signal<br>2. **First Principles Decomposer** → Strip to the root need<br>3. **Inversion Strategist** → List anti-goals and failure triggers<br>4. **Cross-Pollination Engine** → Pull 2–3 analogs with proven patterns<br>5. **Pre-Mortem Analyst** → Rank top risks and mitigations | Job story + success metric + risk list | **Prompt:** “We have [user type] dropping after week one—what job are they really hiring us for?”<br>**Skill output:** JTBD defines the job + context, First Principles isolates the root need, Inversion lists failure triggers, Cross-Pollination proposes analog patterns, Pre-Mortem ranks the top adoption risks. |
| 2 | **Validate a new product concept** | 1. **JTBD Analyzer** → Map motivations + alternatives<br>2. **First Principles Decomposer** → Identify the irreducible value<br>3. **Cross-Pollination Engine** → Find adjacent market patterns<br>4. **Inversion Strategist** → Define what would kill adoption<br>5. **Pre-Mortem Analyst** → Simulate launch failure paths | Concept narrative + must-win assumptions | **Prompt:** “Stress-test this [product/feature] idea before we build.”<br>**Skill output:** JTBD maps motivations + alternatives, First Principles reduces to the core value, Cross-Pollination pulls analog patterns, Inversion lists adoption killers, Pre-Mortem summarizes failure scenarios. |
| 3 | **Troubleshoot declining metrics** | 1. **First Principles Decomposer** → Break metric into drivers<br>2. **JTBD Analyzer** → Check if the user job shifted<br>3. **Six Thinking Hats** → Generate and score hypotheses<br>4. **Inversion Strategist** → Identify accelerants of decline<br>5. **Pre-Mortem Analyst** → Test if fixes could backfire | Prioritized hypotheses + safe experiments | **Prompt:** “[Metric] is down [X%]—find the root cause.”<br>**Skill output:** First Principles breaks the metric into drivers, JTBD tests job shifts, Hats ranks hypotheses, Inversion lists accelerants, Pre-Mortem flags fixes with backfire risk. |
| 4 | **Design complex feature rollout** | 1. **JTBD Analyzer** → Map segments + jobs per segment<br>2. **First Principles Decomposer** → Define minimum viable capability<br>3. **Inversion Strategist** → Enumerate segment-specific failure modes<br>4. **Six Thinking Hats** → Align stakeholder constraints<br>5. **Pre-Mortem Analyst** → Stress-test migration and adoption | Rollout plan + migration safeguards | **Prompt:** “We need a safe rollout plan for [complex feature].”<br>**Skill output:** JTBD maps segment jobs, First Principles defines MVP scope, Inversion lists segment failure modes, Hats align stakeholder constraints, Pre-Mortem highlights migration risks. |
| 5 | **Pivot or persevere decision** | 1. **JTBD Analyzer** → Revalidate core job and fit<br>2. **First Principles Decomposer** → Separate broken vs intact assumptions<br>3. **Inversion Strategist** → Check pivot downside risks<br>4. **Cross-Pollination Engine** → Find proven pivot patterns<br>5. **Pre-Mortem Analyst** → Run both-path failure scenarios | Decision memo + risk tradeoffs | **Prompt:** “Should we pivot from [current market] to [new market]?”<br>**Skill output:** JTBD contrasts jobs, First Principles separates intact vs broken assumptions, Inversion lists pivot downside risks, Cross-Pollination pulls pivot patterns, Pre-Mortem compares both-path failures. |
| 6 | **Optimize user onboarding** | 1. **JTBD Analyzer** → Define success moment + first job<br>2. **First Principles Decomposer** → Remove non-essential steps<br>3. **Inversion Strategist** → Identify immediate churn triggers<br>4. **Cross-Pollination Engine** → Borrow proven onboarding patterns<br>5. **Pre-Mortem Analyst** → Validate long-term retention impact | Shortened onboarding + churn guardrails | **Prompt:** “Onboarding completion is [X%]—what should we cut?”<br>**Skill output:** JTBD defines success moment, First Principles removes non-essentials, Inversion identifies churn triggers, Cross-Pollination suggests onboarding patterns, Pre-Mortem checks long-term retention risk. |
| 7 | **Prepare competitive response** | 1. **JTBD Analyzer** → Understand why customers switch<br>2. **First Principles Decomposer** → Separate differentiation from noise<br>3. **Inversion Strategist** → Map response backfire risks<br>4. **Cross-Pollination Engine** → Study competitive responses elsewhere<br>5. **Pre-Mortem Analyst** → Test if response creates new liabilities | Response thesis + safe rollout plan | **Prompt:** “Competitor launched [feature]—how do we respond safely?”<br>**Skill output:** JTBD clarifies switch reasons, First Principles isolates true differentiation, Inversion maps backfire risks, Cross-Pollination pulls response playbooks, Pre-Mortem tests liabilities. |
| 8 | **Revitalize a legacy product** | 1. **JTBD Analyzer** → Reconfirm original job vs current needs<br>2. **First Principles Decomposer** → Separate core value from cruft<br>3. **Inversion Strategist** → Identify modern rejection triggers<br>4. **Cross-Pollination Engine** → Pull modernization patterns<br>5. **Pre-Mortem Analyst** → Test power-user backlash | Modernization roadmap + safeguard plan | **Prompt:** “Modernize [legacy product] without breaking power users.”<br>**Skill output:** JTBD confirms core job, First Principles separates core from cruft, Inversion lists rejection triggers, Cross-Pollination pulls modernization patterns, Pre-Mortem tests backlash scenarios. |

### Individual Skills

| Name                        | Purpose                                                                                  | When to use                                                               | Link                                                                                                           |
| ----------------------------- | ----------------------------------------------------------------------------------------- | --------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------- |
| JTBD Analyzer               | Uncover the real "job" customers hire your product to do, beyond features to motivations | When understanding customer motivation                                      | [./productmanagement-skills/jtbd-analyzer](./productmanagement-skills/jtbd-analyzer)                           |
| First Principles Decomposer | Break any problem down to fundamental truths, then rebuild solutions from atoms up        | When you need to challenge assumptions or rebuild a solution from scratch  | [./productmanagement-skills/first-principles-decomposer](./productmanagement-skills/first-principles-decomposer) |
| Inversion Strategist        | Flip problems upside down - instead of "how to succeed", ask "how to definitely fail"      | When you want to avoid failure by identifying what guarantees it            | [./productmanagement-skills/inversion-strategist](./productmanagement-skills/inversion-strategist)             |
| Cross-Pollination Engine    | Systematically borrow ideas from unrelated industries to solve problems                   | When you want inspiration from adjacent fields to solve a current problem  | [./productmanagement-skills/cross-pollination-engine](./productmanagement-skills/cross-pollination-engine)    |
| Pre-Mortem Analyst          | Imagine the project already failed, then work backward to find why                        | Before launching projects or when assessing risk                           | [./productmanagement-skills/pre-mortem-analyst](./productmanagement-skills/pre-mortem-analyst)                 |

## Testing skills

| Name               | Purpose                                                                               | When to use                                                                                                                    | Link                                                                         |
| ------------------ | ------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------ | ---------------------------------------------------------------------------- |
| Six Thinking Hats  | Apply Edward de Bono's Six Thinking Hats methodology for comprehensive quality analysis | When designing test strategies, conducting test retrospectives, analyzing test failures, or facilitating testing discussions | [./testing-skills/six-thinking-hats](./testing-skills/six-thinking-hats)     |

## Security skills


| Name             | Purpose                                     | When to use                                             | Link                                                                     |
| ------------------ | --------------------------------------------- | --------------------------------------------------------- | -------------------------------------------------------------------------- |
| Defense-in-depth | Add checks at each layer to prevent defects | When workflows have multiple handoffs or failure points | [./security-skills/defense-in-depth](./security-skills/defense-in-depth) |
| Security Threat Model | Repository-grounded threat modeling with enumerated trust boundaries, abuse paths, and mitigations | When explicitly asked to threat model a codebase, enumerate threats/abuse paths, or perform AppSec threat modeling | [./security-skills/security-threat-model](./security-skills/security-threat-model) |
