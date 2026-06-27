import 'package:flutter/material.dart';
import 'package:lumina_design/lumina_design.dart';

import '../showcase_scaffold.dart';

/// Demonstrates all reusable LSDS foundation components:
/// GlassSurface, GlassContainer, SkeletonBlock, ShimmerPlaceholder,
/// HoverRegion, PressRegion, AdaptiveText, LuminaIcon, SurfaceContainer,
/// and border/opacity system.
class ComponentScene extends StatelessWidget {
  const ComponentScene({super.key});

  @override
  Widget build(BuildContext context) {
    return const ShowcaseScaffold(
      title: 'Components',
      subtitle: 'Foundation widgets from the LSDS component library.',
      children: [
        ShowcaseSection(
          label: 'LuminaIcon — Icon Size System',
          children: [_IconSystem()],
        ),
        ShowcaseSection(
          label: 'GlassBackground',
          children: [_GlassBackgroundDemo()],
        ),
        ShowcaseSection(
          label: 'Adaptive Text',
          children: [_AdaptiveTextDemo()],
        ),
        ShowcaseSection(
          label: 'Adaptive Spacers & Dividers',
          children: [_DividerDemo()],
        ),
        ShowcaseSection(
          label: 'Border Tokens',
          children: [_BorderDemo()],
        ),
        ShowcaseSection(
          label: 'Opacity Token System',
          children: [_OpacityDemo()],
        ),
        ShowcaseSection(
          label: 'Icon Sizes (min touch target 48px)',
          children: [_TouchTargetDemo()],
        ),
        ShowcaseSection(
          label: 'Platform Information',
          children: [_PlatformInfo()],
        ),
      ],
    );
  }
}

// ---------------------------------------------------------------------------
// Icon System
// ---------------------------------------------------------------------------
class _IconSystem extends StatelessWidget {
  const _IconSystem();

