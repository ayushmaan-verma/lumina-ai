# Architecture Overview

Lumina AI follows a layered, feature-first, Clean Architecture approach.

## Key Principles

- **Feature-first Architecture**: Code is grouped by feature rather than layer.
- **Clean Architecture**: Dependencies flow inwards: Presentation -> Application -> Domain -> Infrastructure.
- **Repository Pattern**: All external interactions are abstracted behind repositories.
- **Dependency Injection**: Dependencies are injected via Riverpod.
- **State Management**: Riverpod manages UI, Domain, and Remote state securely.
- **Immutable Data Models**: All entities are modeled as immutable classes (using `freezed`).

For detailed documentation, refer to the `docs/architecture/` directory.
