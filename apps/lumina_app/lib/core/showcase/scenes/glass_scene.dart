import 'package:flutter/material.dart';
import 'package:lumina_design/lumina_design.dart';

import '../showcase_scaffold.dart';

/// Demonstrates all 5 LSDS glass recipes (A–E) and interaction states.
class GlassScene extends StatelessWidget {
  const GlassScene({super.key});

  @override
  Widget build(BuildContext context) {
    return const ShowcaseScaffold(
      title: 'Glass System',
      subtitle: 'All 5 LSDS glass recipes with interaction states.',
      children: [
        ShowcaseSection(
          label: 'Recipe A — Navigation',
          children: [
            _RecipeDemo(recipe: GlassRecipe.navigation, label: 'Navigation')
          ],
        ),
        ShowcaseSection(
          label: 'Recipe B — Card',
          children: [_RecipeDemo(recipe: GlassRecipe.card, label: 'Card')],
        ),
        ShowcaseSection(
          label: 'Recipe C — Workspace Panel',
          children: [
            _RecipeDemo(
                recipe: GlassRecipe.workspacePanel, label: 'Workspace Panel')
          ],
        ),
        ShowcaseSection(
          label: 'Recipe D — Dialog',
          children: [_RecipeDemo(recipe: GlassRecipe.dialog, label: 'Dialog')],
        ),
        ShowcaseSection(
          label: 'Recipe E — Spotlight',
          children: [
            _RecipeDemo(recipe: GlassRecipe.spotlight, label: 'Spotlight')
          ],
        ),
        ShowcaseSection(
          label: 'Interactive Glass Surface',
          children: [_InteractiveGlass()],
        ),
        ShowcaseSection(
          label: 'Glow Variants',
          children: [_GlowDemo()],
        ),
      ],
    );
  }
}

// ---------------------------------------------------------------------------
// Recipe Demo
// ---------------------------------------------------------------------------
class _RecipeDemo extends StatelessWidget {
  const _RecipeDemo({required this.recipe, required this.label});

  final GlassRecipe recipe;
  final String label;

  @override
  Widget build(BuildContext context) {
    return GlassSurface(
      recipe: recipe,
      padding: const EdgeInsets.all(AppSpacing.xl),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: AppTypography.heading3),
                const SizedBox(height: AppSpacing.xs),
                Text(
                  'blur: ${recipe.blur.toInt()}px',
                  style: AppTypography.caption.copyWith(
                    color: AppColors.textTertiary,
                  ),
                ),
                const SizedBox(height: AppSpacing.sm),
                Text(
                  'Hover over this surface to see the elevation lift animation. '
                  'The border color transitions from default to hover state.',
                  style: AppTypography.bodySmall,
                ),
              ],
            ),
          ),
          const SizedBox(width: AppSpacing.xl),
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.15),
              borderRadius: AppRadius.cardRadius,
              border:
                  Border.all(color: AppColors.primary.withValues(alpha: 0.5)),
            ),
            child: const Icon(
              Icons.blur_on_outlined,
              size: AppIconSizes.xl,
              color: AppColors.primary,
            ),
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Interactive Glass with press/hover
// ---------------------------------------------------------------------------
class _InteractiveGlass extends StatelessWidget {
  const _InteractiveGlass();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: AppSpacing.md,
      runSpacing: AppSpacing.md,
      children: [
        GlassSurface(
          recipe: GlassRecipe.card,
          padding: const EdgeInsets.all(AppSpacing.xl),
          onTap: () {},
          semanticLabel: 'Interactive glass surface — tap me',
          child: SizedBox(
            width: 180,
            child: Column(
              children: [
                const Icon(Icons.touch_app_outlined,
                    size: AppIconSizes.xl, color: AppColors.primary),
                const SizedBox(height: AppSpacing.sm),
                Text('Tap Me', style: AppTypography.labelLarge),
                const SizedBox(height: AppSpacing.xxs),
                Text(
                  'Hover + press states',
                  style: AppTypography.micro.copyWith(
                    color: AppColors.textTertiary,
                  ),
                ),
              ],
            ),
          ),
        ),
        GlassSurface(
          recipe: GlassRecipe.card,
          padding: const EdgeInsets.all(AppSpacing.xl),
          enableHover: true,
          child: SizedBox(
            width: 180,
            child: Column(
              children: [
                const Icon(Icons.mouse_outlined,
                    size: AppIconSizes.xl, color: AppColors.secondary),
                const SizedBox(height: AppSpacing.sm),
                Text('Hover', style: AppTypography.labelLarge),
                const SizedBox(height: AppSpacing.xxs),
                Text(
                  'Elevation lift on desktop',
                  style: AppTypography.micro.copyWith(
                    color: AppColors.textTertiary,
                  ),
                ),
              ],
            ),
          ),
        ),
        GlassSurface(
          recipe: GlassRecipe.card,
          padding: const EdgeInsets.all(AppSpacing.xl),
          enableHover: false,
          enablePress: false,
          child: SizedBox(
            width: 180,
            child: Column(
              children: [
                const Icon(Icons.block_outlined,
                    size: AppIconSizes.xl, color: AppColors.textDisabled),
                const SizedBox(height: AppSpacing.sm),
                Text('Static', style: AppTypography.labelLarge),
                const SizedBox(height: AppSpacing.xxs),
                Text(
                  'No interaction states',
                  style: AppTypography.micro.copyWith(
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
// Glow demo
// ---------------------------------------------------------------------------
class _GlowDemo extends StatelessWidget {
  const _GlowDemo();

  @override
  Widget build(BuildContext context) {
    return const Wrap(
      spacing: AppSpacing.md,
      runSpacing: AppSpacing.md,
      children: [
        _GlowChip(
          label: 'Primary Glow',
          color: AppColors.primary,
          shadows: AppShadows.glowPrimary,
        ),
        _GlowChip(
          label: 'Secondary Glow',
          color: AppColors.secondary,
          shadows: AppShadows.glowSecondary,
        ),
        _GlowChip(
          label: 'Accent Glow',
          color: AppColors.accent,
          shadows: AppShadows.glowAccent,
        ),
        _GlowChip(
          label: 'Success Glow',
          color: AppColors.success,
          shadows: AppShadows.glowSuccess,
        ),
        _GlowChip(
          label: 'Error Glow',
          color: AppColors.error,
          shadows: AppShadows.glowError,
        ),
        _GlowChip(
          label: 'Warning Glow',
          color: AppColors.warning,
          shadows: AppShadows.glowWarning,
        ),
      ],
    );
  }
}

class _GlowChip extends StatelessWidget {
  const _GlowChip({
    required this.label,
    required this.color,
    required this.shadows,
  });

  final String label;
  final Color color;
  final List<BoxShadow> shadows;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: AppRadius.cardRadius,
        border: Border.all(color: color.withValues(alpha: 0.3)),
        boxShadow: shadows,
      ),
      child: Column(
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
              boxShadow: shadows,
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            label,
            style: AppTypography.caption.copyWith(color: AppColors.textPrimary),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
