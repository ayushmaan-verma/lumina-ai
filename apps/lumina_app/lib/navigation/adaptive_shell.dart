import 'package:flutter/material.dart';
import 'package:lumina_design/lumina_design.dart';

import 'shell_destination.dart';
import 'shell_nav_widgets.dart';
import 'shell_scaffold.dart';
import 'workspace_placeholder.dart';

// ---------------------------------------------------------------------------
// AdaptiveShell
// ---------------------------------------------------------------------------

/// Lumina AI — Adaptive Navigation Shell (Phase 3.1).
///
/// Dispatches the correct shell variant for the current LSDS breakpoint:
///
/// | Breakpoint | Width       | Shell Variant         |
/// |------------|-------------|-----------------------|
/// | Compact    | < 600 px    | Bottom navigation bar |
/// | Medium     | < 1024 px   | Navigation rail       |
/// | Expanded   | ≥ 1024 px   | Permanent sidebar     |
///
/// Consumes [AdaptiveLayout] from `lumina_design` — no duplicated breakpoint
/// logic is introduced here.
///
/// Navigation sub-widgets (sidebar, rail, bottom nav) are defined in
/// [shell_nav_widgets.dart] to respect the 500-line file-size constraint.
///
/// Phase 3.2 converts index-based selection to go_router [StatefulShellRoute].
class AdaptiveShell extends StatelessWidget {
  const AdaptiveShell({
    super.key,
    required this.selectedIndex,
    required this.onSectionSelected,
    required this.onToggleTheme,
  });

  final int selectedIndex;
  final ValueChanged<int> onSectionSelected;
  final VoidCallback onToggleTheme;

  @override
  Widget build(BuildContext context) {
    return AdaptiveLayout(
      compact: (_) => _CompactShell(
        selectedIndex: selectedIndex,
        onSectionSelected: onSectionSelected,
        onToggleTheme: onToggleTheme,
      ),
      medium: (_) => _MediumShell(
        selectedIndex: selectedIndex,
        onSectionSelected: onSectionSelected,
        onToggleTheme: onToggleTheme,
      ),
      expanded: (_) => _ExpandedShell(
        selectedIndex: selectedIndex,
        onSectionSelected: onSectionSelected,
        onToggleTheme: onToggleTheme,
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Compact Shell (Phone)
// ---------------------------------------------------------------------------

class _CompactShell extends StatelessWidget {
  const _CompactShell({
    required this.selectedIndex,
    required this.onSectionSelected,
    required this.onToggleTheme,
  });

  final int selectedIndex;
  final ValueChanged<int> onSectionSelected;
  final VoidCallback onToggleTheme;

  @override
  Widget build(BuildContext context) {
    return ShellScaffold(
      body: const Stack(
        children: [
          Positioned.fill(child: GlassBackground()),
          WorkspacePlaceholder(),
        ],
      ),
      bottomNavigationBar: ShellBottomNav(
        destinations: kShellDestinations,
        selectedIndex: selectedIndex,
        onSelected: onSectionSelected,
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Medium Shell (Tablet / Landscape Phone)
// ---------------------------------------------------------------------------

class _MediumShell extends StatelessWidget {
  const _MediumShell({
    required this.selectedIndex,
    required this.onSectionSelected,
    required this.onToggleTheme,
  });

  final int selectedIndex;
  final ValueChanged<int> onSectionSelected;
  final VoidCallback onToggleTheme;

  @override
  Widget build(BuildContext context) {
    return ShellScaffold(
      body: Stack(
        children: [
          const Positioned.fill(child: GlassBackground()),
          Row(
            children: [
              ShellRail(
                destinations: kShellDestinations,
                selectedIndex: selectedIndex,
                onSelected: onSectionSelected,
                onToggleTheme: onToggleTheme,
              ),
              const Expanded(child: WorkspacePlaceholder()),
            ],
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Expanded Shell (Desktop / Large Tablet)
// ---------------------------------------------------------------------------

class _ExpandedShell extends StatelessWidget {
  const _ExpandedShell({
    required this.selectedIndex,
    required this.onSectionSelected,
    required this.onToggleTheme,
  });

  final int selectedIndex;
  final ValueChanged<int> onSectionSelected;
  final VoidCallback onToggleTheme;

  @override
  Widget build(BuildContext context) {
    return ShellScaffold(
      body: Stack(
        children: [
          const Positioned.fill(child: GlassBackground()),
          Row(
            children: [
              ShellSidebar(
                destinations: kShellDestinations,
                selectedIndex: selectedIndex,
                onSelected: onSectionSelected,
                onToggleTheme: onToggleTheme,
              ),
              const Expanded(child: WorkspacePlaceholder()),
            ],
          ),
        ],
      ),
    );
  }
}