  @override
  Widget build(BuildContext context) {
    const sizes = [
      (AppIconSizes.xs, 'xs — 12', 'Micro labels'),
      (AppIconSizes.sm, 'sm — 16', 'Inline text'),
      (AppIconSizes.md, 'md — 20', 'Standard UI'),
      (AppIconSizes.lg, 'lg — 24', 'Navigation'),
      (AppIconSizes.xl, 'xl — 32', 'Feature icons'),
      (AppIconSizes.xxl, 'xxl — 48', 'Hero icons'),
    ];

    return Wrap(
      spacing: AppSpacing.md,
      runSpacing: AppSpacing.md,
      children: [
        for (final (size, label, desc) in sizes)
          GlassSurface(
            recipe: GlassRecipe.card,
            width: 120,
            padding: const EdgeInsets.all(AppSpacing.md),
            child: Column(
              children: [
                LuminaIcon(
                  Icons.star_outline,
                  size: size,
                  color: AppColors.primary,
                ),
                const SizedBox(height: AppSpacing.xs),
                Text(label, style: AppTypography.caption),
                Text(
                  desc,
                  style: AppTypography.micro.copyWith(
                    color: AppColors.textTertiary,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
      ],
    );
  }
}

// ---------------------------------------------------------------------------
// GlassBackground Demo
// ---------------------------------------------------------------------------
class _GlassBackgroundDemo extends StatelessWidget {
  const _GlassBackgroundDemo();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ClipRRect(
        borderRadius: AppRadius.cardRadius,
        child: Stack(
          children: [
            const Positioned.fill(child: GlassBackground()),
            Padding(
              padding: const EdgeInsets.all(AppSpacing.xl),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'GlassBackground',
                    style: AppTypography.heading3,
                  ),
                  const SizedBox(height: AppSpacing.xs),
                  Text(
                    '3-layer: dark base → primary gradient → radial vignette.\n'
                    'Designed to be the ambient backdrop for all Lumina screens.',
                    style: AppTypography.body,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Adaptive Text Demo
// ---------------------------------------------------------------------------
class _AdaptiveTextDemo extends StatelessWidget {
  const _AdaptiveTextDemo();

  @override
  Widget build(BuildContext context) {
    return GlassSurface(
      recipe: GlassRecipe.card,
      padding: const EdgeInsets.all(AppSpacing.xl),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AdaptiveText(
            'This heading adapts to breakpoint',
            style: AppTypography.heading2,
          ),
          const SizedBox(height: AppSpacing.sm),
          AdaptiveText(
            'AdaptiveText enforces LSDS text styles and prevents '
            'inline TextStyle overrides from being used directly in widgets.',
            style: AppTypography.body,
          ),
          const SizedBox(height: AppSpacing.md),
          SectionHeader(
            label: 'Section Header with Trailing Action',
            action: PressRegion(
              onTap: () {},
              child: Text(
                'See all',
                style: AppTypography.labelLarge.copyWith(
                  color: AppColors.primary,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Divider Demo
// ---------------------------------------------------------------------------
class _DividerDemo extends StatelessWidget {
  const _DividerDemo();

  @override
  Widget build(BuildContext context) {
    return GlassSurface(
      recipe: GlassRecipe.card,
      padding: const EdgeInsets.all(AppSpacing.xl),
      child: Column(
        children: [
          Text('Content above', style: AppTypography.body),
          const SizedBox(height: AppSpacing.md),
          const LuminaDivider.horizontal(),
          const SizedBox(height: AppSpacing.md),
          Text('Content below', style: AppTypography.body),
          const SizedBox(height: AppSpacing.md),
          Row(
            children: [
              Text('Left', style: AppTypography.body),
              const SizedBox(width: AppSpacing.md),
              const LuminaDivider.vertical(),
              const SizedBox(width: AppSpacing.md),
              Text('Right', style: AppTypography.body),
            ],
          ),
          const SizedBox(height: AppSpacing.md),
          const AdaptiveSpacer.vertical(
              compact: AppSpacing.xl, expanded: AppSpacing.xxl),
          Text(
            'AdaptiveSpacer.vertical used above',
            style: AppTypography.caption.copyWith(
              color: AppColors.textTertiary,
            ),
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Border Demo
// ---------------------------------------------------------------------------
class _BorderDemo extends StatelessWidget {
  const _BorderDemo();

  @override
  Widget build(BuildContext context) {
    const borders = [
      (AppBorders.defaultBorder, 'Default', 'borderDefault — 12% white'),
      (AppBorders.hoverBorder, 'Hover', 'borderHover — 18% white'),
      (AppBorders.focusedBorder, 'Focused', 'borderFocused — 45% primary'),
      (AppBorders.selectedBorder, 'Selected', 'borderSelected — 45% secondary'),
      (AppBorders.disabledBorder, 'Disabled', 'borderDisabled — 5% white'),
    ];

    return Wrap(
      spacing: AppSpacing.md,
      runSpacing: AppSpacing.md,
      children: [
        for (final (border, label, desc) in borders)
          Container(
            width: 140,
            padding: const EdgeInsets.all(AppSpacing.md),
            decoration: BoxDecoration(
              color: AppColors.surface1,
              borderRadius: AppRadius.cardRadius,
              border: border,
            ),
            child: Column(
              children: [
                Text(label, style: AppTypography.labelLarge),
                const SizedBox(height: AppSpacing.xxs),
                Text(
                  desc,
                  style: AppTypography.micro.copyWith(
                    color: AppColors.textTertiary,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
      ],
    );
  }
}

// ---------------------------------------------------------------------------
// Opacity Demo
// ---------------------------------------------------------------------------
class _OpacityDemo extends StatelessWidget {
  const _OpacityDemo();

  @override
  Widget build(BuildContext context) {
    final tokens = [
      ('disabled', AppOpacity.disabled),
      ('hover', AppOpacity.hover),
      ('pressed', AppOpacity.pressed),
      ('overlay', AppOpacity.overlay),
      ('glassXs (4%)', AppOpacity.glassXs),
      ('glassSm (6%)', AppOpacity.glassSm),
      ('glassMd (8%)', AppOpacity.glassMd),
      ('glassLg (10%)', AppOpacity.glassLg),
      ('glassXl (12%)', AppOpacity.glassXl),
      ('glassDialog (16%)', AppOpacity.glassDialog),
    ];

    return GlassSurface(
      recipe: GlassRecipe.card,
      padding: const EdgeInsets.all(AppSpacing.md),
      child: Column(
        children: [
          for (final (label, value) in tokens)
            Padding(
              padding: const EdgeInsets.only(bottom: AppSpacing.sm),
              child: Row(
                children: [
                  SizedBox(
                    width: 140,
                    child: Text(label, style: AppTypography.caption),
                  ),
                  Expanded(
                    child: LinearProgressIndicator(
                      value: value,
                      backgroundColor: AppColors.surface1,
                      valueColor: AlwaysStoppedAnimation(
                        AppColors.primary.withValues(alpha: value),
                      ),
                      borderRadius: AppRadius.pillRadius,
                      minHeight: 8,
                    ),
                  ),
                  const SizedBox(width: AppSpacing.sm),
                  SizedBox(
                    width: 36,
                    child: Text(
                      '${(value * 100).toInt()}%',
                      style: AppTypography.micro,
                      textAlign: TextAlign.right,
                    ),
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
// Touch Target Demo
// ---------------------------------------------------------------------------
class _TouchTargetDemo extends StatelessWidget {
  const _TouchTargetDemo();

  @override
  Widget build(BuildContext context) {
    return GlassSurface(
      recipe: GlassRecipe.card,
      padding: const EdgeInsets.all(AppSpacing.xl),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'WCAG AA requires minimum 48×48px touch targets.',
            style: AppTypography.body,
          ),
          const SizedBox(height: AppSpacing.md),
          Row(
            children: [
              // Correct: 48px touch target
              SizedBox(
                width: AppIconSizes.minTouchTarget,
                height: AppIconSizes.minTouchTarget,
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.success.withValues(alpha: 0.1),
                      borderRadius: AppRadius.mediumRadius,
                      border: Border.all(
                          color: AppColors.success.withValues(alpha: 0.3)),
                    ),
                    child: const Icon(
                      Icons.check_outlined,
                      size: AppIconSizes.lg,
                      color: AppColors.success,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: Text(
                  '48×48px (minTouchTarget) — Accessible',
                  style: AppTypography.labelLarge.copyWith(
                    color: AppColors.success,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.md),
          Row(
            children: [
              // Violation: too small
              SizedBox(
                width: 24,
                height: 24,
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.error.withValues(alpha: 0.1),
                    borderRadius: AppRadius.smallRadius,
                    border: Border.all(
                        color: AppColors.error.withValues(alpha: 0.3)),
                  ),
                  child: const Icon(
                    Icons.close_outlined,
                    size: AppIconSizes.sm,
                    color: AppColors.error,
                  ),
                ),
              ),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: Text(
                  '24×24px — Too small, accessibility violation',
                  style: AppTypography.labelLarge.copyWith(
                    color: AppColors.error,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Platform Information
// ---------------------------------------------------------------------------
class _PlatformInfo extends StatelessWidget {
  const _PlatformInfo();

  @override
  Widget build(BuildContext context) {
    final platform = PlatformResolver.current;
    final bp = context.luminaBreakpoint;
    final deviceClass = DeviceClassResolver.of(context);
    final windowSize = WindowSize.of(context);
    final supportsHover = context.supportsHover;

    return GlassSurface(
      recipe: GlassRecipe.card,
      padding: const EdgeInsets.all(AppSpacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _InfoRow('Platform', platform.name),
          _InfoRow('Breakpoint', bp.name),
          _InfoRow('Device Class', deviceClass.name),
          _InfoRow('Window Size Class', windowSize.name),
          _InfoRow('Supports Hover', supportsHover.toString()),
          _InfoRow('Is Desktop', context.isDesktop.toString()),
          _InfoRow('Is Mobile', context.isMobile.toString()),
          _InfoRow(
              'Sidebar Width', '${WindowSize.sidebarWidth(context).toInt()}px'),
          _InfoRow('AI Panel Width',
              '${WindowSize.aiPanelWidth(context).toInt()}px'),
        ],
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  const _InfoRow(this.label, this.value);
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.sm),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: AppTypography.labelLarge),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.sm,
              vertical: AppSpacing.xxs,
            ),
            decoration: BoxDecoration(
              color: AppColors.surface2,
              borderRadius: AppRadius.smallRadius,
              border: Border.all(color: AppColors.borderDefault),
            ),
            child: Text(
              value,
              style: AppTypography.mono.copyWith(fontSize: 11),
            ),
          ),
        ],
      ),
    );
  }
}
