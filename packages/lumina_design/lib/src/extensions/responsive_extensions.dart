import 'package:flutter/material.dart';
import '../adaptive/app_breakpoints.dart';

/// Additional responsive BuildContext extensions.
///
/// Use [adaptiveValue] to supply per-breakpoint values without
/// manual switch statements in feature widgets.
extension LuminaResponsiveBuildContextX on BuildContext {
  /// Returns a breakpoint-aware value.
  ///
  /// [ultra] falls back to [expanded] when not provided.
  T adaptiveValue<T>({
    required T compact,
    required T medium,
    required T expanded,
    T? ultra,
  }) =>
      LuminaResponsive.adaptiveValue(
        this,
        compact: compact,
        medium: medium,
        expanded: expanded,
        ultra: ultra,
      );
}

/// Static helpers for breakpoint-aware layout calculations.
///
/// Provides recommended panel widths, sidebar widths, and canvas fractions
/// derived from the LSDS adaptive layout specification.
@immutable
abstract final class LuminaResponsive {
  /// Returns a value mapped to the current breakpoint.
  ///
  /// If [ultra] is null, [expanded] is used for the ultra breakpoint.
  static T adaptiveValue<T>(
    BuildContext context, {
    required T compact,
    required T medium,
    required T expanded,
    T? ultra,
  }) {
    final bp = AppBreakpoints.of(context);
    return switch (bp) {
      LuminaBreakpoint.compact => compact,
      LuminaBreakpoint.medium => medium,
      LuminaBreakpoint.expanded => expanded,
      LuminaBreakpoint.ultra => ultra ?? expanded,
    };
  }

  /// Recommended AI context panel width for the current breakpoint.
  ///
  /// Returns 0 for breakpoints where the panel is hidden (compact/medium).
  static double panelWidth(BuildContext context) {
    final bp = AppBreakpoints.of(context);
    return switch (bp) {
      LuminaBreakpoint.compact => 0.0,
      LuminaBreakpoint.medium => 0.0,
      LuminaBreakpoint.expanded => 300.0,
      LuminaBreakpoint.ultra => 340.0,
    };
  }

  /// Recommended sidebar width for the current breakpoint.
  ///
  /// Returns 0 on compact (sidebar is hidden), 64 on medium (rail only),
  /// and full sidebar widths on expanded/ultra.
  static double sidebarWidth(BuildContext context) {
    final bp = AppBreakpoints.of(context);
    return switch (bp) {
      LuminaBreakpoint.compact => 0.0,
      LuminaBreakpoint.medium => 64.0,
      LuminaBreakpoint.expanded => 240.0,
      LuminaBreakpoint.ultra => 280.0,
    };
  }

  /// The fraction of total width that the Workspace Canvas should occupy.
  ///
  /// Based on LSDS specification: phone=100%, tablet=80%, desktop=58%.
  static double canvasWidthFraction(LuminaBreakpoint bp) => switch (bp) {
        LuminaBreakpoint.compact => 1.0,
        LuminaBreakpoint.medium => 0.80,
        LuminaBreakpoint.expanded => 0.58,
        LuminaBreakpoint.ultra => 0.58,
      };
}
