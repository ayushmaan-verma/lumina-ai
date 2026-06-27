import 'package:flutter/material.dart';
import 'package:lumina_design/lumina_design.dart';

import '../showcase_scaffold.dart';

/// Demonstrates every color token in the Lumina Spatial Design System.
///
/// Organized by category: Brand, Semantic, Backgrounds, Glass Surfaces,
/// Borders, Text, and Glow colors.
class ColorTokenScene extends StatelessWidget {
  const ColorTokenScene({super.key});

  @override
  Widget build(BuildContext context) {
    return const ShowcaseScaffold(
      title: 'Color Tokens',
      subtitle: 'Every color defined in the LSDS palette.',
      children: [
        ShowcaseSection(
          label: 'Brand Colors',
          children: [_BrandColors()],
        ),
        ShowcaseSection(
          label: 'Semantic Colors',
          children: [_SemanticColors()],
        ),
        ShowcaseSection(
          label: 'Background Layers',
          children: [_BackgroundColors()],
        ),
        ShowcaseSection(
          label: 'Glass Surfaces',
          children: [_SurfaceColors()],
        ),
        ShowcaseSection(
          label: 'Border States',
          children: [_BorderColors()],
        ),
        ShowcaseSection(
          label: 'Text Hierarchy',
          children: [_TextColors()],
        ),
        ShowcaseSection(
          label: 'Glow Colors',
          children: [_GlowColors()],
        ),
      ],
    );
  }
}

// ---------------------------------------------------------------------------
// Brand Colors
// ---------------------------------------------------------------------------
class _BrandColors extends StatelessWidget {
  const _BrandColors();

  @override
  Widget build(BuildContext context) {
    return const Wrap(
      spacing: AppSpacing.md,
      runSpacing: AppSpacing.md,
      children: [
        _ColorChip(
            label: 'Primary', color: AppColors.primary, value: '#7C3AED'),
        _ColorChip(
            label: 'Primary Hover',
            color: AppColors.primaryHover,
            value: '#8B5CF6'),
        _ColorChip(
            label: 'Primary Pressed',
            color: AppColors.primaryPressed,
            value: '#6D28D9'),
        _ColorChip(
            label: 'Secondary', color: AppColors.secondary, value: '#06B6D4'),
        _ColorChip(
            label: 'Secondary Hover',
            color: AppColors.secondaryHover,
            value: '#0891B2'),
        _ColorChip(label: 'Accent', color: AppColors.accent, value: '#EC4899'),
      ],
    );
  }
}

// ---------------------------------------------------------------------------
// Semantic Colors
// ---------------------------------------------------------------------------
class _SemanticColors extends StatelessWidget {
  const _SemanticColors();

  @override
  Widget build(BuildContext context) {
    return const Wrap(
      spacing: AppSpacing.md,
      runSpacing: AppSpacing.md,
      children: [
        _ColorChip(
            label: 'Success', color: AppColors.success, value: '#10B981'),
        _ColorChip(
            label: 'Warning', color: AppColors.warning, value: '#F59E0B'),
        _ColorChip(label: 'Error', color: AppColors.error, value: '#EF4444'),
        _ColorChip(label: 'Info', color: AppColors.info, value: '#3B82F6'),
      ],
    );
  }
}

// ---------------------------------------------------------------------------
// Background Layers
// ---------------------------------------------------------------------------
class _BackgroundColors extends StatelessWidget {
  const _BackgroundColors();

  @override
  Widget build(BuildContext context) {
    return const Wrap(
      spacing: AppSpacing.md,
      runSpacing: AppSpacing.md,
      children: [
        _ColorChip(
            label: 'Background 0',
            color: AppColors.background0,
            value: '#05070F'),
        _ColorChip(
            label: 'Background 1',
            color: AppColors.background1,
            value: '#0A0F1A'),
        _ColorChip(
            label: 'Background 2',
            color: AppColors.background2,
            value: '#101828'),
        _ColorChip(
            label: 'Background 3',
            color: AppColors.background3,
            value: '#182230'),
      ],
    );
  }
}

// ---------------------------------------------------------------------------
// Glass Surfaces
// ---------------------------------------------------------------------------
class _SurfaceColors extends StatelessWidget {
  const _SurfaceColors();

