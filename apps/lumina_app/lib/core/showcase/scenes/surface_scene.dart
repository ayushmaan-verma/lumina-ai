import 'package:flutter/material.dart';
import 'package:lumina_design/lumina_design.dart';

import '../showcase_scaffold.dart';

/// Demonstrates the LSDS Surface system: SurfaceLevel enum,
/// AnimatedSurface, PressableSurface, and surface transitions.
class SurfaceScene extends StatelessWidget {
  const SurfaceScene({super.key});

  @override
  Widget build(BuildContext context) {
    return const ShowcaseScaffold(
      title: 'Surface System',
      subtitle: 'SurfaceLevel hierarchy, animated surfaces, and depth model.',
      children: [
        ShowcaseSection(
          label: 'Surface Levels',
          children: [_SurfaceLevels()],
        ),
        ShowcaseSection(
          label: 'Animated Surface Transitions',
          children: [_AnimatedSurfaceDemo()],
        ),
        ShowcaseSection(
          label: 'Shadow Depth Scale',
          children: [_ShadowScale()],
        ),
        ShowcaseSection(
          label: 'Adaptive Layout Demonstration',
          children: [_AdaptiveLayoutDemo()],
        ),
        ShowcaseSection(
          label: 'Elevation Tokens',
          children: [_ElevationTokens()],
        ),
        ShowcaseSection(
          label: 'Z-Index Layers',
          children: [_ZIndexLayers()],
        ),
      ],
    );
  }
}

// ---------------------------------------------------------------------------
// Surface Levels
// ---------------------------------------------------------------------------
class _SurfaceLevels extends StatelessWidget {
  const _SurfaceLevels();

  @override
  Widget build(BuildContext context) {
    const levels = [
      (
        SurfaceLevel.background,
        'Background',
        'Deepest layer — backgrounds, canvases'
      ),
      (SurfaceLevel.card, 'Card', 'Cards, list items, list tiles'),
      (SurfaceLevel.floating, 'Floating', 'Panels, tooltips, floating UI'),
      (SurfaceLevel.dialog, 'Dialog', 'Modal dialogs, alert sheets'),
      (
        SurfaceLevel.workspaceOverlay,
        'Workspace Overlay',
        'Contextual workspace overlays'
      ),
      (SurfaceLevel.modal, 'Modal', 'Highest priority — full-screen modals'),
    ];

    return Column(
      children: [
        for (final (level, label, description) in levels)
          Padding(
            padding: const EdgeInsets.only(bottom: AppSpacing.sm),
            child: AnimatedSurface(
              level: level,
              padding: const EdgeInsets.all(AppSpacing.md),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(label, style: AppTypography.labelLarge),
                        Text(description, style: AppTypography.caption),
                      ],
                    ),
                  ),
                  Text(
                    'Level.${level.name}',
                    style: AppTypography.mono.copyWith(
                      fontSize: 12,
                      color: AppColors.textTertiary,
                    ),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}

// ---------------------------------------------------------------------------
// Animated Surface Demo
// ---------------------------------------------------------------------------
class _AnimatedSurfaceDemo extends StatefulWidget {
  const _AnimatedSurfaceDemo();

  @override
  State<_AnimatedSurfaceDemo> createState() => _AnimatedSurfaceDemoState();
}

class _AnimatedSurfaceDemoState extends State<_AnimatedSurfaceDemo> {
  int _levelIndex = 0;

  static const _levels = [
    SurfaceLevel.background,
    SurfaceLevel.card,
    SurfaceLevel.floating,
    SurfaceLevel.dialog,
  ];

  static const _labels = ['Background', 'Card', 'Floating', 'Dialog'];

  void _next() {
    setState(() => _levelIndex = (_levelIndex + 1) % _levels.length);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AnimatedSurface(
          level: _levels[_levelIndex],
          height: 120,
          padding: const EdgeInsets.all(AppSpacing.xl),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Current: ${_labels[_levelIndex]}',
                  style: AppTypography.heading3,
                ),
                Text(
                  'Tap below to cycle surface levels',
                  style: AppTypography.caption,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: AppSpacing.md),
        PressRegion(
          onTap: _next,
          child: GlassSurface(
            recipe: GlassRecipe.card,
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.xl,
              vertical: AppSpacing.md,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.swap_horiz,
                    size: AppIconSizes.md, color: AppColors.primary),
                const SizedBox(width: AppSpacing.sm),
                Text('Cycle Surface Level', style: AppTypography.labelLarge),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// ---------------------------------------------------------------------------
// Shadow Depth Scale
// ---------------------------------------------------------------------------
class _ShadowScale extends StatelessWidget {
  const _ShadowScale();

  @override
  Widget build(BuildContext context) {
    return const Wrap(
      spacing: AppSpacing.md,
      runSpacing: AppSpacing.md,
      children: [
        _ShadowCard(label: 'Small', shadows: AppShadows.small),
        _ShadowCard(label: 'Medium', shadows: AppShadows.medium),
        _ShadowCard(label: 'Large', shadows: AppShadows.large),
        _ShadowCard(label: 'Hero', shadows: AppShadows.hero),
        _ShadowCard(label: 'Floating', shadows: AppShadows.floating),
      ],
    );
  }
}

class _ShadowCard extends StatelessWidget {
  const _ShadowCard({required this.label, required this.shadows});
  final String label;
  final List<BoxShadow> shadows;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 100,
      decoration: BoxDecoration(
        color: AppColors.surface2,
        borderRadius: AppRadius.cardRadius,
        boxShadow: shadows,
      ),
      child: Center(
        child: Text(label, style: AppTypography.labelLarge),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Adaptive Layout Demo
// ---------------------------------------------------------------------------
class _AdaptiveLayoutDemo extends StatelessWidget {
  const _AdaptiveLayoutDemo();

  @override
  Widget build(BuildContext context) {
    final bp = context.luminaBreakpoint;

    return GlassSurface(
      recipe: GlassRecipe.card,
      padding: const EdgeInsets.all(AppSpacing.xl),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AdaptiveLayout(
            compact: (_) => const _BreakpointIndicator(
              label: 'Compact',
              description: '< 600px — Mobile phone layout',
              color: AppColors.success,
            ),
            medium: (_) => const _BreakpointIndicator(
              label: 'Medium',
              description: '600–1024px — Tablet layout',
              color: AppColors.warning,
            ),
            expanded: (_) => const _BreakpointIndicator(
              label: 'Expanded',
              description: '1024–1440px — Desktop layout',
              color: AppColors.primary,
            ),
            ultra: (_) => const _BreakpointIndicator(
              label: 'Ultra',
              description: '> 1440px — Large monitor layout',
              color: AppColors.accent,
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          Text(
            'Active breakpoint: ${bp.name}',
            style: AppTypography.caption.copyWith(
              color: AppColors.textTertiary,
            ),
          ),
          Text(
            'Window: ${MediaQuery.sizeOf(context).width.toInt()} × ${MediaQuery.sizeOf(context).height.toInt()}',
            style: AppTypography.caption.copyWith(
              color: AppColors.textTertiary,
            ),
          ),
        ],
      ),
    );
  }
}

class _BreakpointIndicator extends StatelessWidget {
  const _BreakpointIndicator({
    required this.label,
    required this.description,
    required this.color,
  });

  final String label;
  final String description;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: AppSpacing.sm),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label,
                  style: AppTypography.labelLarge.copyWith(color: color)),
              Text(description, style: AppTypography.caption),
            ],
          ),
        ),
      ],
    );
  }
}

