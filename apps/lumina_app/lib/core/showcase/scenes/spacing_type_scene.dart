import 'package:flutter/material.dart';
import 'package:lumina_design/lumina_design.dart';

import '../showcase_scaffold.dart';

/// Demonstrates LSDS typography scale, spacing system, radius tokens,
/// elevation, blur, and motion durations.
class SpacingTypeScene extends StatelessWidget {
  const SpacingTypeScene({super.key});

  @override
  Widget build(BuildContext context) {
    return const ShowcaseScaffold(
      title: 'Typography & Spacing',
      subtitle: 'Type scale, spacing system, radius, blur, and motion tokens.',
      children: [
        ShowcaseSection(
          label: 'Typography Scale',
          children: [_TypographyScale()],
        ),
        ShowcaseSection(
          label: 'Spacing System',
          children: [_SpacingScale()],
        ),
        ShowcaseSection(
          label: 'Radius Tokens',
          children: [_RadiusTokens()],
        ),
        ShowcaseSection(
          label: 'Blur Tokens',
          children: [_BlurTokens()],
        ),
        ShowcaseSection(
          label: 'Duration Tokens',
          children: [_DurationTokens()],
        ),
        ShowcaseSection(
          label: 'Gradient Library',
          children: [_GradientLibrary()],
        ),
      ],
    );
  }
}

// ---------------------------------------------------------------------------
// Typography Scale
// ---------------------------------------------------------------------------
class _TypographyScale extends StatelessWidget {
  const _TypographyScale();