  @override
  Widget build(BuildContext context) {
    return const Wrap(
      spacing: AppSpacing.md,
      runSpacing: AppSpacing.md,
      children: [
        _ColorChip(
            label: 'Surface 1 (4%)',
            color: AppColors.surface1,
            value: 'rgba(255,255,255,0.04)'),
        _ColorChip(
            label: 'Surface 2 (6%)',
            color: AppColors.surface2,
            value: 'rgba(255,255,255,0.06)'),
        _ColorChip(
            label: 'Surface 3 (8%)',
            color: AppColors.surface3,
            value: 'rgba(255,255,255,0.08)'),
        _ColorChip(
            label: 'Active (12%)',
            color: AppColors.surfaceActive,
            value: 'rgba(255,255,255,0.12)'),
        _ColorChip(
            label: 'Hover (14%)',
            color: AppColors.surfaceHover,
            value: 'rgba(255,255,255,0.14)'),
        _ColorChip(
            label: 'Pressed (18%)',
            color: AppColors.surfacePressed,
            value: 'rgba(255,255,255,0.18)'),
      ],
    );
  }
}

// ---------------------------------------------------------------------------
// Border States
// ---------------------------------------------------------------------------
class _BorderColors extends StatelessWidget {
  const _BorderColors();

  @override
  Widget build(BuildContext context) {
    return const Wrap(
      spacing: AppSpacing.md,
      runSpacing: AppSpacing.md,
      children: [
        _ColorChip(
            label: 'Default',
            color: AppColors.borderDefault,
            value: '12% white'),
        _ColorChip(
            label: 'Hover', color: AppColors.borderHover, value: '18% white'),
        _ColorChip(
            label: 'Focused',
            color: AppColors.borderFocused,
            value: '45% primary'),
        _ColorChip(
            label: 'Selected',
            color: AppColors.borderSelected,
            value: '45% secondary'),
        _ColorChip(
            label: 'Disabled',
            color: AppColors.borderDisabled,
            value: '5% white'),
      ],
    );
  }
}

// ---------------------------------------------------------------------------
// Text Colors
// ---------------------------------------------------------------------------
class _TextColors extends StatelessWidget {
  const _TextColors();

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        _TextColorRow(label: 'Text Primary', color: AppColors.textPrimary),
        _TextColorRow(label: 'Text Secondary', color: AppColors.textSecondary),
        _TextColorRow(label: 'Text Tertiary', color: AppColors.textTertiary),
        _TextColorRow(label: 'Text Disabled', color: AppColors.textDisabled),
      ],
    );
  }
}

class _TextColorRow extends StatelessWidget {
  const _TextColorRow({required this.label, required this.color});
  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.sm),
      child: GlassSurface(
        recipe: GlassRecipe.card,
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Row(
          children: [
            Expanded(
              child: Text(
                label,
                style: AppTypography.labelLarge.copyWith(color: color),
              ),
            ),
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: color,
                borderRadius: AppRadius.smallRadius,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Glow Colors
// ---------------------------------------------------------------------------
class _GlowColors extends StatelessWidget {
  const _GlowColors();

  @override
  Widget build(BuildContext context) {
    return const Wrap(
      spacing: AppSpacing.md,
      runSpacing: AppSpacing.md,
      children: [
        _ColorChip(
            label: 'Glow Primary',
            color: AppColors.glowPrimary,
            value: '25% primary'),
        _ColorChip(
            label: 'Glow Secondary',
            color: AppColors.glowSecondary,
            value: '25% secondary'),
        _ColorChip(
            label: 'Glow Accent',
            color: AppColors.glowAccent,
            value: '25% accent'),
        _ColorChip(
            label: 'Glow Success',
            color: AppColors.glowSuccess,
            value: '25% success'),
        _ColorChip(
            label: 'Glow Error',
            color: AppColors.glowError,
            value: '25% error'),
        _ColorChip(
            label: 'Glow Warning',
            color: AppColors.glowWarning,
            value: '25% warning'),
      ],
    );
  }
}

// ---------------------------------------------------------------------------
// Color chip widget
// ---------------------------------------------------------------------------
class _ColorChip extends StatelessWidget {
  const _ColorChip({
    required this.label,
    required this.color,
    required this.value,
  });

  final String label;
  final Color color;
  final String value;

  @override
  Widget build(BuildContext context) {
    return GlassSurface(
      recipe: GlassRecipe.card,
      width: 160,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 64,
            decoration: BoxDecoration(
              color: color,
              borderRadius: AppRadius.cardRadiusTop,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(AppSpacing.sm),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: AppTypography.labelLarge),
                const SizedBox(height: AppSpacing.xxs),
                Text(
                  value,
                  style: AppTypography.micro.copyWith(
                    color: AppColors.textTertiary,
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
