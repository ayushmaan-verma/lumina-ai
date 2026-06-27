import 'package:flutter/material.dart';
import 'package:lumina_design/lumina_design.dart';

import 'shell_scaffold.dart';

// ---------------------------------------------------------------------------
// Navigation Destination Model
// ---------------------------------------------------------------------------

/// Represents a top-level navigation destination in the Lumina shell.
///
/// Phase 3.2 will replace [index]-based navigation with go_router locations.
/// The model is kept intentionally minimal for Phase 3.1.
@immutable
final class _ShellDestination {
  const _ShellDestination({
    required this.label,
    required this.icon,
    required this.selectedIcon,
    required this.semanticLabel,
  });

  final String label;
  final IconData icon;
  final IconData selectedIcon;
  final String semanticLabel;
}

// ---------------------------------------------------------------------------
// Destinations
//
// Phase 3.1: Placeholder destinations. Phase 5+ will replace these with
// real workspace routes wired through go_router.
// ---------------------------------------------------------------------------
const List<_ShellDestination> _destinations = [
  _ShellDestination(
    label: 'Workspace',
    icon: Icons.dashboard_outlined,
    selectedIcon: Icons.dashboard_rounded,
    semanticLabel: 'Navigate to Workspace',
  ),
  _ShellDestination(
    label: 'Collections',
    icon: Icons.folder_outlined,
    selectedIcon: Icons.folder_rounded,
    semanticLabel: 'Navigate to Collections',
  ),
  _ShellDestination(
    label: 'History',
    icon: Icons.history_outlined,
    selectedIcon: Icons.history_rounded,
    semanticLabel: 'Navigate to History',
  ),
  _ShellDestination(
    label: 'Settings',
    icon: Icons.settings_outlined,
    selectedIcon: Icons.settings_rounded,
    semanticLabel: 'Navigate to Settings',
  ),
];

// ---------------------------------------------------------------------------
// AdaptiveShell
// ---------------------------------------------------------------------------

