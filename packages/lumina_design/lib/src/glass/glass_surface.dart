import 'dart:ui';
import 'package:flutter/material.dart';
import '../adaptive/platform_type.dart';
import '../glass/glass_recipe.dart';
import '../tokens/colors/app_colors.dart';
import '../tokens/motion/app_curves.dart';
import '../tokens/motion/app_durations.dart';

/// A fully-featured glass surface widget that applies a [GlassRecipe]
/// and supports animated hover and press states on desktop.
///
/// Use this as the primary glass container for feature widgets.
/// Composes [GlassContainer] with interaction animation.
///
/// Example:
/// ```dart
/// GlassSurface(
///   recipe: GlassRecipe.card,
///   child: Text('Hello'),
/// )
/// ```
class GlassSurface extends StatefulWidget {
  /// Creates a [GlassSurface].
  const GlassSurface({
    super.key,
    required this.recipe,
    this.child,
    this.width,
    this.height,
    this.padding,
    this.margin,
    this.onTap,
    this.enableHover = true,
    this.enablePress = true,
    this.semanticLabel,
  });

  /// The glass recipe that defines blur, background, border, and shadow.
  final GlassRecipe recipe;

  /// Optional child widget.
  final Widget? child;

  /// Optional fixed width.
  final double? width;

  /// Optional fixed height.
  final double? height;

  /// Padding inside the glass container.
  final EdgeInsetsGeometry? padding;

  /// Margin outside the glass container.
  final EdgeInsetsGeometry? margin;

  /// Optional tap callback. When non-null, the surface is interactive.
  final VoidCallback? onTap;

  /// Whether to animate elevation on hover (desktop only).
  final bool enableHover;

  /// Whether to apply a press-scale animation on tap.
  final bool enablePress;

  /// Accessibility label for the surface.
  final String? semanticLabel;

  @override
  State<GlassSurface> createState() => _GlassSurfaceState();
}

class _GlassSurfaceState extends State<GlassSurface>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _hoverAnimation;

  bool _isHovered = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: AppDurations.hover,
    );
    _hoverAnimation = CurvedAnimation(
      parent: _controller,
      curve: AppCurves.hover,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onEnter(PointerEvent _) {
    if (widget.enableHover && PlatformResolver.supportsHover) {
      setState(() => _isHovered = true);
      _controller.forward();
    }
  }

  void _onExit(PointerEvent _) {
    if (widget.enableHover && PlatformResolver.supportsHover) {
      setState(() => _isHovered = false);
      _controller.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    final recipe = widget.recipe;

    Widget surface = _GlassContainer(
      recipe: recipe,
      width: widget.width,
      height: widget.height,
      padding: widget.padding,
      margin: widget.margin,
      isHovered: _isHovered,
      child: widget.child,
    );

    if (widget.onTap != null) {
      surface = GestureDetector(
        onTap: widget.onTap,
        child: surface,
      );
    }

    if (PlatformResolver.supportsHover && widget.enableHover) {
      surface = MouseRegion(
        cursor:
            widget.onTap != null ? SystemMouseCursors.click : MouseCursor.defer,
        onEnter: _onEnter,
        onExit: _onExit,
        child: AnimatedBuilder(
          animation: _hoverAnimation,
          builder: (context, child) => Transform.translate(
            offset: Offset(0, -_hoverAnimation.value * 4),
            child: child,
          ),
          child: surface,
        ),
      );
    }

    return Semantics(
      label: widget.semanticLabel,
      button: widget.onTap != null,
      child: surface,
    );
  }
}

class _GlassContainer extends StatelessWidget {
  const _GlassContainer({
    required this.recipe,
    this.child,
    this.width,
    this.height,
    this.padding,
    this.margin,
    required this.isHovered,
  });

  final GlassRecipe recipe;
  final Widget? child;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final bool isHovered;

  @override
  Widget build(BuildContext context) {
    final borderColor =
        isHovered ? AppColors.borderHover : AppColors.borderDefault;

    return Container(
      width: width,
      height: height,
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: recipe.borderRadius,
        border: Border.all(color: borderColor),
        boxShadow: recipe.shadows,
      ),
      child: ClipRRect(
        borderRadius: recipe.borderRadius,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: recipe.blur,
            sigmaY: recipe.blur,
          ),
          child: Container(
            width: width,
            height: height,
            padding: padding,
            decoration: BoxDecoration(
              color:
                  isHovered ? AppColors.surfaceHover : recipe.backgroundColor,
              borderRadius: recipe.borderRadius,
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
