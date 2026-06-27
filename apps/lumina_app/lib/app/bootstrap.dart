import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'lumina_app.dart';
import '../di/di.dart';
import 'startup/platform_stage.dart';
import 'startup/startup_pipeline.dart';

/// Lumina AI — Application Bootstrap.
///
/// The single entry point called from [main]. Orchestrates:
///
/// 1. Flutter binding initialization.
/// 2. [StartupPipeline] execution (ordered stage sequence).
/// 3. Root widget inflation inside a [ProviderScope].
///
/// # Pipeline Architecture
///
/// The [StartupPipeline] runs each registered [StartupStage] in order.
/// To add a new initialization stage in a future phase, append it to the
/// `stages` list. No other change to this file is needed:
///
/// ```dart
/// // Phase 3.4 example (do not implement yet):
/// StartupPipeline([
///   const PlatformStage(),
///   const LoggingStage(),
///   const ErrorReportingStage(),
/// ]);
///
/// // Phase 4 example (do not implement yet):
/// StartupPipeline([
///   const PlatformStage(),
///   const LoggingStage(),
///   const ErrorReportingStage(),
///   const FirebaseStage(),
/// ]);
/// ```
///
/// # ProviderScope
///
/// Wraps the root widget so all Riverpod providers are available from the
/// first frame. Phase 3.3 will populate [overrides:] with the DI tree.
///
/// Usage (called exclusively from [main]):
/// ```dart
/// await bootstrap();
/// ```
Future<void> bootstrap() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Execute startup pipeline. Stages run sequentially.
  const pipeline = StartupPipeline([
    PlatformStage(),
  ]);
  await pipeline.execute();

  runApp(
    const AppProviderScope(
      child: LuminaApp(),
    ),
  );
}