/// Lumina AI — Adaptive Navigation Shell (Phase 3.1).
///
/// Renders the correct layout for the current LSDS breakpoint:
///
/// - **Compact** (< 600 px):  Bottom navigation bar + canvas placeholder.
/// - **Medium**  (< 1024 px): Navigation rail (icon-only) + canvas placeholder.
/// - **Expanded** (≥ 1024 px): Permanent sidebar (expanded) + canvas placeholder.
///
/// Consumes the existing [AdaptiveLayout] engine from `lumina_design` — no
/// duplicated breakpoint logic is introduced here.
///
/// Phase 3.2 will convert index-based selection to go_router shell routes.
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
      compact: (_) => _CompactShellLayout(
        destinations: _destinations,
        selectedIndex: selectedIndex,
        onSectionSelected: onSectionSelected,
        onToggleTheme: onToggleTheme,
      ),
      medium: (_) => _MediumShellLayout(
        destinations: _destinations,
        selectedIndex: selectedIndex,
        onSectionSelected: onSectionSelected,
        onToggleTheme: onToggleTheme,
      ),
      expanded: (_) => _ExpandedShellLayout(
        destinations: _destinations,
        selectedIndex: selectedIndex,
        onSectionSelected: onSectionSelected,
        onToggleTheme: onToggleTheme,
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Compact Layout (Phone)
// ---------------------------------------------------------------------------

class _CompactShellLayout extends StatelessWidget {
  const _CompactShellLayout({
    required this.destinations,
    required this.selectedIndex,
    required this.onSectionSelected,
    required this.onToggleTheme,
  });

  final List<_ShellDestination> destinations;
  final int selectedIndex;
  final ValueChanged<int> onSectionSelected;
  final VoidCallback onToggleTheme;

  @override
  Widget build(BuildContext context) {
    return ShellScaffold(
      body: const Stack(
        children: [
          Positioned.fill(child: GlassBackground()),
          _WorkspaceComingSoon(),
        ],
      ),
      bottomNavigationBar: _LuminaBottomNav(
        destinations: destinations,
        selectedIndex: selectedIndex,
        onSelected: onSectionSelected,
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Medium Layout (Tablet / Landscape Phone)
// ---------------------------------------------------------------------------

class _MediumShellLayout extends StatelessWidget {
  const _MediumShellLayout({
    required this.destinations,
    required this.selectedIndex,
    required this.onSectionSelected,
    required this.onToggleTheme,
  });

  final List<_ShellDestination> destinations;
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
              _LuminaRail(
                destinations: destinations,
                selectedIndex: selectedIndex,
                onSelected: onSectionSelected,
                onToggleTheme: onToggleTheme,
              ),
              const Expanded(child: _WorkspaceComingSoon()),
            ],
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Expanded Layout (Desktop / Large Tablet)
// ---------------------------------------------------------------------------

class _ExpandedShellLayout extends StatelessWidget {
  const _ExpandedShellLayout({
    required this.destinations,
    required this.selectedIndex,
    required this.onSectionSelected,
    required this.onToggleTheme,
  });

  final List<_ShellDestination> destinations;
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
              _LuminaSidebar(
                destinations: destinations,
                selectedIndex: selectedIndex,
                onSelected: onSectionSelected,
                onToggleTheme: onToggleTheme,
              ),
              const Expanded(child: _WorkspaceComingSoon()),
            ],
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Sidebar (Desktop/Expanded)
// ---------------------------------------------------------------------------

class _LuminaSidebar extends StatelessWidget {
  const _LuminaSidebar({
    required this.destinations,
    required this.selectedIndex,
    required this.onSelected,
    required this.onToggleTheme,
  });

  final List<_ShellDestination> destinations;
  final int selectedIndex;
  final ValueChanged<int> onSelected;
  final VoidCallback onToggleTheme;

  @override
  Widget build(BuildContext context) {
    return GlassSurface(
      recipe: GlassRecipe.navigation,
      width: WindowSize.sidebarWidth(context),
      semanticLabel: 'Primary navigation sidebar',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Safe area top offset
          const SizedBox(height: AppSpacing.xl),
          // Brand mark
          const Padding(
            padding: AppSpacing.horizontalXl,
            child: _SidebarBrandMark(),
          ),
          const SizedBox(height: AppSpacing.xxl),
          // Navigation items
          ...List.generate(destinations.length, (i) {
            return _SidebarItem(
              destination: destinations[i],
              selected: i == selectedIndex,
              onTap: () => onSelected(i),
            );
          }),
          const Spacer(),
          // Settings / theme toggle
          _SidebarFooter(onToggleTheme: onToggleTheme),
          const SizedBox(height: AppSpacing.xl),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Navigation Rail (Medium/Tablet)
// ---------------------------------------------------------------------------

class _LuminaRail extends StatelessWidget {
  const _LuminaRail({
    required this.destinations,
    required this.selectedIndex,
    required this.onSelected,
    required this.onToggleTheme,
  });

  final List<_ShellDestination> destinations;
  final int selectedIndex;
  final ValueChanged<int> onSelected;
  final VoidCallback onToggleTheme;

  @override
  Widget build(BuildContext context) {
    return GlassSurface(
      recipe: GlassRecipe.navigation,
      width: WindowSize.railWidth,
      semanticLabel: 'Primary navigation rail',
      child: Column(
        children: [
          const SizedBox(height: AppSpacing.xl),
          ...List.generate(destinations.length, (i) {
            return _RailItem(
              destination: destinations[i],
              selected: i == selectedIndex,
              onTap: () => onSelected(i),
            );
          }),
          const Spacer(),
          Tooltip(
            message: 'Toggle theme',
            child: Semantics(
              button: true,
              label: 'Toggle application theme',
              child: GestureDetector(
                onTap: onToggleTheme,
                child: const Padding(
                  padding: AppSpacing.paddingMd,
                  child: Icon(
                    Icons.brightness_6_outlined,
                    size: AppIconSizes.md,
                    color: AppColors.textTertiary,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.md),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Bottom Navigation (Compact/Mobile)
// ---------------------------------------------------------------------------

class _LuminaBottomNav extends StatelessWidget {
  const _LuminaBottomNav({
    required this.destinations,
    required this.selectedIndex,
    required this.onSelected,
  });

  final List<_ShellDestination> destinations;
  final int selectedIndex;
  final ValueChanged<int> onSelected;

  @override
  Widget build(BuildContext context) {
    return GlassSurface(
      recipe: GlassRecipe.navigation,
      semanticLabel: 'Primary bottom navigation',
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: AppSpacing.xs),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(destinations.length, (i) {
              return _BottomNavItem(
                destination: destinations[i],
                selected: i == selectedIndex,
                onTap: () => onSelected(i),
              );
            }),
          ),
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Sidebar Sub-widgets
// ---------------------------------------------------------------------------

class _SidebarBrandMark extends StatelessWidget {
  const _SidebarBrandMark();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: AppSpacing.md,
          height: AppSpacing.md,
          decoration: const BoxDecoration(
            gradient: AppGradients.aurora,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: AppSpacing.xs),
        Text('Lumina', style: AppTypography.title),
      ],
    );
  }
}

class _SidebarItem extends StatelessWidget {
  const _SidebarItem({
    required this.destination,
    required this.selected,
    required this.onTap,
  });

  final _ShellDestination destination;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      selected: selected,
      button: true,
      label: destination.semanticLabel,
      child: HoverRegion(
        child: GestureDetector(
          onTap: onTap,
          child: AnimatedContainer(
            duration: AppDurations.hover,
            curve: AppCurves.hover,
            margin: const EdgeInsets.symmetric(
              horizontal: AppSpacing.sm,
              vertical: AppSpacing.xxs,
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.md,
              vertical: AppSpacing.sm,
            ),
            decoration: BoxDecoration(
              color: selected ? AppColors.surfaceActive : Colors.transparent,
              borderRadius: AppRadius.mediumRadius,
              border: selected
                  ? Border.all(color: AppColors.borderFocused)
                  : null,
            ),
            child: Row(
              children: [
                Icon(
                  selected ? destination.selectedIcon : destination.icon,
                  size: AppIconSizes.md,
                  color: selected ? AppColors.primary : AppColors.textTertiary,
                ),
                const SizedBox(width: AppSpacing.sm),
                Flexible(
                  child: Text(
                    destination.label,
                    style: AppTypography.labelLarge.copyWith(
                      color: selected
                          ? AppColors.textPrimary
                          : AppColors.textTertiary,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SidebarFooter extends StatelessWidget {
  const _SidebarFooter({required this.onToggleTheme});

  final VoidCallback onToggleTheme;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: 'Toggle application theme',
      child: HoverRegion(
        child: GestureDetector(
          onTap: onToggleTheme,
          child: Padding(
            padding: AppSpacing.paddingXl,
            child: Row(
              children: [
                const Icon(
                  Icons.brightness_6_outlined,
                  size: AppIconSizes.md,
                  color: AppColors.textTertiary,
                ),
                const SizedBox(width: AppSpacing.sm),
                Text(
                  'Toggle Theme',
                  style: AppTypography.caption,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Rail Sub-widget
// ---------------------------------------------------------------------------

class _RailItem extends StatelessWidget {
  const _RailItem({
    required this.destination,
    required this.selected,
    required this.onTap,
  });

  final _ShellDestination destination;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: destination.label,
      waitDuration: WindowSize.tooltipDelay,
      child: Semantics(
        selected: selected,
        button: true,
        label: destination.semanticLabel,
        child: GestureDetector(
          onTap: onTap,
          child: AnimatedContainer(
            duration: AppDurations.hover,
            width: double.infinity,
            padding: AppSpacing.paddingMd,
            margin: const EdgeInsets.symmetric(
              horizontal: AppSpacing.xs,
              vertical: AppSpacing.xxs,
            ),
            decoration: BoxDecoration(
              color: selected ? AppColors.surfaceActive : Colors.transparent,
              borderRadius: AppRadius.mediumRadius,
            ),
            child: Icon(
              selected ? destination.selectedIcon : destination.icon,
              size: AppIconSizes.md,
              color: selected ? AppColors.primary : AppColors.textTertiary,
            ),
          ),
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Bottom Nav Sub-widget
// ---------------------------------------------------------------------------

class _BottomNavItem extends StatelessWidget {
  const _BottomNavItem({
    required this.destination,
    required this.selected,
    required this.onTap,
  });

  final _ShellDestination destination;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      selected: selected,
      button: true,
      label: destination.semanticLabel,
      child: GestureDetector(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.md,
            vertical: AppSpacing.xs,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                selected ? destination.selectedIcon : destination.icon,
                size: AppIconSizes.md,
                color: selected ? AppColors.primary : AppColors.textTertiary,
              ),
              const SizedBox(height: AppSpacing.xxs),
              Text(
                destination.label,
                style: AppTypography.micro.copyWith(
                  color: selected ? AppColors.primary : AppColors.textTertiary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Workspace Coming Soon Placeholder
// ---------------------------------------------------------------------------

/// Production-quality placeholder for the workspace canvas.
///
/// Displayed in all adaptive layouts until Phase 5 implements the real
/// Workspace Canvas. Must look polished and intentional — not like an MVP.
class _WorkspaceComingSoon extends StatelessWidget {
  const _WorkspaceComingSoon();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Padding(
          padding: AppSpacing.paddingXxl,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Animated brand mark
              _AnimatedBrandOrb(),
              const SizedBox(height: AppSpacing.xxl),
              // Heading
              Semantics(
                header: true,
                child: Text(
                  'Lumina AI',
                  style: AppTypography.heading1,
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: AppSpacing.xs),
              // Tagline
              Text(
                'Your AI Workspace is coming.',
                style: AppTypography.subtitle,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppSpacing.xs),
              // Description
              Text(
                'The application shell is running successfully.\n'
                'Workspace features will be available in a future phase.',
                style: AppTypography.bodySmall,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppSpacing.xxl),
              // Status badge
              _StatusBadge(),
            ],
          ),
        ),
      ),
    );
  }
}

/// Animated radial gradient orb representing the Lumina brand.
class _AnimatedBrandOrb extends StatefulWidget {
  @override
  State<_AnimatedBrandOrb> createState() => _AnimatedBrandOrbState();
}

class _AnimatedBrandOrbState extends State<_AnimatedBrandOrb>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _pulse;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: AppDurations.slow,
    )..repeat(reverse: true);
    _pulse = CurvedAnimation(parent: _controller, curve: AppCurves.standard);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _pulse,
      builder: (_, __) => Container(
        width: AppSpacing.s96 + (_pulse.value * AppSpacing.lg),
        height: AppSpacing.s96 + (_pulse.value * AppSpacing.lg),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: const RadialGradient(
            colors: [AppColors.primary, AppColors.glowPrimary],
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.glowPrimary,
              blurRadius: AppSpacing.xxl + (_pulse.value * AppSpacing.xl),
              spreadRadius: AppSpacing.xs,
            ),
          ],
        ),
        child: const Icon(
          Icons.auto_awesome_outlined,
          size: AppIconSizes.xl,
          color: AppColors.textPrimary,
        ),
      ),
    );
  }
}

/// Phase indicator badge shown in the placeholder.
class _StatusBadge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GlassSurface(
      recipe: GlassRecipe.card,
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.xs,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: AppSpacing.xs,
            height: AppSpacing.xs,
            decoration: const BoxDecoration(
              color: AppColors.success,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: AppSpacing.xs),
          Text(
            'Phase 3.1 — Application Shell Active',
            style: AppTypography.caption.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}
