import 'package:flutter/material.dart';
import 'package:lumina_design/lumina_design.dart';

import 'shell_destination.dart';

// ---------------------------------------------------------------------------
// Sidebar (Desktop/Expanded)
// ---------------------------------------------------------------------------

/// Desktop sidebar with brand mark, navigation items, and footer.
///
/// Width is sourced from [WindowSize.sidebarWidth] — never hardcoded.
class ShellSidebar extends StatelessWidget {
  const ShellSidebar({
    super.key,
    required this.destinations,
    required this.selectedIndex,
    required this.onSelected,
    required this.onToggleTheme,
  });

  final List<ShellDestination> destinations;
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
          const SizedBox(height: AppSpacing.xl),
          const Padding(
            padding: AppSpacing.horizontalXl,
            child: _SidebarBrandMark(),
          ),
          const SizedBox(height: AppSpacing.xxl),
          ...List.generate(destinations.length, (i) {
            return _SidebarNavItem(
              destination: destinations[i],
              selected: i == selectedIndex,
              onTap: () => onSelected(i),
            );
          }),
          const Spacer(),
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

/// Tablet navigation rail — icon-only with tooltip labels.
///
/// Width is sourced from [WindowSize.railWidth] — never hardcoded.
class ShellRail extends StatelessWidget {
  const ShellRail({
    super.key,
    required this.destinations,
    required this.selectedIndex,
    required this.onSelected,
    required this.onToggleTheme,
  });

  final List<ShellDestination> destinations;
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
            return _RailNavItem(
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

/// Mobile bottom navigation bar with SafeArea padding.
class ShellBottomNav extends StatelessWidget {
  const ShellBottomNav({
    super.key,
    required this.destinations,
    required this.selectedIndex,
    required this.onSelected,
  });

  final List<ShellDestination> destinations;
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

class _SidebarNavItem extends StatelessWidget {
  const _SidebarNavItem({
    required this.destination,
    required this.selected,
    required this.onTap,
  });

  final ShellDestination destination;
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
              color: selected ? AppColors.surfaceActive : AppColors.transparent,
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

class _RailNavItem extends StatelessWidget {
  const _RailNavItem({
    required this.destination,
    required this.selected,
    required this.onTap,
  });

  final ShellDestination destination;
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
              color: selected ? AppColors.surfaceActive : AppColors.transparent,
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

  final ShellDestination destination;
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
