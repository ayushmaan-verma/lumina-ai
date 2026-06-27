import 'dart:ui';
import 'package:flutter/material.dart';
import '../surfaces/surface_level.dart';

/// A surface-aware container resolved from [SurfaceLevel].
class SurfaceContainer extends StatelessWidget {
  const SurfaceContainer({
    super.key,
    required this.level,
    this.child,
    this.width,
    this.height,
    this.padding,
    this.margin,
  });

  final SurfaceLevel level;
  final Widget? child;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    final style = SurfaceStyle.resolve(level);
    return Container(
      width: width,
      height: height,
      margin: margin,
      decoration: BoxDecoration(
        color: style.color,
        borderRadius: style.borderRadius,
        border: style.border,
        boxShadow: style.boxShadow,
      ),
      child: ClipRRect(
        borderRadius: style.borderRadius,
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: style.blur,
            sigmaY: style.blur,
          ),
          child: Padding(
            padding: padding ?? EdgeInsets.zero,
            child: child,
          ),
        ),
      ),
    );
  }
}
