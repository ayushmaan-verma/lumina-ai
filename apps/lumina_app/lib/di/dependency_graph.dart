/// Lumina AI — Dependency Graph & Architecture (Phase 3.3).
///
/// This document outlines the application's layered dependency injection graph.
/// The graph enforces Clean Architecture by ensuring dependencies only flow
/// inward toward the domain layer.
///
/// # Layer 1: Core & Infrastructure (Outer Layer)
/// - Configuration (AppConfig, Environment, FeatureFlags)
/// - Platform services (StartupPipeline, AppLifecycleObserver)
/// - External adapters (Firebase, Hive, Network)
///
/// # Layer 2: Services
/// - LoggingService
/// - CrashReportingService
/// - AnalyticsService
/// - NotificationService
/// - StorageService
/// - (These services orchestrate infrastructure but contain no UI logic)
///
/// # Layer 3: Repositories
/// - AuthenticationRepository
/// - WorkspaceRepository
/// - SettingsRepository
/// - StorageRepository
/// - AIRepository
/// - (Repositories expose domain entities and abstract the infrastructure layer)
///
/// # Layer 4: Application / State (Riverpod Providers)
/// - Controllers, Notifiers, and State providers
/// - These providers consume Repositories and Services to manage application state
///
/// # Layer 5: Presentation (UI Layer)
/// - Widgets (Pages, Components)
/// - Widgets ONLY consume State providers (Layer 4)
/// - Widgets NEVER communicate directly with Infrastructure (Layer 1)
///
/// # Rules
/// 1. NO circular dependencies between providers.
/// 2. NO direct access to concrete infrastructure implementations from UI.
/// 3. ALL dependencies must be injected via Riverpod.
/// 4. Global variables and singletons are STRICTLY FORBIDDEN.
abstract class DependencyGraph {}