  @override
  Widget build(BuildContext context) {
    final styles = [
      ('Display XL — 56px', AppTypography.displayXl),
      ('Display L — 48px', AppTypography.displayL),
      ('Display M — 40px', AppTypography.displayM),
      ('Heading 1 — 32px', AppTypography.heading1),
      ('Heading 2 — 28px', AppTypography.heading2),
      ('Heading 3 — 24px', AppTypography.heading3),
      ('Title — 20px', AppTypography.title),
      ('Subtitle — 18px', AppTypography.subtitle),
      ('Body — 16px', AppTypography.body),
      ('Body Small — 14px', AppTypography.bodySmall),
      ('Label Large — 14px SemiBold', AppTypography.labelLarge),
      ('Label Medium — 12px Medium', AppTypography.labelMedium),
      ('Caption — 12px', AppTypography.caption),
      ('Micro — 10px', AppTypography.micro),
    ];

    return GlassSurface(
      recipe: GlassRecipe.card,
      padding: const EdgeInsets.all(AppSpacing.xl),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (final (label, style) in styles) ...[
            Text(label, style: style),
            const SizedBox(height: AppSpacing.md),
          ],
          Text('Mono — 14px', style: AppTypography.mono),
          const SizedBox(height: AppSpacing.md),
          Text('Code — 13px', style: AppTypography.code),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Spacing Scale
// ---------------------------------------------------------------------------
class _SpacingScale extends StatelessWidget {
  const _SpacingScale();

  static const _values = <(String, double)>[
    ('xxs / tiny — 4', AppSpacing.xxs),
    ('xs / small — 8', AppSpacing.xs),
    ('sm — 12', AppSpacing.sm),
    ('md / compact — 16', AppSpacing.md),
    ('lg — 20', AppSpacing.lg),
    ('xl / comfortable — 24', AppSpacing.xl),
    ('xxl / relaxed — 32', AppSpacing.xxl),
    ('xxxl — 40', AppSpacing.xxxl),
    ('s48 / large — 48', AppSpacing.s48),
    ('s64 / hero — 64', AppSpacing.s64),
    ('s96 / cinematic — 96', AppSpacing.s96),
    ('s128 — 128', AppSpacing.s128),
  ];

  @override
  Widget build(BuildContext context) {
    return GlassSurface(
      recipe: GlassRecipe.card,
      padding: const EdgeInsets.all(AppSpacing.md),
      child: Column(
        children: [
          for (final (label, size) in _values)
            Padding(
              padding: const EdgeInsets.only(bottom: AppSpacing.sm),
              child: Row(
                children: [
                  SizedBox(
                    width: 160,
                    child: Text(label, style: AppTypography.caption),
                  ),
                  Container(
                    width: size.clamp(0, 200),
                    height: 20,
                    decoration: const BoxDecoration(
                      gradient: AppGradients.aurora,
                      borderRadius: AppRadius.smallRadius,
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
// Radius Tokens
// ---------------------------------------------------------------------------
class _RadiusTokens extends StatelessWidget {
  const _RadiusTokens();

  @override
  Widget build(BuildContext context) {
    return const Wrap(
      spacing: AppSpacing.md,
      runSpacing: AppSpacing.md,
      children: [
        _RadiusTile(label: 'Small', value: 8, radius: AppRadius.smallRadius),
        _RadiusTile(label: 'Medium', value: 12, radius: AppRadius.mediumRadius),
        _RadiusTile(label: 'Large', value: 20, radius: AppRadius.largeRadius),
        _RadiusTile(label: 'XL', value: 28, radius: AppRadius.xlRadius),
        _RadiusTile(label: 'Card', value: 24, radius: AppRadius.cardRadius),
        _RadiusTile(label: 'Dialog', value: 24, radius: AppRadius.dialogRadius),
        _RadiusTile(label: 'Button', value: 18, radius: AppRadius.buttonRadius),
        _RadiusTile(label: 'Pill', value: 999, radius: AppRadius.pillRadius),
      ],
    );
  }
}

class _RadiusTile extends StatelessWidget {
  const _RadiusTile({
    required this.label,
    required this.value,
    required this.radius,
  });

  final String label;
  final double value;
  final BorderRadius radius;

  @override
  Widget build(BuildContext context) {
    return GlassSurface(
      recipe: GlassRecipe.card,
      width: 120,
      padding: const EdgeInsets.all(AppSpacing.md),
      child: Column(
        children: [
          Container(
            width: 64,
            height: 48,
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.3),
              borderRadius: radius,
              border: Border.all(color: AppColors.primary),
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(label, style: AppTypography.labelLarge),
          Text('${value.toInt()}px', style: AppTypography.micro),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Blur Tokens
// ---------------------------------------------------------------------------
class _BlurTokens extends StatelessWidget {
  const _BlurTokens();

  static const _blurs = <(String, double, String)>[
    ('Small', AppBlur.small, '12px — components'),
    ('Medium', AppBlur.medium, '20px — navigation'),
    ('Large', AppBlur.large, '28px — panels'),
    ('Hero', AppBlur.hero, '36px — featured'),
    ('Overlay', AppBlur.overlay, '48px — modals'),
    ('Spotlight', AppBlur.spotlight, '48px — CTA'),
  ];

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: AppSpacing.md,
      runSpacing: AppSpacing.md,
      children: [
        for (final (label, blur, description) in _blurs)
          GlassSurface(
            recipe: GlassRecipe.card,
            width: 160,
            padding: const EdgeInsets.all(AppSpacing.md),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: AppTypography.labelLarge),
                const SizedBox(height: AppSpacing.xxs),
                Text(
                  description,
                  style: AppTypography.micro.copyWith(
                    color: AppColors.textTertiary,
                  ),
                ),
                const SizedBox(height: AppSpacing.sm),
                Text(
                  'blur: ${blur.toInt()}px',
                  style: AppTypography.caption.copyWith(
                    color: AppColors.secondary,
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}

// ---------------------------------------------------------------------------
// Duration Tokens
// ---------------------------------------------------------------------------
class _DurationTokens extends StatelessWidget {
  const _DurationTokens();

  @override
  Widget build(BuildContext context) {
    final durations = [
      ('fast', AppDurations.fast),
      ('standard', AppDurations.standard),
      ('medium', AppDurations.medium),
      ('slow', AppDurations.slow),
      ('hero', AppDurations.hero),
      ('hover', AppDurations.hover),
      ('press', AppDurations.press),
      ('pageTransition', AppDurations.pageTransition),
    ];

    return GlassSurface(
      recipe: GlassRecipe.card,
      padding: const EdgeInsets.all(AppSpacing.md),
      child: Column(
        children: [
          for (final (label, dur) in durations)
            Padding(
              padding: const EdgeInsets.only(bottom: AppSpacing.sm),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(label, style: AppTypography.labelLarge),
                  Text(
                    '${dur.inMilliseconds}ms',
                    style: AppTypography.caption.copyWith(
                      color: AppColors.secondary,
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
// Gradient Library
// ---------------------------------------------------------------------------
class _GradientLibrary extends StatelessWidget {
  const _GradientLibrary();

  @override
  Widget build(BuildContext context) {
    final gradients = [
      ('Aurora', AppGradients.aurora),
      ('Nebula', AppGradients.nebula),
      ('Sunrise', AppGradients.sunrise),
      ('Ocean', AppGradients.ocean),
      ('Galaxy', AppGradients.galaxy),
      ('Background Dark', AppGradients.backgroundDark),
      ('Glass Border', AppGradients.glassBorder),
    ];

    return Wrap(
      spacing: AppSpacing.md,
      runSpacing: AppSpacing.md,
      children: [
        for (final (label, grad) in gradients)
          GlassSurface(
            recipe: GlassRecipe.card,
            width: 150,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 56,
                  decoration: BoxDecoration(
                    gradient: grad,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(AppRadius.card),
                      topRight: Radius.circular(AppRadius.card),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(AppSpacing.sm),
                  child: Text(label, style: AppTypography.labelLarge),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
