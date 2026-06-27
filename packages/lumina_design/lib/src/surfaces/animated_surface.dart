import 'package:flutter/material.dart';
import '../surfaces/surface_level.dart';
import '../tokens/colors/app_colors.dart';
import '../tokens/motion/app_curves.dart';
import '../tokens/motion/app_durations.dart';

/// An animated container that transitions between [SurfaceStyle] values.
///
/// Use this widget when a surface needs to smoothly transition between
/// states (e.g., default → hover → active). All transition timing values
/// originate from LSDS motion tokens.
///
/// Example:
/// ```dart
/// AnimatedSurface(
///   level: isActive ? SurfaceLevel.floating : SurfaceLevel.card,
///   child: content,
/// )
/// ```
class AnimatedSurface extends StatelessWidget {
  /// Creates an [AnimatedSurface].
  const AnimatedSurface({
    super.key,
    required this.level,
    this.child,
    this.width,
    this.height,
    this.padding,
    this.margin,
    this.duration,
    this.curve,
  });

  /// The target surface level. Changing this triggers an animated transition.
  final SurfaceLevel level;

  /// Optional child widget.
  final Widget? child;

  /// Optional fixed width.
  final double? width;

  /// Optional fixed height.
  final double? height;

  /// Padding inside the surface.
  final EdgeInsetsGeometry? padding;

  /// Margin outside the surface.
  final EdgeInsetsGeometry? margin;

  /// Override transition duration. Defaults to [AppDurations.standard].
  final Duration? duration;

  /// Override animation curve. Defaults to [AppCurves.standard].
  final Curve? curve;

  @override
  Widget build(BuildContext context) {
    final style = SurfaceStyle.resolve(level);

    return AnimatedContainer(
      width: width,
      height: height,
      duration: duration ?? AppDurations.standard,
      curve: curve ?? AppCurves.standard,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        color: style.color,
        borderRadius: style.borderRadius,
        border: style.border,
        boxShadow: style.boxShadow,
      ),
      child: child,
    );
  }
}

/// A pressable surface that animates between interaction states.
///
/// Wraps a child with the given [SurfaceLevel] decoration and applies
/// an animated color/border change on hover and press using [AnimatedContainer].
class PressableSurface extends StatefulWidget {
  /// Creates a [PressableSurface].
  const PressableSurface({
    super.key,
    required this.level,
    this.child,
    this.onTap,
    this.onLongPress,
    this.padding,
    this.margin,
    this.width,
    this.height,
    this.enabled = true,
    this.semanticLabel,
  });

  /// The base surface level.
  final SurfaceLevel level;

  /// Optional child widget.
  final Widget? child;

  /// Optional tap callback.
  final VoidCallback? onTap;

  /// Optional long-press callback.
  final VoidCallback? onLongPress;

  /// Padding inside the surface.
  final EdgeInsetsGeometry? padding;

  /// Margin outside the surface.
  final EdgeInsetsGeometry? margin;

  /// Optional fixed width.
  final double? width;

  /// Optional fixed height.
  final double? height;

  /// When false, tap callbacks are disabled and the surface appears muted.
  final bool enabled;

  /// Accessibility label.
  final String? semanticLabel;

  @override
  State<PressableSurface> createState() => _PressableSurfaceState();
}

class _PressableSurfaceState extends State<PressableSurface> {
  bool _isPressed = false;

  void _onTapDown(TapDownDetails _) {
    if (widget.enabled) setState(() => _isPressed = true);
  }

  void _onTapUp(TapUpDetails _) {
    if (widget.enabled) setState(() => _isPressed = false);
  }

  void _onTapCancel() {
    if (widget.enabled) setState(() => _isPressed = false);
  }

  @override
  Widget build(BuildContext context) {
    final style = SurfaceStyle.resolve(widget.level);
    final color = _isPressed ? AppColors.surfacePressed : style.color;

    return Semantics(
      label: widget.semanticLabel,
      button: widget.onTap != null,
      enabled: widget.enabled,
      child: GestureDetector(
        onTapDown: _onTapDown,
        onTapUp: _onTapUp,
        onTapCancel: _onTapCancel,
        onTap: widget.enabled ? widget.onTap : null,
        onLongPress: widget.enabled ? widget.onLongPress : null,
        child: AnimatedContainer(
          width: widget.width,
          height: widget.height,
          duration: AppDurations.press,
          curve: AppCurves.standard,
          margin: widget.margin,
          padding: widget.padding,
          decoration: BoxDecoration(
            color: color,
            borderRadius: style.borderRadius,
            border: style.border,
            boxShadow: style.boxShadow,
          ),
          child: widget.child,
        ),
      ),
    );
  }
}
