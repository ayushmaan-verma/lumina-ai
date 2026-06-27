part of 'component_scene.dart';

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
