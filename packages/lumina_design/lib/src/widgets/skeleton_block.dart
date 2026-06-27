import 'package:flutter/material.dart';

import '../tokens/colors/app_colors.dart';
import '../tokens/motion/app_curves.dart';
import '../tokens/motion/app_durations.dart';
import '../tokens/radius/app_radius.dart';

/// A shimmering loading placeholder that matches the LSDS glass aesthetic.
///
/// Use [SkeletonBlock] for rectangular placeholders and
/// [ShimmerPlaceholder] when a shimmer sweep animation is required.
/// These replace opaque grey loading spinners per LSDS section 33.
///
/// Example:
/// ```dart
/// SkeletonBlock(width: 200, height: 16)
/// ```
class SkeletonBlock extends StatefulWidget {
  /// Creates a [SkeletonBlock].
  const SkeletonBlock({
    super.key,
    this.width,
    this.height = 16,
    this.borderRadius,
  });

  /// Width of the skeleton block. Defaults to filling available space.
  final double? width;

  /// Height of the skeleton block.
  final double height;

  /// Border radius. Defaults to [AppRadius.smallRadius].
  final BorderRadius? borderRadius;

  @override
  State<SkeletonBlock> createState() => _SkeletonBlockState();
}

class _SkeletonBlockState extends State<SkeletonBlock>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacity;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      // Skeleton uses a slow pulse matching LSDS ambient motion intent
      duration: AppDurations.skeletonPulse,
    )..repeat(reverse: true);

    _opacity = Tween<double>(begin: 0.4, end: 0.8).animate(
      CurvedAnimation(parent: _controller, curve: AppCurves.loading),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _opacity,
      builder: (context, _) => Container(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          // Glass surface tint at varying opacity for the pulse effect
          color: AppColors.surface2.withValues(alpha: _opacity.value),
          borderRadius: widget.borderRadius ?? AppRadius.smallRadius,
          border: Border.all(
            color: AppColors.borderDefault,
            width: 0.5,
          ),
        ),
      ),
    );
  }
}

/// A shimmer sweep animation applied over a child widget.
///
/// Renders a diagonal highlight sweep on top of the [child] to indicate
/// content is loading. The shimmer color uses glass surface tints per LSDS.
class ShimmerPlaceholder extends StatefulWidget {
  /// Creates a [ShimmerPlaceholder].
  const ShimmerPlaceholder({
    super.key,
    required this.child,
    this.enabled = true,
  });

  /// The widget to overlay the shimmer effect on.
  final Widget child;

  /// When false, renders [child] without shimmer (content has loaded).
  final bool enabled;

  @override
  State<ShimmerPlaceholder> createState() => _ShimmerPlaceholderState();
}

class _ShimmerPlaceholderState extends State<ShimmerPlaceholder>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: AppDurations.shimmer,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.enabled) return widget.child;

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) => ShaderMask(
        blendMode: BlendMode.srcATop,
        shaderCallback: (bounds) => LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: const [
            Color(0x00FFFFFF),
            Color(0x1AFFFFFF),
            Color(0x33FFFFFF),
            Color(0x1AFFFFFF),
            Color(0x00FFFFFF),
          ],
          stops: [
            (_controller.value - 0.4).clamp(0.0, 1.0),
            (_controller.value - 0.2).clamp(0.0, 1.0),
            _controller.value.clamp(0.0, 1.0),
            (_controller.value + 0.2).clamp(0.0, 1.0),
            (_controller.value + 0.4).clamp(0.0, 1.0),
          ],
        ).createShader(bounds),
        child: child,
      ),
      child: widget.child,
    );
  }
}
