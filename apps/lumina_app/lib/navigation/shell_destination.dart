import 'package:flutter/material.dart';

/// Lumina AI — Shell Navigation Destination.
///
/// Represents a single top-level navigation destination in the Lumina shell.
///
/// Phase 3.2 will extend this model with a `location` field (go_router path)
/// to replace the [index]-based navigation used in Phase 3.1.
///
/// All destination data is kept in [kShellDestinations] to ensure the same
/// list is shared across all adaptive shell variants (sidebar, rail, bottom nav).
@immutable
final class ShellDestination {
  const ShellDestination({
    required this.label,
    required this.icon,
    required this.selectedIcon,
    required this.semanticLabel,
  });

  /// Human-readable label shown alongside the icon.
  final String label;

  /// Icon rendered when the destination is not selected.
  final IconData icon;

  /// Icon rendered when the destination is selected (filled variant).
  final IconData selectedIcon;

  /// Accessibility label for screen readers.
  final String semanticLabel;
}

/// Canonical list of top-level navigation destinations.
///
/// Defined once, shared across sidebar, navigation rail, and bottom bar.
///
/// Phase 3.2: Add a `location` field pointing to go_router route paths.
/// Phase 5+:  Destinations will reflect real feature routes.
const List<ShellDestination> kShellDestinations = [
  ShellDestination(
    label: 'Workspace',
    icon: Icons.dashboard_outlined,
    selectedIcon: Icons.dashboard_rounded,
    semanticLabel: 'Navigate to Workspace',
  ),
  ShellDestination(
    label: 'Collections',
    icon: Icons.folder_outlined,
    selectedIcon: Icons.folder_rounded,
    semanticLabel: 'Navigate to Collections',
  ),
  ShellDestination(
    label: 'History',
    icon: Icons.history_outlined,
    selectedIcon: Icons.history_rounded,
    semanticLabel: 'Navigate to History',
  ),
  ShellDestination(
    label: 'Settings',
    icon: Icons.settings_outlined,
    selectedIcon: Icons.settings_rounded,
    semanticLabel: 'Navigate to Settings',
  ),
];
