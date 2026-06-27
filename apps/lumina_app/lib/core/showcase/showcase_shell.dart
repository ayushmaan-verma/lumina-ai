import 'package:flutter/material.dart';
import 'package:lumina_design/lumina_design.dart';

import 'scenes/color_token_scene.dart';
import 'scenes/component_scene.dart';
import 'scenes/glass_scene.dart';
import 'scenes/motion_scene.dart';
import 'scenes/spacing_type_scene.dart';
import 'scenes/surface_scene.dart';

/// Top-level navigation shell for the LSDS Showcase.
///
/// Adapts between a permanent sidebar (desktop/ultra), navigation rail
/// (medium/tablet) and bottom navigation (compact/phone) following the
/// Lumina Adaptive Layout specification (LSDS Part 4).
class ShowcaseShell extends StatefulWidget {
  const ShowcaseShell({super.key, required this.onToggleTheme});

  final VoidCallback onToggleTheme;

  @override
  State<ShowcaseShell> createState() => _ShowcaseShellState();
}

class _ShowcaseShellState extends State<ShowcaseShell> {
  int _selectedIndex = 0;

  static const List<_NavItem> _navItems = [
    _NavItem(label: 'Colors', icon: Icons.palette_outlined),
    _NavItem(label: 'Typography', icon: Icons.text_fields_outlined),
    _NavItem(label: 'Glass', icon: Icons.blur_on_outlined),
    _NavItem(label: 'Motion', icon: Icons.animation_outlined),
    _NavItem(label: 'Surfaces', icon: Icons.layers_outlined),
    _NavItem(label: 'Components', icon: Icons.widgets_outlined),
  ];

  Widget _buildScene() => switch (_selectedIndex) {
        0 => const ColorTokenScene(),
        1 => const SpacingTypeScene(),
        2 => const GlassScene(),
        3 => const MotionScene(),
        4 => const SurfaceScene(),
        5 => const ComponentScene(),
        _ => const ColorTokenScene(),
      };

