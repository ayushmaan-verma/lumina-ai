# Contributing to Lumina AI

We appreciate contributions from the community. Please follow these guidelines to ensure consistency and quality.

## Development Workflow

1. Read `AGENTS.md` before making any changes.
2. Read `docs/PHASES.md` and `docs/MILESTONES.md` to ensure your work aligns with the current milestone.
3. Ensure your environment uses the correct FVM and Melos configurations.
4. Run `melos bootstrap` to setup dependencies.
5. Create a branch, make your changes, and run `melos run format`, `melos run analyze`, and `melos run test`.
6. Submit a Pull Request.

## Code Standards

- Adhere strictly to the project's **Clean Architecture**.
- Keep widgets under 200 lines and files under 500 lines.
- Reuse existing code instead of creating new abstractions.
- Never hardcode design values (refer to LSDS).
- All changes must pass the CI pipeline (zero analyzer warnings).

Please check `docs/templates/` for PR and issue templates.
