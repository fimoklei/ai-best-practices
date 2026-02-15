# Standards

Cross-cutting standards for AI work, organized by scope and context.

## Table of contents
- [Global standards](#global-standards)
- [Project rules](#project-rules)
- [Generic rules](#generic-rules)

## Global standards
| Name | Purpose | When to use | Link |
| --- | --- | --- | --- |
| Karpathy Coding Guidelines | Behavioral guardrails for Claude coding tasks | Apply to all coding work as baseline | [./global/karpathy-coding-guidelines.md](./global/karpathy-coding-guidelines.md) |
| TDD Enforcement | Enforce red-green-refactor discipline and coverage expectations | When writing or updating code with tests | [./global/tdd-enforcement.md](./global/tdd-enforcement.md) |
| Project Template | Template for project-level rules setup | When creating or refreshing project-specific standards | [./global/project-template.md](./global/project-template.md) |
| Global Template | Template for new global standard docs | When adding a new global standard | [./global/global-template.md](./global/global-template.md) |

## Project rules
| Category | Purpose | Files | Link |
| --- | --- | --- | --- |
| Backend | API, database, models, and query standards | 4 files | [./project_rules/backend/](./project_rules/backend/) |
| Frontend | Components, CSS, accessibility, and responsive design | 4 files | [./project_rules/frontend/](./project_rules/frontend/) |
| Testing | Testing principles, TDD workflow, and quality gates | 1 file | [./project_rules/testing/](./project_rules/testing/) |
| Workflow | Project organization and file layout | 1 file | [./project_rules/workflow/](./project_rules/workflow/) |

### Backend rules
| Name | Purpose | When to use | Link |
| --- | --- | --- | --- |
| API Standards | REST conventions, versioning, request/response format | When designing or implementing APIs | [./project_rules/backend/api.md](./project_rules/backend/api.md) |
| Database Migrations | Schema changes, zero-downtime deployments, safety | When modifying database schema | [./project_rules/backend/migrations.md](./project_rules/backend/migrations.md) |
| Data Models | Schema integrity, relationships, TypeScript types | When defining data structures | [./project_rules/backend/models.md](./project_rules/backend/models.md) |
| Database Queries | Security, performance, optimization patterns | When writing database operations | [./project_rules/backend/queries.md](./project_rules/backend/queries.md) |

### Frontend rules
| Name | Purpose | When to use | Link |
| --- | --- | --- | --- |
| Accessibility | Semantic HTML, ARIA, focus management, motion | When building accessible UI components | [./project_rules/frontend/accessibility.md](./project_rules/frontend/accessibility.md) |
| UI Components | Design principles, state management, consistency | When creating or organizing components | [./project_rules/frontend/components.md](./project_rules/frontend/components.md) |
| CSS | Methodology, design tokens, utility-first patterns | When writing or organizing styles | [./project_rules/frontend/css.md](./project_rules/frontend/css.md) |
| Responsive Design | Mobile-first, breakpoints, touch optimization | When designing for multiple screen sizes | [./project_rules/frontend/responsive.md](./project_rules/frontend/responsive.md) |

### Testing rules
| Name | Purpose | When to use | Link |
| --- | --- | --- | --- |
| Testing | TDD workflow, test types, coverage, quality gates | When writing or organizing tests | [./project_rules/testing/testing.md](./project_rules/testing/testing.md) |

### Workflow rules
| Name | Purpose | When to use | Link |
| --- | --- | --- | --- |
| Directory Structure | Project organization and file layout | When setting up or reorganizing project structure | [./project_rules/workflow/directory-structure.md](./project_rules/workflow/directory-structure.md) |

## Generic rules
| Name | Purpose | When to use | Link |
| --- | --- | --- | --- |
| Communication | Communication guidelines and best practices | When collaborating or documenting | [./generic_rules/communication.md](./generic_rules/communication.md) |
| Development | Development workflow and coding practices | During development work | [./generic_rules/development.md](./generic_rules/development.md) |
| Documentation | Project documentation standards and structure | When creating or updating documentation | [./generic_rules/documentation.md](./generic_rules/documentation.md) |
| Git | Git workflow and commit standards | When using version control | [./generic_rules/git.md](./generic_rules/git.md) |
| Preferences | Tool preferences and configuration | When setting up development environment | [./generic_rules/preferences.md](./generic_rules/preferences.md) |
| Performance | Performance considerations and optimization guidance | When designing or optimizing code for efficiency | [./generic_rules/performance.md](./generic_rules/performance.md) |
| Security | Security guidelines and best practices | When handling security concerns | [./generic_rules/security.md](./generic_rules/security.md) |
| Validation | Data validation and error handling | When implementing validation logic | [./generic_rules/validation.md](./generic_rules/validation.md) |
| Workflows | Workflow patterns and automation | When designing or improving workflows | [./generic_rules/workflows.md](./generic_rules/workflows.md) |
