# Purpose

Guide the AI to generate a clear, actionable PRD in Markdown, suitable for junior developers, based on an initial feature prompt.

# Process

1. Receive a brief feature prompt from the user.
2. **Review existing BDD scenarios** in `/features` directory to understand current test coverage and identify reuse opportunities.
3. **Review existing unit tests** in `/tests` directory to understand current test coverage and identify reuse opportunities.
5. Ask clarifying questions to understand the problem, user, core actions, and acceptance criteria (focus on "what" and "why").
5. Generate a PRD using the structure below, integrating user answers and BDD assessment.
6. Save as `prd-[feature-name].md` in `/Planning/`.

# Clarifying Questions (adapt as needed)

- What problem does this feature solve? What is the main goal?
- Who is the primary user?
- What key actions should users be able to perform?
- Provide user stories (e.g., As a [user], I want to [do X] so that [benefit]).
- What are the acceptance criteria? (Use Gherkin: Given/When/Then for happy paths, edge cases, errors)
- What is out of scope (non-goals)?
- What data is required?
- Are there UI/design guidelines or mockups?
- Any technical constraints or dependencies?
- How will success be measured?
- Any open questions?

# PRD Structure

1. **Introduction/Overview:** What is the feature and its goal?
2. **Goals:** Specific, measurable objectives.
3. **Problem Statement:** What problem are we solving?
4. **Feature Classification & TDD Workflow:**
   **Instructions**: Assess the feature against the criteria below to determine the required development workflow.
   **Essential Feature Checklist (ALL must be true):**
   - [ ] **Direct User Workflow**: Is this a primary, user-facing workflow?
   - [ ] **Complex Business Logic**: Does it coordinate between multiple components/layers?
   - [ ] **High User Impact**: Would failure significantly degrade the user experience?
   - [ ] **Integration Complexity**: Does it touch the database, API, and UI?
   **Decision:**
   - [ ] **Essential Feature**: Follow the **Outer Loop (BDD)** and **Inner Loop (TDD)**. Start by writing a failing BDD (Cucumber) scenario.
   - [ ] **Non-Essential Feature**: Follow the **Inner Loop (TDD)** only. Start by writing a small, failing unit test (Vitest).
5. **User Stories:** Narratives describing usage and benefits.
6. **Functional Requirements:** Numbered list of what the feature must do.
7. **Acceptance Criteria:** Gherkin scenarios for each user story.
8. **Non-Goals:** What is explicitly out of scope.
9. **Design Considerations (optional):** UI/UX, mockups, style notes.
10. **Technical Considerations (optional):** Constraints, dependencies.
11. **Success Metrics:** How will success be measured?
12. **Open Questions:** Anything needing clarification.

# Audience

Write for junior developers: be explicit, avoid jargon, and ensure all requirements are testable and clear.

# Output

- **Format:** Markdown (`.md`)
- **Location:** `/Planning/`
- **Filename:** `prd-[feature-name].md`

# Final Instructions

- Do NOT implement the PRD.
- Always ask clarifying questions before generating the PRD.
- Use user answers to improve the PRD.