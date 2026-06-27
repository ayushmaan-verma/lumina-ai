import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Lumina AI — Platform Initialization Sequence.
///
/// Responsible for all setup operations that must complete before the
/// root widget tree is inflated. Designed to remain extensible for
/// future service registration without requiring changes to [bootstrap].
///
/// Phase 3.1: Platform-level initialization only.
/// Phase 3.3: Will add Riverpod provider pre-warming.
/// Phase 3.4: Will add logging, error reporting, crash handler.
/// Phase 4:   Will add Firebase / Auth initialization.
///
/// Usage (called exclusively from [bootstrap]):
/// ```dart
/// await AppInitializer.initialize();
/// ```
abstract final class AppInitializer {
  /// Runs the full application initialization sequence.
  ///
  /// This method must be called after [WidgetsFlutterBinding.ensureInitialized]
  /// and before [runApp]. It is intentionally synchronous-feeling even though
  /// it is asynchronous, so that future services (Firebase, Hive, etc.) can be
  /// registered without changing the call site in [bootstrap].
  static Future<void> initialize() async {
    await _configurePlatformChrome();
    await _configureOrientations();
  }

  // ---------------------------------------------------------------------------
  // Private: Platform Chrome
  // ---------------------------------------------------------------------------

  /// Configures the system UI chrome for an immersive LSDS experience.
  ///
  /// Sets the status bar and navigation bar to transparent so the Lumina dark
  /// background extends edge-to-edge on Android and iOS.
  static Future<void> _configurePlatformChrome() async {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.light,
        systemNavigationBarDividerColor: Colors.transparent,
      ),
    );

    // Enable edge-to-edge rendering.
    await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  }

  // ---------------------------------------------------------------------------
  // Private: Orientation
  // ---------------------------------------------------------------------------

  /// Configures supported device orientations.
  ///
  /// Desktop and tablet support all orientations. Phone prefers portrait
  /// but does not lock it, allowing landscape for media viewing.
  static Future<void> _configureOrientations() async {
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }
}