// ---------------------------------------------------------------------------
// Elevation Tokens
// ---------------------------------------------------------------------------
class _ElevationTokens extends StatelessWidget {
  const _ElevationTokens();

  @override
  Widget build(BuildContext context) {
    const levels = [
      (AppElevation.level0, '0', 'Flat — canvas, background'),
      (AppElevation.level1, '1', 'Card — tiles, items'),
      (AppElevation.level2, '2', 'Floating — panels, tooltips'),
      (AppElevation.level3, '3', 'Dialog — modals, sheets'),
      (AppElevation.level4, '4', 'Workspace Overlay'),
      (AppElevation.level5, '5', 'Modal — highest priority'),
    ];

    return GlassSurface(
      recipe: GlassRecipe.card,
      padding: const EdgeInsets.all(AppSpacing.md),
      child: Column(
        children: [
          for (final (level, value, description) in levels)
            Padding(
              padding: const EdgeInsets.only(bottom: AppSpacing.sm),
              child: Row(
                children: [
                  SizedBox(
                    width: 28,
                    child: Text(
                      value,
                      style: AppTypography.labelLarge.copyWith(
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                  Container(
                    width: level * 20 + 20,
                    height: 16,
                    margin: const EdgeInsets.only(right: AppSpacing.sm),
                    decoration: const BoxDecoration(
                      gradient: AppGradients.aurora,
                      borderRadius: AppRadius.smallRadius,
                    ),
                  ),
                  Expanded(
                    child: Text(description, style: AppTypography.caption),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Z-Index Layers
// ---------------------------------------------------------------------------
class _ZIndexLayers extends StatelessWidget {
  const _ZIndexLayers();

  @override
  Widget build(BuildContext context) {
    const layers = [
      (AppZIndex.background, 'background', 'Base layer'),
      (AppZIndex.canvas, 'canvas', 'Workspace canvas'),
      (AppZIndex.surface, 'surface', 'UI surfaces'),
      (AppZIndex.navigation, 'navigation', 'Sidebar, rail, bottom nav'),
      (AppZIndex.floating, 'floating', 'Floating panels, menus'),
      (AppZIndex.overlay, 'overlay', 'Dimmer overlays'),
      (AppZIndex.dialog, 'dialog', 'Dialog containers'),
      (AppZIndex.modal, 'modal', 'Modal sheets'),
      (AppZIndex.tooltip, 'tooltip', 'Tooltips, popovers'),
      (AppZIndex.notification, 'notification', 'Toasts, snackbars'),
      (AppZIndex.spotlight, 'spotlight', 'Command palette, search'),
    ];

    return GlassSurface(
      recipe: GlassRecipe.card,
      padding: const EdgeInsets.all(AppSpacing.md),
      child: Column(
        children: [
          for (final (z, name, description) in layers)
            Padding(
              padding: const EdgeInsets.only(bottom: AppSpacing.xs),
              child: Row(
                children: [
                  SizedBox(
                    width: 32,
                    child: Text(
                      '$z',
                      style: AppTypography.mono.copyWith(
                        fontSize: 11,
                        color: AppColors.secondary,
                      ),
                    ),
                  ),
                  const SizedBox(width: AppSpacing.sm),
                  SizedBox(
                    width: 120,
                    child: Text(name, style: AppTypography.labelLarge),
                  ),
                  Expanded(
                    child: Text(description, style: AppTypography.caption),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
