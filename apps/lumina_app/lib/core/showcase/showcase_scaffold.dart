import 'package:flutter/material.dart';
import 'package:lumina_design/lumina_design.dart';

/// Shared scaffold for all showcase scenes.
///
/// Provides a scrollable canvas with the LSDS animated background,
/// a title header, and consistently padded content area.
class ShowcaseScaffold extends StatelessWidget {
  const ShowcaseScaffold({
    super.key,
    required this.title,
    required this.subtitle,
    required this.children,
  });

  /// Scene title displayed at the top.
  final String title;

  /// Short description of what this scene showcases.
  final String subtitle;

  /// Content sections to render in the scrollable body.
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final padding = context.luminaAdaptiveSpacing.pagePadding;
    final sectionGap = context.luminaAdaptiveSpacing.sectionGap;

    return Stack(
      children: [
        // Animated LSDS background
        const Positioned.fill(child: GlassBackground()),
        // Scrollable content
        SafeArea(
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(
                    padding,
                    AppSpacing.xl,
                    padding,
                    AppSpacing.md,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title, style: AppTypography.heading1),
                      const SizedBox(height: AppSpacing.xs),
                      Text(
                        subtitle,
                        style: AppTypography.subtitle.copyWith(
                          color: AppColors.textTertiary,
                        ),
                      ),
                      const SizedBox(height: AppSpacing.xs),
                      Container(
                        height: 1,
                        color: AppColors.borderDefault,
                      ),
                    ],
                  ),
                ),
              ),
              SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: padding),
                sliver: SliverList.separated(
                  itemCount: children.length,
                  itemBuilder: (_, i) => children[i],
                  separatorBuilder: (_, __) => SizedBox(height: sectionGap),
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(height: AppSpacing.cinematic),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

/// Section header widget reused across all showcase scenes.
class ShowcaseSection extends StatelessWidget {
  const ShowcaseSection({
    super.key,
    required this.label,
    required this.children,
  });

  final String label;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: AppTypography.title),
        const SizedBox(height: AppSpacing.md),
        ...children,
      ],
    );
  }
}

/// A labeled row/column tile used to demonstrate individual tokens.
class TokenTile extends StatelessWidget {
  const TokenTile({
    super.key,
    required this.label,
    required this.value,
    required this.child,
  });

  final String label;
  final String value;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GlassSurface(
      recipe: GlassRecipe.card,
      padding: const EdgeInsets.all(AppSpacing.md),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: AppTypography.labelLarge),
                const SizedBox(height: AppSpacing.xxs),
                Text(
                  value,
                  style: AppTypography.caption.copyWith(
                    color: AppColors.textTertiary,
                  ),
                ),
              ],
            ),
          ),
          Expanded(child: child),
        ],
      ),
    );
  }
}
