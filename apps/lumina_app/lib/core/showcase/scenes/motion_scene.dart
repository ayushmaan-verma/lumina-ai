import 'package:flutter/material.dart';
import 'package:lumina_design/lumina_design.dart';

import '../showcase_scaffold.dart';

/// Demonstrates LSDS motion system: transitions, durations, curves,
/// hover regions, press regions, and skeleton/shimmer loading states.
class MotionScene extends StatelessWidget {
  const MotionScene({super.key});

  @override
  Widget build(BuildContext context) {
    return const ShowcaseScaffold(
      title: 'Motion System',
      subtitle: 'Transitions, interaction animations, and loading states.',
      children: [
        ShowcaseSection(
          label: 'Hover Region',
          children: [_HoverDemo()],
        ),
        ShowcaseSection(
          label: 'Press Region',
          children: [_PressDemo()],
        ),
        ShowcaseSection(
          label: 'Animated Transitions',
          children: [_TransitionDemo()],
        ),
        ShowcaseSection(
          label: 'Skeleton Loading',
          children: [_SkeletonDemo()],
        ),
        ShowcaseSection(
          label: 'Shimmer Placeholder',
          children: [_ShimmerDemo()],
        ),
        ShowcaseSection(
          label: 'Motion Constants',
          children: [_MotionConstants()],
        ),
      ],
    );
  }
}

// ---------------------------------------------------------------------------
// Hover Region Demo
// ---------------------------------------------------------------------------
class _HoverDemo extends StatelessWidget {
  const _HoverDemo();

  @override
  Widget build(BuildContext context) {
    return const Wrap(
      spacing: AppSpacing.md,
      runSpacing: AppSpacing.md,
      children: [
        _HoverCard(label: 'Default Hover (1.02×)', hoverScale: 1.02),
        _HoverCard(label: 'Subtle Hover (1.01×)', hoverScale: 1.01),
        _HoverCard(label: 'Strong Hover (1.04×)', hoverScale: 1.04),
      ],
    );
  }
}

class _HoverCard extends StatelessWidget {
  const _HoverCard({required this.label, required this.hoverScale});

  final String label;
  final double hoverScale;

