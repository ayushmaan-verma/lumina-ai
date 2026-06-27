import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'provider_observers.dart';
import 'provider_overrides.dart';

/// Lumina AI — Composition Root (Phase 3.3).
///
/// This is the central `ProviderScope` configuration for the application.
/// It injects all provider overrides and hooks up global observers.
class AppProviderScope extends StatelessWidget {
  const AppProviderScope({
    super.key,
    required this.child,
    this.overrides = const [],
  });

  /// The root application widget (usually [LuminaApp]).
  final Widget child;

  /// Optional runtime overrides (e.g., for testing).
  /// If empty, it defaults to the development overrides.
  /// Phase 3.4 will dynamically select [AppProviderOverrides] based on the
  /// active environment configuration.
  final List<Override> overrides;

  @override
  Widget build(BuildContext context) {
    final activeOverrides = overrides.isNotEmpty
        ? overrides
        : AppProviderOverrides.development;

    return ProviderScope(
      overrides: activeOverrides,
      observers: const [
        LuminaProviderObserver(),
      ],
      child: child,
    );
  }
}
