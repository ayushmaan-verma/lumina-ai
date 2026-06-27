import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'startup_stage.dart';

/// Lumina AI — Platform Startup Stage.
///
/// Handles all Flutter platform-level configuration that must complete
/// before the root widget tree is inflated.
///
/// Responsibilities:
/// - System UI chrome (edge-to-edge, transparent bars)
/// - Supported device orientations
///
/// This stage replaces the previous [AppInitializer] flat method.
/// It implements [StartupStage] so the pipeline can execute it alongside
/// future stages (Firebase, logging, etc.) without any structural changes.
final class PlatformStage implements StartupStage {
  const PlatformStage();

  @override
  String get name => 'Platform';

  @override
  Future<void> execute() async {
    await _configurePlatformChrome();
    await _configureOrientations();
  }

  // ---------------------------------------------------------------------------
  // Platform Chrome
  // ---------------------------------------------------------------------------

  /// Configures the system UI chrome for an immersive LSDS experience.
  ///
  /// Sets status bar and system navigation bar to transparent so the Lumina
  /// dark background extends edge-to-edge on Android and iOS.
  ///
  /// Note: [Colors.transparent] and [Brightness] values here are intentional
  /// system-API constants; they do not originate from LSDS because LSDS does
  /// not govern OS chrome APIs.
  Future<void> _configurePlatformChrome() async {
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

    // Enable edge-to-edge rendering so LSDS surfaces extend to screen edges.
    await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  }

  // ---------------------------------------------------------------------------
  // Orientation
  // ---------------------------------------------------------------------------

  /// Configures supported device orientations.
  ///
  /// All four orientations are enabled to support both portrait (mobile)
  /// and landscape (desktop, tablet, media viewing).
  Future<void> _configureOrientations() async {
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }
}
