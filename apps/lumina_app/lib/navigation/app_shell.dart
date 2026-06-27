import 'package:flutter/material.dart';

import 'adaptive_shell.dart';

/// Lumina AI — Application Shell (Phase 3.1).
///
/// The top-level navigation shell that hosts the adaptive scaffold.
/// It acts as the composition root for all navigation concerns.
///
/// Responsibilities:
/// - Bridges [LuminaApp] to the [AdaptiveShell].
/// - Manages current route placeholder index (Phase 3.2 replaces with
///   go_router shell routes).
///
/// Phase 3.1: Index-based placeholder navigation.
/// Phase 3.2: Replace index state with go_router [StatefulShellRoute].
class AppShell extends StatefulWidget {
  const AppShell({super.key, required this.onToggleTheme});

  /// Callback propagated from [LuminaApp] to allow theme toggling from the
  /// shell's settings action. Phase 10 will remove this in favour of a
  /// Riverpod-backed theme provider.
  final VoidCallback onToggleTheme;

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  /// Active section index. Placeholder until go_router shell routes replace
  /// this in Phase 3.2.
  int _selectedIndex = 0;

  void _onSectionSelected(int index) {
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return AdaptiveShell(
      selectedIndex: _selectedIndex,
      onSectionSelected: _onSectionSelected,
      onToggleTheme: widget.onToggleTheme,
    );
  }
}
