import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../app/app_config.dart';
import '../app/environment/environment_config.dart';
import '../app/feature_flags/feature_flags.dart';
import '../app/lifecycle/app_lifecycle_observer.dart';
import '../app/startup/startup_pipeline.dart';
import 'interfaces/repositories.dart';
import 'interfaces/services.dart';

// ---------------------------------------------------------------------------
// Core / Configuration Providers
// ---------------------------------------------------------------------------

/// Provider for the global [AppConfig].
/// Does not currently hold state as AppConfig is a static utility, but wrapping
/// it in a provider allows future test mocking if needed.
final appConfigProvider = Provider<Type>((ref) => AppConfig);

/// Provider for the current environment configuration.
/// Defaults to [EnvironmentConfig.current]. Override in tests/bootstrap.
final environmentConfigProvider = Provider<EnvironmentConfig>((ref) {
  return EnvironmentConfig.current;
});

/// Provider for feature flags.
/// Phase 3.4 will integrate Remote Config here.
final featureFlagsProvider = Provider<FeatureFlags>((ref) {
  return const FeatureFlags();
});

// ---------------------------------------------------------------------------
// Startup & Lifecycle Providers
// ---------------------------------------------------------------------------

/// Provider for the application startup pipeline.
final startupPipelineProvider = Provider<StartupPipeline>((ref) {
  // Can be configured with environment-specific stages in the future.
  return const StartupPipeline([]);
});

/// Provider for the lifecycle observer.
final lifecycleObserverProvider = Provider<AppLifecycleObserver>((ref) {
  return AppLifecycleObserver();
});

// ---------------------------------------------------------------------------
// Future Repository Providers (Placeholders)
// ---------------------------------------------------------------------------

/// Placeholder provider for [AuthenticationRepository].
final authenticationRepositoryProvider = Provider<AuthenticationRepository>((ref) {
  throw UnimplementedError('authenticationRepositoryProvider not implemented (Phase 4)');
});

/// Placeholder provider for [WorkspaceRepository].
final workspaceRepositoryProvider = Provider<WorkspaceRepository>((ref) {
  throw UnimplementedError('workspaceRepositoryProvider not implemented (Phase 5)');
});

/// Placeholder provider for [SettingsRepository].
final settingsRepositoryProvider = Provider<SettingsRepository>((ref) {
  throw UnimplementedError('settingsRepositoryProvider not implemented (Phase 10)');
});

/// Placeholder provider for [StorageRepository].
final storageRepositoryProvider = Provider<StorageRepository>((ref) {
  throw UnimplementedError('storageRepositoryProvider not implemented (Phase 5)');
});

/// Placeholder provider for [AIRepository].
final aiRepositoryProvider = Provider<AIRepository>((ref) {
  throw UnimplementedError('aiRepositoryProvider not implemented (Phase 6)');
});

// ---------------------------------------------------------------------------
// Future Service Providers (Placeholders)
// ---------------------------------------------------------------------------

/// Placeholder provider for [AnalyticsService].
final analyticsServiceProvider = Provider<AnalyticsService>((ref) {
  throw UnimplementedError('analyticsServiceProvider not implemented');
});

/// Placeholder provider for [LoggingService].
final loggingServiceProvider = Provider<LoggingService>((ref) {
  throw UnimplementedError('loggingServiceProvider not implemented (Phase 3.4)');
});

/// Placeholder provider for [CrashReportingService].
final crashReportingServiceProvider = Provider<CrashReportingService>((ref) {
  throw UnimplementedError('crashReportingServiceProvider not implemented (Phase 3.4)');
});

/// Placeholder provider for [NotificationService].
final notificationServiceProvider = Provider<NotificationService>((ref) {
  throw UnimplementedError('notificationServiceProvider not implemented');
});

/// Placeholder provider for [StorageService].
final storageServiceProvider = Provider<StorageService>((ref) {
  throw UnimplementedError('storageServiceProvider not implemented');
});
