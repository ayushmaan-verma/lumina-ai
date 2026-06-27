import 'package:flutter/foundation.dart';

/// Lumina AI — Feature Flag System.
///
/// Centralizes all feature gates for the application. Flags control which
/// capabilities are available at runtime without requiring separate builds.
///
/// # Architecture
///
/// - [FeatureFlags] is the single access point. All flag reads go through it.
/// - Concrete flag values are defined in [_StaticFeatureFlags] (Phase 3.1).
/// - Phase 3.4 will introduce [_RemoteFeatureFlags] backed by Firebase Remote Config.
///
/// # Adding a Flag
///
/// 1. Add a getter to the [FeatureFlags] abstract class.
/// 2. Implement it in [_StaticFeatureFlags] with the Phase 3.1 value.
/// 3. Implement it in [_RemoteFeatureFlags] (Phase 3.4) with remote evaluation.
///
/// No callsite changes are required when switching from static to remote flags.
///
/// # Usage
///
/// ```dart
/// if (FeatureFlags.instance.workspaceEnabled) {
///   // show workspace
/// }
/// ```
@immutable
abstract class FeatureFlags {
  const FeatureFlags();

  // ---------------------------------------------------------------------------
  // Singleton Access
  // ---------------------------------------------------------------------------

  /// The active feature flag provider.
  ///
  /// Phase 3.4: Replace with [_RemoteFeatureFlags] after Firebase Init.
  static FeatureFlags get instance => const _StaticFeatureFlags();

  // ---------------------------------------------------------------------------
  // Core Feature Gates
  // ---------------------------------------------------------------------------

  /// Whether workspace creation and management is available.
  ///
  /// Gated until Phase 5.
  bool get workspaceEnabled;

  /// Whether AI analysis features (Vision, OCR, Document AI) are available.
  ///
  /// Gated until Phase 6.
  bool get aiEnabled;

  /// Whether user authentication is active.
  ///
  /// Gated until Phase 4.
  bool get authEnabled;

  /// Whether cloud synchronization (Firestore) is active.
  ///
  /// Gated until Phase 4.
  bool get cloudSyncEnabled;

  // ---------------------------------------------------------------------------
  // Debug / Diagnostic Gates
  // ---------------------------------------------------------------------------

  /// Whether the LSDS showcase is accessible via a hidden debug entry.
  ///
  /// Always false in production.
  bool get showcaseEnabled;

  /// Whether the startup diagnostics overlay is shown.
  ///
  /// Always false in production.
  bool get diagnosticsEnabled;

  // ---------------------------------------------------------------------------
  // Premium Feature Gates (Future)
  // ---------------------------------------------------------------------------

  /// Whether collections (folder organization) are available.
  ///
  /// Gated until Phase 5.
  bool get collectionsEnabled;

  /// Whether timeline / history view is available.
  ///
  /// Gated until Phase 5.
  bool get historyEnabled;
}

// ---------------------------------------------------------------------------
// Static Feature Flags (Phase 3.1)
// ---------------------------------------------------------------------------

/// Phase 3.1 static feature flags.
///
/// All gates are closed until the respective phase enables them.
/// This class is never constructed externally — access via [FeatureFlags.instance].
@immutable
final class _StaticFeatureFlags extends FeatureFlags {
  const _StaticFeatureFlags();

  @override
  bool get workspaceEnabled => false;

  @override
  bool get aiEnabled => false;

  @override
  bool get authEnabled => false;

  @override
  bool get cloudSyncEnabled => false;

  @override
  bool get showcaseEnabled => kDebugMode;

  @override
  bool get diagnosticsEnabled => kDebugMode;

  @override
  bool get collectionsEnabled => false;

  @override
  bool get historyEnabled => false;
}
