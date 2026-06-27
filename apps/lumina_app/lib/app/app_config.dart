import 'package:flutter/foundation.dart';

/// Lumina AI — Centralized Application Configuration.
///
/// This is the single source of truth for all application-level constants,
/// environment identifiers, version information, and feature flag placeholders.
///
/// Phase 3.1: Establishes the configuration foundation.
/// Phase 3.4: Will add environment-specific loading from `.env` / remote config.
///
/// Usage:
/// ```dart
/// final name = AppConfig.appName;
/// ```
@immutable
abstract final class AppConfig {
  // ---------------------------------------------------------------------------
  // Application Identity
  // ---------------------------------------------------------------------------

  /// Human-readable application name displayed in the UI.
  static const String appName = 'Lumina AI';

  /// Short application name for system-level identifiers.
  static const String appNameShort = 'Lumina';

  /// Application tagline for marketing/splash use.
  static const String appTagline = 'Your AI Workspace';

  // ---------------------------------------------------------------------------
  // Version
  //
  // TODO(Phase 3.4): Replace with package_info_plus at runtime.
  // ---------------------------------------------------------------------------

  /// Application semantic version string.
  static const String version = '0.1.0';

  /// Application build number (placeholder until CI generates this).
  static const int buildNumber = 1;

  /// Formatted version string for display.
  static String get displayVersion => 'v$version ($buildNumber)';

  // ---------------------------------------------------------------------------
  // Environment
  //
  // TODO(Phase 3.4): Replace with runtime dart-define injection.
  // ---------------------------------------------------------------------------

  /// Current deployment environment.
  ///
  /// Defaults to [AppEnvironment.development] until Phase 3.4 introduces
  /// proper compile-time environment injection via `--dart-define`.
  static const AppEnvironment environment = AppEnvironment.development;

  /// Whether the application is running in a debug build.
  static const bool isDebug = bool.fromEnvironment(
    'LUMINA_DEBUG',
    defaultValue: true,
  );

  /// Whether the application is running in a release build.
  static const bool isRelease = !isDebug;

  // ---------------------------------------------------------------------------
  // Feature Flags
  //
  // TODO(Phase 3.4): Replace with Firebase Remote Config.
  // ---------------------------------------------------------------------------

  /// Master switch for all feature flags. Set false in release to disable
  /// any unreleased features.
  static const bool featureFlagsEnabled = false;

  /// Placeholder: workspace creation is gated until Phase 5.
  static const bool workspaceEnabled = false;

  /// Placeholder: AI features are gated until Phase 6.
  static const bool aiEnabled = false;

  /// Placeholder: authentication is gated until Phase 4.
  static const bool authEnabled = false;

  // ---------------------------------------------------------------------------
  // Build Configuration
  // ---------------------------------------------------------------------------

  /// Whether to show the Flutter debug banner.
  static const bool showDebugBanner = false;

  /// Whether to enable verbose diagnostic overlays.
  static const bool showPerformanceOverlay = false;

  /// Minimum supported Flutter SDK version string.
  static const String minFlutterVersion = '3.22.0';
}

// ---------------------------------------------------------------------------
// AppEnvironment
// ---------------------------------------------------------------------------

/// Application deployment environment.
///
/// Phase 3.4 will introduce `--dart-define=LUMINA_ENV=production` injection
/// to select the correct environment at compile time.
enum AppEnvironment {
  /// Local development environment.
  development,

  /// Staging / QA environment.
  staging,

  /// Production environment.
  production;

  /// Human-readable label for this environment.
  String get label => switch (this) {
        AppEnvironment.development => 'Development',
        AppEnvironment.staging => 'Staging',
        AppEnvironment.production => 'Production',
      };
}
