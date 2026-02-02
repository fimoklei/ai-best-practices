# Standards

Cross-cutting standards for AI work, organized by scope and context.

## Table of contents
- [Global standards](#global-standards)
- [Project rules](#project-rules)
- [Generic rules](#generic-rules)

## Global standards
| Name | Purpose | When to use | Link |
| --- | --- | --- | --- |
| Claude Configuration | Claude AI assistant configuration and behavior guidelines | When configuring Claude for development work | [./global/CLAUDE.md](./global/CLAUDE.md) |

## Project rules
| Category | Purpose | Files | Link |
| --- | --- | --- | --- |
| Backend | API, database, models, and query standards | 4 files | [./project_rules/backend/](./project_rules/backend/) |
| Frontend | Components, CSS, accessibility, and responsive design | 4 files | [./project_rules/frontend/](./project_rules/frontend/) |
| Testing | Testing principles, TDD workflow, and quality gates | 1 file | [./project_rules/testing/](./project_rules/testing/) |
| Directory Structure | Project organization and file layout | 1 file | [./project_rules/directory-structure.md](./project_rules/directory-structure.md) |

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

## Generic rules
| Name | Purpose | When to use | Link |
| --- | --- | --- | --- |
| Communication | Communication guidelines and best practices | When collaborating or documenting | [./generic_rules/communication.md](./generic_rules/communication.md) |
| Development | Development workflow and coding practices | During development work | [./generic_rules/development.md](./generic_rules/development.md) |
| Git | Git workflow and commit standards | When using version control | [./generic_rules/git.md](./generic_rules/git.md) |
| Preferences | Tool preferences and configuration | When setting up development environment | [./generic_rules/preferences.md](./generic_rules/preferences.md) |
| Security | Security guidelines and best practices | When handling security concerns | [./generic_rules/security.md](./generic_rules/security.md) |
| Validation | Data validation and error handling | When implementing validation logic | [./generic_rules/validation.md](./generic_rules/validation.md) |
| Workflows | Workflow patterns and automation | When designing or improving workflows | [./generic_rules/workflows.md](./generic_rules/workflows.md) |
