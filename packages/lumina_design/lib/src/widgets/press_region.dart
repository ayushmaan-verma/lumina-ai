import 'package:flutter/material.dart';
import '../motion/motion_tokens.dart';

/// A widget that animates its child with a press-scale effect.
///
/// Applies [MotionTokens.pressScale] when pressed and restores on release.
/// Works on all platforms (touch and pointer).
class PressRegion extends StatefulWidget {
  const PressRegion({
    super.key,
    required this.child,
    this.scale = MotionTokens.pressScale,
    this.enabled = true,
    this.onTap,
    this.onLongPress,
  });

  final Widget child;
  final double scale;
  final bool enabled;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;

  @override
  State<PressRegion> createState() => _PressRegionState();
}

class _PressRegionState extends State<PressRegion>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: MotionTokens.pressDuration,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: widget.scale).animate(
      CurvedAnimation(parent: _controller, curve: MotionTokens.pressCurve),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onTapDown(TapDownDetails _) {
    if (widget.enabled) _controller.forward();
  }

  void _onTapUp(TapUpDetails _) {
    if (widget.enabled) _controller.reverse();
  }

  void _onTapCancel() {
    if (widget.enabled) _controller.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: _onTapCancel,
      onTap: widget.enabled ? widget.onTap : null,
      onLongPress: widget.enabled ? widget.onLongPress : null,
      child: ScaleTransition(scale: _scaleAnimation, child: widget.child),
    );
  }
}
