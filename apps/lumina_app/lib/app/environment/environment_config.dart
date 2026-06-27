import 'package:flutter/foundation.dart';

/// Lumina AI — Environment Configuration Contract.
///
/// Defines the contract for per-environment configuration values.
/// Each environment (development, staging, production) will implement
/// this contract with appropriate values in Phase 3.4.
///
/// # Why an Abstract Class, Not Just an Enum?
///
/// An enum carries labels only. Environments also carry endpoint URLs,
/// feature flag sources, logging levels, and analytics destinations that
/// differ between environments. An abstract class future-proofs this.
///
/// # Phase 3.1
///
/// Only [DevelopmentEnvironmentConfig] is instantiated. The architecture
/// is ready for [StagingEnvironmentConfig] and [ProductionEnvironmentConfig]
/// in Phase 3.4.
///
/// # Usage
///
/// ```dart
/// final config = EnvironmentConfig.current;
/// print(config.apiBaseUrl);
/// ```
@immutable
abstract base class EnvironmentConfig {
  const EnvironmentConfig();

  // ---------------------------------------------------------------------------
  // Factory
  // ---------------------------------------------------------------------------

  /// Returns the active environment configuration.
  ///
  /// Phase 3.4 will replace this with dart-define injection:
  /// `--dart-define=LUMINA_ENV=production`
  static EnvironmentConfig get current => const DevelopmentEnvironmentConfig();

  // ---------------------------------------------------------------------------
  // Contract
  // ---------------------------------------------------------------------------

  /// The [AppEnvironmentType] this config represents.
  AppEnvironmentType get type;

  /// Human-readable label for this environment.
  String get label => type.label;

  /// Whether diagnostic / verbose features are enabled.
  bool get isDevelopment => type == AppEnvironmentType.development;

  /// Whether this is a pre-release validation environment.
  bool get isStaging => type == AppEnvironmentType.staging;

  /// Whether this is the live production environment.
  bool get isProduction => type == AppEnvironmentType.production;

  /// Base URL for Lumina API calls.
  ///
  /// Phase 3.4: Replace placeholder with real endpoints.
  String get apiBaseUrl;

  /// Whether crash reporting (Crashlytics) is active.
  ///
  /// Phase 3.4 / Phase 4: Wire to Firebase Crashlytics.
  bool get crashReportingEnabled;

  /// Whether analytics collection is active.
  ///
  /// Phase 3.4 / Phase 4: Wire to Firebase Analytics.
  bool get analyticsEnabled;

  /// Minimum logging level for this environment.
  ///
  /// Phase 3.4: Wire to the logging framework.
  LogLevel get logLevel;
}

// ---------------------------------------------------------------------------
// Development Config
// ---------------------------------------------------------------------------

/// Development environment configuration.
///
/// Enables verbose logging, disables crash reporting, uses local endpoints.
@immutable
final class DevelopmentEnvironmentConfig extends EnvironmentConfig {
  const DevelopmentEnvironmentConfig();

  @override
  AppEnvironmentType get type => AppEnvironmentType.development;

  @override
  String get apiBaseUrl => 'http://localhost:8080';

  @override
  bool get crashReportingEnabled => false;

  @override
  bool get analyticsEnabled => false;

  @override
  LogLevel get logLevel => LogLevel.verbose;
}

// ---------------------------------------------------------------------------
// Staging Config
// ---------------------------------------------------------------------------

/// Staging environment configuration (placeholder).
///
/// Phase 3.4: Replace apiBaseUrl with real staging URL.
@immutable
final class StagingEnvironmentConfig extends EnvironmentConfig {
  const StagingEnvironmentConfig();

  @override
  AppEnvironmentType get type => AppEnvironmentType.staging;

  @override
  String get apiBaseUrl => 'https://staging-api.lumina.ai';

  @override
  bool get crashReportingEnabled => true;

  @override
  bool get analyticsEnabled => false;

  @override
  LogLevel get logLevel => LogLevel.warning;
}

// ---------------------------------------------------------------------------
// Production Config
// ---------------------------------------------------------------------------

/// Production environment configuration (placeholder).
///
/// Phase 3.4: Replace apiBaseUrl with real production URL.
@immutable
final class ProductionEnvironmentConfig extends EnvironmentConfig {
  const ProductionEnvironmentConfig();

  @override
  AppEnvironmentType get type => AppEnvironmentType.production;

  @override
  String get apiBaseUrl => 'https://api.lumina.ai';

  @override
  bool get crashReportingEnabled => true;

  @override
  bool get analyticsEnabled => true;

  @override
  LogLevel get logLevel => LogLevel.error;
}

// ---------------------------------------------------------------------------
// AppEnvironmentType
// ---------------------------------------------------------------------------

/// Deployment environment type identifier.
enum AppEnvironmentType {
  /// Local development. Full diagnostics enabled.
  development,

  /// Pre-release staging. Crash reporting only.
  staging,

  /// Live production. Full reporting, no verbose logs.
  production;

  /// Human-readable label for display.
  String get label => switch (this) {
        AppEnvironmentType.development => 'Development',
        AppEnvironmentType.staging => 'Staging',
        AppEnvironmentType.production => 'Production',
      };
}

// ---------------------------------------------------------------------------
// LogLevel
// ---------------------------------------------------------------------------

/// Minimum severity level for log output.
///
/// Phase 3.4 will wire this to the logging framework.
enum LogLevel {
  /// All messages including trace-level diagnostics.
  verbose,

  /// Debug-level messages and above.
  debug,

  /// Informational messages and above.
  info,

  /// Warnings and above.
  warning,

  /// Errors only.
  error,

  /// No logging.
  none;
}