  @override
  Widget build(BuildContext context) {
    return HoverRegion(
      scale: hoverScale,
      child: GlassSurface(
        recipe: GlassRecipe.card,
        width: 180,
        padding: const EdgeInsets.all(AppSpacing.xl),
        child: Column(
          children: [
            const Icon(
              Icons.ads_click_outlined,
              size: AppIconSizes.xl,
              color: AppColors.primary,
            ),
            const SizedBox(height: AppSpacing.sm),
            Text(label,
                style: AppTypography.labelLarge, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Press Region Demo
// ---------------------------------------------------------------------------
class _PressDemo extends StatelessWidget {
  const _PressDemo();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: AppSpacing.md,
      runSpacing: AppSpacing.md,
      children: [
        PressRegion(
          onTap: () {},
          child: GlassSurface(
            recipe: GlassRecipe.card,
            width: 180,
            padding: const EdgeInsets.all(AppSpacing.xl),
            child: Column(
              children: [
                const Icon(
                  Icons.touch_app_outlined,
                  size: AppIconSizes.xl,
                  color: AppColors.secondary,
                ),
                const SizedBox(height: AppSpacing.sm),
                Text(
                  'Press Me (0.98×)',
                  style: AppTypography.labelLarge,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
        PressableSurface(
          level: SurfaceLevel.card,
          onTap: () {},
          padding: const EdgeInsets.all(AppSpacing.xl),
          width: 180,
          semanticLabel: 'Pressable surface demonstration',
          child: Column(
            children: [
              const Icon(
                Icons.layers_outlined,
                size: AppIconSizes.xl,
                color: AppColors.accent,
              ),
              const SizedBox(height: AppSpacing.sm),
              Text(
                'PressableSurface',
                style: AppTypography.labelLarge,
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
// Transition Demo (animated fade/scale trigger)
// ---------------------------------------------------------------------------
class _TransitionDemo extends StatefulWidget {
  const _TransitionDemo();

  @override
  State<_TransitionDemo> createState() => _TransitionDemoState();
}

class _TransitionDemoState extends State<_TransitionDemo>
    with TickerProviderStateMixin {
  bool _visible = true;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: AppDurations.medium,
    )..forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggle() {
    setState(() => _visible = !_visible);
    if (_visible) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          spacing: AppSpacing.md,
          runSpacing: AppSpacing.md,
          children: [
            _TransitionBox(
              label: 'Fade + Slide',
              animation: _controller,
              builder: (anim, child) => LuminaTransitions.fadeSlide(
                animation: anim,
                child: child,
              ),
            ),
            _TransitionBox(
              label: 'Fade',
              animation: _controller,
              builder: (anim, child) => LuminaTransitions.fade(
                animation: anim,
                child: child,
              ),
            ),
            _TransitionBox(
              label: 'Fade + Scale',
              animation: _controller,
              builder: (anim, child) => LuminaTransitions.fadeScale(
                animation: anim,
                child: child,
              ),
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.md),
        PressRegion(
          onTap: _toggle,
          child: GlassSurface(
            recipe: GlassRecipe.card,
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.xl,
              vertical: AppSpacing.md,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.play_circle_outline,
                    size: AppIconSizes.md, color: AppColors.primary),
                const SizedBox(width: AppSpacing.sm),
                Text(
                  _visible ? 'Hide Transitions' : 'Show Transitions',
                  style: AppTypography.labelLarge,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _TransitionBox extends StatelessWidget {
  const _TransitionBox({
    required this.label,
    required this.animation,
    required this.builder,
  });

  final String label;
  final Animation<double> animation;
  final Widget Function(Animation<double>, Widget) builder;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 160,
      child: Column(
        children: [
          builder(
            animation,
            const GlassSurface(
              recipe: GlassRecipe.card,
              height: 80,
              child: Center(
                child: Icon(
                  Icons.animation_outlined,
                  size: AppIconSizes.xl,
                  color: AppColors.primary,
                ),
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.xs),
          Text(label,
              style: AppTypography.caption, textAlign: TextAlign.center),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Skeleton Loading
// ---------------------------------------------------------------------------
class _SkeletonDemo extends StatelessWidget {
  const _SkeletonDemo();

  @override
  Widget build(BuildContext context) {
    return GlassSurface(
      recipe: GlassRecipe.card,
      padding: const EdgeInsets.all(AppSpacing.xl),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Simulating loading state:', style: AppTypography.caption),
          const SizedBox(height: AppSpacing.md),
          const Row(
            children: [
              SkeletonBlock(
                width: 48,
                height: 48,
                borderRadius: AppRadius.pillRadius,
              ),
              SizedBox(width: AppSpacing.md),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SkeletonBlock(height: 16),
                    SizedBox(height: AppSpacing.xs),
                    SkeletonBlock(height: 12),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.md),
          const SkeletonBlock(height: 12),
          const SizedBox(height: AppSpacing.xs),
          const SkeletonBlock(height: 12),
          const SizedBox(height: AppSpacing.xs),
          SkeletonBlock(
              height: 12, width: MediaQuery.sizeOf(context).width * 0.5),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Shimmer Placeholder
// ---------------------------------------------------------------------------
class _ShimmerDemo extends StatefulWidget {
  const _ShimmerDemo();

  @override
  State<_ShimmerDemo> createState() => _ShimmerDemoState();
}

class _ShimmerDemoState extends State<_ShimmerDemo> {
  bool _loading = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ShimmerPlaceholder(
          enabled: _loading,
          child: GlassSurface(
            recipe: GlassRecipe.card,
            padding: const EdgeInsets.all(AppSpacing.xl),
            child: Row(
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: const BoxDecoration(
                    color: AppColors.surface3,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: AppSpacing.md),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Content loaded', style: AppTypography.labelLarge),
                      Text(
                        'Toggle shimmer below to see the effect',
                        style: AppTypography.caption,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: AppSpacing.md),
        PressRegion(
          onTap: () => setState(() => _loading = !_loading),
          child: GlassSurface(
            recipe: GlassRecipe.card,
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.xl,
              vertical: AppSpacing.md,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  _loading ? Icons.cloud_done_outlined : Icons.hourglass_empty,
                  size: AppIconSizes.md,
                  color: _loading ? AppColors.secondary : AppColors.primary,
                ),
                const SizedBox(width: AppSpacing.sm),
                Text(
                  _loading ? 'Stop shimmer' : 'Start shimmer',
                  style: AppTypography.labelLarge,
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
// Motion Constants
// ---------------------------------------------------------------------------
class _MotionConstants extends StatelessWidget {
  const _MotionConstants();

  @override
  Widget build(BuildContext context) {
    return GlassSurface(
      recipe: GlassRecipe.card,
      padding: const EdgeInsets.all(AppSpacing.md),
      child: Column(
        children: [
          const _MotionRow('hoverScale', '${MotionTokens.hoverScale}×'),
          const _MotionRow('hoverLift', '${MotionTokens.hoverLift}px'),
          const _MotionRow('pressScale', '${MotionTokens.pressScale}×'),
          const _MotionRow(
              'pageTransitionOffset', '${MotionTokens.pageTransitionOffset}px'),
          _MotionRow('hoverDuration',
              '${MotionTokens.hoverDuration.inMilliseconds}ms'),
          _MotionRow('pressDuration',
              '${MotionTokens.pressDuration.inMilliseconds}ms'),
          _MotionRow('modalDuration',
              '${MotionTokens.modalDuration.inMilliseconds}ms'),
          _MotionRow(
              'heroDuration', '${MotionTokens.heroDuration.inMilliseconds}ms'),
        ],
      ),
    );
  }
}

class _MotionRow extends StatelessWidget {
  const _MotionRow(this.label, this.value);
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
          Text(
            value,
            style: AppTypography.caption.copyWith(color: AppColors.secondary),
          ),
        ],
      ),
    );
  }
}
