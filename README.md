# Lumina AI

Lumina AI is an enterprise-grade AI Workspace built using Flutter. This project revolves around the principle: **Content is the center. AI is contextual.** Users interact with persistent workspaces rather than isolated AI tools.

## Architecture Summary

Lumina AI follows a layered, feature-first, Clean Architecture approach.
Dependencies flow inwards: Presentation -> Application -> Domain -> Infrastructure.
The architecture utilizes the Repository Pattern, Dependency Injection, Riverpod for state management, and immutable data models.

## Tech Stack

* **Framework**: Flutter
* **State Management**: Riverpod
* **Monorepo Tooling**: Melos
* **Version Management**: FVM (Flutter Version Management)
* **Code Generation**: Freezed, json_serializable, build_runner
* **Routing**: go_router

## Repository Structure

```text
├── apps/                 # Application entry points
├── packages/             # Reusable libraries and feature packages
├── backend/              # Backend infrastructure (functions, shared, config)
├── firebase/             # Firebase configuration (rules, indexes, emulators)
├── assets/               # Static resources
├── docs/                 # Documentation workspace
├── tools/                # Developer tooling
├── scripts/              # Automation scripts
├── test/                 # Shared testing
├── integration_test/     # End-to-end testing
└── environments/         # Environment configurations
```

## Getting Started

1. **Prerequisites**
   - Install [FVM](https://fvm.app/)
   - Install [Melos](https://melos.invertase.dev/)

2. **Setup**
   ```bash
   fvm install
   fvm use
   dart pub global activate melos
   melos bootstrap
   ```

## Development Workflow

1. Read the `docs/` and particularly `AGENTS.md` before starting any development.
2. Ensure you are working on the current milestone as defined in `docs/MILESTONES.md`.
3. Locate reusable code before creating new abstractions.
4. Run `melos analyze` and `melos format` before committing.
5. Submit a pull request following the repository guidelines.

## Contribution Guidelines

* **Consistency**: Adhere strictly to the project's engineering philosophy. Consistency scales.
* **Reuse First**: Search the repository before creating a new Widget, Service, Repository, or Utility.
* **Documentation**: Ensure all architectural or behavioral changes are documented.
* **Code Quality**: Keep widgets under 200 lines and files under 500 lines. All files must pass strict static analysis.

## Documentation Links

* [AGENTS.md](AGENTS.md) - Engineering Constitution
* [PHASES.md](docs/PHASES.md) - Development Roadmap
* [MILESTONES.md](docs/MILESTONES.md) - Implementation Milestones
* [Architecture Docs](docs/architecture/)

## License

[License Placeholder]