  @override
  Widget build(BuildContext context) {
    return AdaptiveLayout(
      compact: (_) => _CompactShell(
        navItems: _navItems,
        selectedIndex: _selectedIndex,
        onTabSelected: (i) => setState(() => _selectedIndex = i),
        onToggleTheme: widget.onToggleTheme,
        scene: _buildScene(),
      ),
      medium: (_) => _MediumShell(
        navItems: _navItems,
        selectedIndex: _selectedIndex,
        onTabSelected: (i) => setState(() => _selectedIndex = i),
        onToggleTheme: widget.onToggleTheme,
        scene: _buildScene(),
      ),
      expanded: (_) => _DesktopShell(
        navItems: _navItems,
        selectedIndex: _selectedIndex,
        onTabSelected: (i) => setState(() => _selectedIndex = i),
        onToggleTheme: widget.onToggleTheme,
        scene: _buildScene(),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Desktop layout: permanent sidebar + canvas
// ---------------------------------------------------------------------------

class _DesktopShell extends StatelessWidget {
  const _DesktopShell({
    required this.navItems,
    required this.selectedIndex,
    required this.onTabSelected,
    required this.onToggleTheme,
    required this.scene,
  });

  final List<_NavItem> navItems;
  final int selectedIndex;
  final ValueChanged<int> onTabSelected;
  final VoidCallback onToggleTheme;
  final Widget scene;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background1,
      body: Row(
        children: [
          _ShowcaseSidebar(
            navItems: navItems,
            selectedIndex: selectedIndex,
            onTabSelected: onTabSelected,
            onToggleTheme: onToggleTheme,
          ),
          Expanded(child: scene),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Medium layout: navigation rail + canvas
// ---------------------------------------------------------------------------

class _MediumShell extends StatelessWidget {
  const _MediumShell({
    required this.navItems,
    required this.selectedIndex,
    required this.onTabSelected,
    required this.onToggleTheme,
    required this.scene,
  });

  final List<_NavItem> navItems;
  final int selectedIndex;
  final ValueChanged<int> onTabSelected;
  final VoidCallback onToggleTheme;
  final Widget scene;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background1,
      body: Row(
        children: [
          _ShowcaseRail(
            navItems: navItems,
            selectedIndex: selectedIndex,
            onTabSelected: onTabSelected,
            onToggleTheme: onToggleTheme,
          ),
          Expanded(child: scene),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Compact layout: bottom navigation bar
// ---------------------------------------------------------------------------

class _CompactShell extends StatelessWidget {
  const _CompactShell({
    required this.navItems,
    required this.selectedIndex,
    required this.onTabSelected,
    required this.onToggleTheme,
    required this.scene,
  });

  final List<_NavItem> navItems;
  final int selectedIndex;
  final ValueChanged<int> onTabSelected;
  final VoidCallback onToggleTheme;
  final Widget scene;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background1,
      body: scene,
      bottomNavigationBar: _ShowcaseBottomNav(
        navItems: navItems,
        selectedIndex: selectedIndex,
        onTabSelected: onTabSelected,
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Sidebar (desktop)
// ---------------------------------------------------------------------------

class _ShowcaseSidebar extends StatelessWidget {
  const _ShowcaseSidebar({
    required this.navItems,
    required this.selectedIndex,
    required this.onTabSelected,
    required this.onToggleTheme,
  });

  final List<_NavItem> navItems;
  final int selectedIndex;
  final ValueChanged<int> onTabSelected;
  final VoidCallback onToggleTheme;

  @override
  Widget build(BuildContext context) {
    return GlassSurface(
      recipe: GlassRecipe.navigation,
      width: 220,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: AppSpacing.xl),
          Padding(
            padding: AppSpacing.horizontalXl,
            child: Text('LSDS', style: AppTypography.heading3),
          ),
          Padding(
            padding: AppSpacing.horizontalXl,
            child: Text(
              'Showcase',
              style: AppTypography.caption.copyWith(
                color: AppColors.textTertiary,
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.xl),
          ...List.generate(
              navItems.length,
              (i) => _SidebarItem(
                    item: navItems[i],
                    selected: i == selectedIndex,
                    onTap: () => onTabSelected(i),
                  )),
          const Spacer(),
          Padding(
            padding: AppSpacing.paddingXl,
            child: HoverRegion(
              child: GestureDetector(
                onTap: onToggleTheme,
                child: Row(
                  children: [
                    const Icon(
                      Icons.brightness_6_outlined,
                      size: AppIconSizes.md,
                      color: AppColors.textTertiary,
                    ),
                    const SizedBox(width: AppSpacing.sm),
                    Text('Toggle Theme', style: AppTypography.caption),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.xl),
        ],
      ),
    );
  }
}

class _SidebarItem extends StatelessWidget {
  const _SidebarItem({
    required this.item,
    required this.selected,
    required this.onTap,
  });

  final _NavItem item;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return HoverRegion(
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
            border:
                selected ? Border.all(color: AppColors.borderFocused) : null,
          ),
          child: Row(
            children: [
              Icon(
                item.icon,
                size: AppIconSizes.md,
                color: selected ? AppColors.primary : AppColors.textTertiary,
              ),
              const SizedBox(width: AppSpacing.sm),
              Text(
                item.label,
                style: AppTypography.labelLarge.copyWith(
                  color:
                      selected ? AppColors.textPrimary : AppColors.textTertiary,
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
// Rail (tablet)
// ---------------------------------------------------------------------------

class _ShowcaseRail extends StatelessWidget {
  const _ShowcaseRail({
    required this.navItems,
    required this.selectedIndex,
    required this.onTabSelected,
    required this.onToggleTheme,
  });

  final List<_NavItem> navItems;
  final int selectedIndex;
  final ValueChanged<int> onTabSelected;
  final VoidCallback onToggleTheme;

  @override
  Widget build(BuildContext context) {
    return GlassSurface(
      recipe: GlassRecipe.navigation,
      width: 72,
      child: Column(
        children: [
          const SizedBox(height: AppSpacing.xl),
          ...List.generate(
              navItems.length,
              (i) => _RailItem(
                    item: navItems[i],
                    selected: i == selectedIndex,
                    onTap: () => onTabSelected(i),
                  )),
          const Spacer(),
          GestureDetector(
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
          const SizedBox(height: AppSpacing.md),
        ],
      ),
    );
  }
}

class _RailItem extends StatelessWidget {
  const _RailItem({
    required this.item,
    required this.selected,
    required this.onTap,
  });

  final _NavItem item;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: item.label,
      waitDuration: const Duration(milliseconds: 400),
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
            item.icon,
            size: AppIconSizes.md,
            color: selected ? AppColors.primary : AppColors.textTertiary,
          ),
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Bottom Navigation (phone)
// ---------------------------------------------------------------------------

class _ShowcaseBottomNav extends StatelessWidget {
  const _ShowcaseBottomNav({
    required this.navItems,
    required this.selectedIndex,
    required this.onTabSelected,
  });

  final List<_NavItem> navItems;
  final int selectedIndex;
  final ValueChanged<int> onTabSelected;

  @override
  Widget build(BuildContext context) {
    // Show only first 5 items on compact
    final items = navItems.take(5).toList();
    return GlassSurface(
      recipe: GlassRecipe.navigation,
      child: SafeArea(
        top: false,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(items.length, (i) {
            final selected = i == selectedIndex;
            return GestureDetector(
              onTap: () => onTabSelected(i),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.md,
                  vertical: AppSpacing.sm,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      items[i].icon,
                      size: AppIconSizes.md,
                      color:
                          selected ? AppColors.primary : AppColors.textTertiary,
                    ),
                    const SizedBox(height: AppSpacing.xxs),
                    Text(
                      items[i].label,
                      style: AppTypography.micro.copyWith(
                        color: selected
                            ? AppColors.primary
                            : AppColors.textTertiary,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Data model
// ---------------------------------------------------------------------------

class _NavItem {
  const _NavItem({required this.label, required this.icon});
  final String label;
  final IconData icon;
}
