/// Lumina AI — Startup Stage Contract.
///
/// Defines the interface that every initialization stage in the startup
/// pipeline must satisfy. All stages are pluggable and independently
/// testable.
///
/// # Adding a New Stage
///
/// 1. Create a class implementing [StartupStage].
/// 2. Register it in [StartupPipeline.stages].
/// 3. The pipeline executes stages in registration order.
///
/// No modification to [StartupPipeline] is required.
///
/// # Current Stages (Phase 3.1)
///
/// - [PlatformStage]: System chrome + orientation configuration.
///
/// # Planned Stages
///
/// - Phase 3.4: `LoggingStage`, `ErrorReportingStage`
/// - Phase 4:   `FirebaseStage`, `AuthStage`
/// - Phase 5:   `StorageStage`, `WorkspaceStage`
abstract interface class StartupStage {
  /// Human-readable name of this stage for diagnostic purposes.
  String get name;

  /// Executes this startup stage.
  ///
  /// Must complete before the next stage begins.
  /// Any unrecoverable error should propagate — the pipeline will not
  /// catch exceptions from individual stages by default.
  Future<void> execute();
}
