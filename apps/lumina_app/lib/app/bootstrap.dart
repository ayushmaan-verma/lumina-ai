import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app_initializer.dart';
import 'lumina_app.dart';

/// Lumina AI — Application Bootstrap.
///
/// Orchestrates the full application initialization sequence:
///
/// 1. Ensures Flutter bindings are ready.
/// 2. Runs [AppInitializer.initialize] for platform-level setup.
/// 3. Wraps the root widget in a [ProviderScope] (Phase 3.1 minimum).
/// 4. Calls [runApp] with [LuminaApp].
///
/// Phase 3.1: Minimal bootstrap with ProviderScope.
/// Phase 3.3: Will add provider overrides for DI configuration.
/// Phase 3.4: Will add [runZonedGuarded] for error zone isolation.
/// Phase 4:   Will add Firebase initialization before [runApp].
///
/// Usage (called exclusively from [main]):
/// ```dart
/// await bootstrap();
/// ```
Future<void> bootstrap() async {
  WidgetsFlutterBinding.ensureInitialized();

  await AppInitializer.initialize();

  runApp(
    const ProviderScope(
      child: LuminaApp(),
    ),
  );
}
