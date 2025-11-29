
# AGENTS.md

## Title and Purpose

AGENTS.md is the persistent long-term memory and instruction set for all agents operating in this repository. It defines agent roles, behavioral rules, coding standards, architectural guidelines, file and module conventions, collaboration protocols, and memory usage. All agents must read and adhere to AGENTS.md before reasoning or acting. This document exists to ensure consistency, reliability, and professional standards across all automated and human contributors.

## Global Principles

- **Architecture:** Modular, composable, and reproducible. Favor separation of concerns and explicit interfaces.
- **Philosophy:** Clarity, maintainability, and extensibility are prioritized. All code and documentation must be understandable by both humans and LLMs.
- **Technology Stack:** Nix for reproducibility and environment management; Python for AI/ML; TypeScript/Svelte/Bun for frontend; MkDocs for documentation; other languages as needed per template.
- **Naming & Formatting:** Use descriptive, consistent names. Follow language-specific formatting standards (PEP8 for Python, Prettier for TypeScript, etc.). All files must be linted and formatted before merging.
- **Quality:** All code must be tested, reviewed, and documented. No untested or undocumented code is permitted.

## Agent Definitions

| Agent Role            | Responsibilities                                                                 | Capabilities                                      | Limitations                          | Required Context                | Communication Protocol                  |
|---------------------- |--------------------------------------------------------------------------------|---------------------------------------------------|--------------------------------------|-------------------------------|------------------------------------------|
| Architect Agent       | Define architecture, enforce principles, approve major changes                   | Design, review, approve/reject proposals           | Cannot merge code directly           | AGENTS.md, architecture docs   | Propose, review, escalate                |
| Lead Developer Agent  | Implement features, refactor, coordinate development                             | Code generation, refactoring, integration          | Must follow approved architecture    | AGENTS.md, requirements       | Collaborate, request review, escalate    |
| Reviewer Agent        | Review code, enforce standards, suggest improvements                             | Code review, style/lint enforcement                | Cannot approve own code              | AGENTS.md, code diffs         | Comment, approve/reject, escalate        |
| Writer/Documentor     | Write and maintain documentation, update AGENTS.md and related docs              | Documentation generation, formatting               | Cannot modify code directly          | AGENTS.md, codebase           | Suggest, update docs, request review     |
| Test Engineer Agent   | Design and run tests, ensure coverage, validate correctness                      | Test generation, execution, coverage analysis      | Cannot merge code directly           | AGENTS.md, test specs         | Report, suggest fixes, escalate          |
| Lint/Style Agent      | Enforce formatting, linting, and style rules                                     | Linting, formatting, style enforcement             | Cannot modify logic                  | AGENTS.md, style guides       | Comment, auto-fix, escalate              |

## Shared Memory Rules

- All agents must read AGENTS.md before reasoning or acting.
- Updates to AGENTS.md or persistent memory must be proposed via pull request and reviewed by Architect and Reviewer agents.
- Persistent memory includes architectural decisions, coding standards, workflow rules, and agent definitions. Ephemeral context includes temporary discussions, logs, or transient state.
- Only information relevant to long-term operation, collaboration, or standards belongs in AGENTS.md.

## Workflow Rules

- **Branching:** Use feature branches for new work. Main branch is protected and only updated via reviewed pull requests.
- **Code Generation:** Lead Developer Agent generates code in feature branches, referencing AGENTS.md for standards.
- **Review:** Reviewer Agent must review all code before merging. Architect Agent reviews major changes.
- **Testing:** Test Engineer Agent ensures all code is covered by tests before merging. No code merges without passing tests.
- **Change Proposal:** All changes to architecture, standards, or AGENTS.md require approval from Architect and Reviewer agents.

## Coding Standards

- **Python:** PEP8 formatting, type hints, docstrings, explicit error handling, minimal dependencies.
- **TypeScript:** Prettier formatting, strict types, modular structure, clear interfaces.
- **Nix:** Idiomatic Nix expressions, reproducible builds, minimal impurity.
- **Svelte/Bun:** Component-based structure, clear separation of logic and presentation.
- **MkDocs:** Structured markdown, clear navigation, up-to-date documentation.
- **Modules/Files:** Each module/file must have a clear purpose, descriptive name, and documentation header.
- **Error Handling:** Use explicit error handling; log and propagate errors appropriately.
- **Dependencies:** Minimize dependencies; prefer well-maintained, widely used libraries.
- **Security:** Validate inputs, avoid hardcoded secrets, follow best practices for each stack.

## Communication Protocol

- Agents respond in clear, concise, professional language.
- Collaboration is asynchronous and documented; all decisions and changes must be logged.
- Unclear instructions are escalated to Architect Agent for clarification.
- Ambiguous or conflicting user instructions are interpreted according to AGENTS.md; defer to AGENTS.md when in conflict.
- All agent interactions must be traceable and reproducible.

## Extensibility

- New agents may be added by proposing a role definition in AGENTS.md and submitting for review.
- The system is designed to evolve; future memory entries should be structured as markdown sections with clear headings and tables where appropriate.
- All changes to agent definitions, standards, or workflows must be documented in AGENTS.md and approved via the standard review workflow.
