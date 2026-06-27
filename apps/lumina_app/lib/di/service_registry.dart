import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Lumina AI — Service Registry (Phase 3.3).
///
/// A mechanism for future feature modules to register their providers cleanly.
/// This prevents the root graph from becoming a dumping ground and enforces
/// modular dependency registration.
///
/// Each feature should implement [FeatureModule] and register itself in the
/// [ServiceRegistry].
abstract interface class FeatureModule {
  /// Returns the provider overrides necessary to initialize this feature.
  List<Override> get overrides;
}

/// Central registry for all feature modules.
class ServiceRegistry {
  const ServiceRegistry._();

  static final List<FeatureModule> _modules = [
    // Future feature modules will be registered here.
    // e.g. WorkspaceModule(), AuthenticationModule()
  ];

  /// Collects all overrides from registered feature modules.
  static List<Override> getOverrides() {
    return _modules.expand((module) => module.overrides).toList();
  }
}
