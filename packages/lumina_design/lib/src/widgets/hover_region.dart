import 'package:flutter/material.dart';
import '../adaptive/platform_type.dart';
import '../motion/motion_tokens.dart';

class HoverRegion extends StatefulWidget {
  const HoverRegion({
    super.key,
    required this.child,
    this.scale = MotionTokens.hoverScale,
    this.enabled = true,
  });

  final Widget child;
  final double scale;
  final bool enabled;

  @override
  State<HoverRegion> createState() => _HoverRegionState();
}

class _HoverRegionState extends State<HoverRegion>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: MotionTokens.hoverDuration,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: widget.scale).animate(
      CurvedAnimation(parent: _controller, curve: MotionTokens.hoverCurve),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onEnter(PointerEvent _) {
    if (widget.enabled && PlatformResolver.supportsHover) _controller.forward();
  }

  void _onExit(PointerEvent _) {
    if (widget.enabled && PlatformResolver.supportsHover) _controller.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: _onEnter,
      onExit: _onExit,
      child: ScaleTransition(scale: _scaleAnimation, child: widget.child),
    );
  }
}
