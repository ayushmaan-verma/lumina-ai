import 'package:flutter/material.dart';

/// Color utility extensions for the Lumina Design System.
///
/// Provides semantic wrappers around common color operations so that
/// intent is clear at the call site.
extension LuminaColorX on Color {
  /// Applies an opacity from an LSDS opacity token to this color.
  ///
  /// The [opacity] value should come from [AppOpacity].
  Color withOpacityToken(double opacity) => withValues(alpha: opacity);

  /// Converts this color to a glass tint with the given [opacity].
  ///
  /// The [opacity] value should come from [AppOpacity] glass constants.
  Color toGlassColor(double opacity) => withValues(alpha: opacity);

  /// Creates a new color with the given alpha channel [alpha] (0–255).
  Color withLuminaAlpha(int alpha) => withValues(alpha: alpha / 255.0);
}

/// BoxShadow utility extensions for the Lumina Design System.
extension LuminaBoxShadowX on BoxShadow {
  /// Returns a new [BoxShadow] with [blurRadius] and [spreadRadius] scaled
  /// by [scale].
  ///
  /// Useful for hover lift effects where shadows should grow proportionally.
  BoxShadow withScale(double scale) => BoxShadow(
        color: color,
        offset: offset,
        blurRadius: blurRadius * scale,
        spreadRadius: spreadRadius * scale,
        blurStyle: blurStyle,
      );
}
