import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'service_registry.dart';

/// Lumina AI — Provider Overrides (Phase 3.3).
///
/// Manages the collection of provider overrides applied to the root [ProviderScope].
/// This enables injecting mocked repositories during testing, or
/// specific configurations for development, staging, and production environments.
class AppProviderOverrides {
  const AppProviderOverrides._();

  /// Retrieves the baseline overrides for the development environment.
  static List<Override> get development {
    return [
      ...ServiceRegistry.getOverrides(),
      // Future development-specific infrastructure overrides
    ];
  }

  /// Retrieves the baseline overrides for the staging environment.
  static List<Override> get staging {
    return [
      ...ServiceRegistry.getOverrides(),
      // Future staging-specific infrastructure overrides
    ];
  }

  /// Retrieves the baseline overrides for the production environment.
  static List<Override> get production {
    return [
      ...ServiceRegistry.getOverrides(),
      // Future production-specific infrastructure overrides
    ];
  }

  /// Retrieves the baseline overrides for testing environments.
  static List<Override> get testing {
    return [
      // Future testing-specific infrastructure overrides (e.g. mock repositories)
    ];
  }
}
