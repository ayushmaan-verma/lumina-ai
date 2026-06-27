import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import 'adaptive_shell.dart';

/// Lumina AI — Application Shell (Phase 3.2).
///
/// The top-level navigation shell that hosts the adaptive scaffold.
/// It acts as the composition root for all navigation concerns.
///
/// Responsibilities:
/// - Bridges [LuminaApp] to the [AdaptiveShell].
/// - Manages current route via go_router [StatefulNavigationShell].
class AppShell extends StatelessWidget {
  const AppShell({
    super.key,
    required this.onToggleTheme,
    required this.navigationShell,
  });

  /// Callback propagated from [LuminaApp] to allow theme toggling from the
  /// shell's settings action. Phase 10 will remove this in favour of a
  /// Riverpod-backed theme provider.
  final VoidCallback onToggleTheme;
  
  /// The router shell providing branch navigation.
  final StatefulNavigationShell navigationShell;

  void _onSectionSelected(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AdaptiveShell(
      selectedIndex: navigationShell.currentIndex,
      onSectionSelected: _onSectionSelected,
      onToggleTheme: onToggleTheme,
      child: navigationShell,
    );
  }
}
