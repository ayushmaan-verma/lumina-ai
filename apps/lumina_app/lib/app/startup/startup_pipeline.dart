import 'startup_stage.dart';

/// Lumina AI — Application Startup Pipeline.
///
/// Executes a sequence of [StartupStage] implementations in registration
/// order. Each stage runs to completion before the next begins.
///
/// # Design Intent
///
/// The pipeline decouples startup orchestration from individual stage
/// implementations. Future phases add stages without modifying [bootstrap]:
///
/// ```dart
/// // Phase 3.1 pipeline
/// StartupPipeline([
///   const PlatformStage(),
/// ]);
///
/// // Phase 3.4 pipeline (example — not yet implemented)
/// StartupPipeline([
///   const PlatformStage(),
///   const LoggingStage(),      // Phase 3.4
///   const ErrorStage(),        // Phase 3.4
/// ]);
///
/// // Phase 4 pipeline (example — not yet implemented)
/// StartupPipeline([
///   const PlatformStage(),
///   const LoggingStage(),
///   const ErrorStage(),
///   const FirebaseStage(),     // Phase 4
///   const AuthStage(),         // Phase 4
/// ]);
/// ```
///
/// # Usage
///
/// ```dart
/// await StartupPipeline(stages).execute();
/// ```
///
/// Called exclusively from [bootstrap].
final class StartupPipeline {
  const StartupPipeline(this.stages);

  /// Ordered sequence of startup stages.
  ///
  /// Stages execute in list order. All are awaited sequentially.
  final List<StartupStage> stages;

  /// Executes all registered stages in order.
  ///
  /// Each stage is awaited before proceeding to the next.
  /// Exceptions propagate immediately — the pipeline does not swallow errors.
  Future<void> execute() async {
    for (final stage in stages) {
      await stage.execute();
    }
  }
}
