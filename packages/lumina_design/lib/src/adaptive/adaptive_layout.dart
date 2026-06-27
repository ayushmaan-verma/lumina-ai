import 'package:flutter/material.dart';
import 'app_breakpoints.dart';

/// A widget that renders different layouts based on the current breakpoint.
///
/// Use this widget in feature pages instead of inline [MediaQuery] width
/// checks. Provide at minimum [compact] and [expanded] builders.
/// Omitted breakpoints fall back to the nearest smaller breakpoint.
///
/// Example:
/// ```dart
/// AdaptiveLayout(
///   compact: (context) => const MobileView(),
///   expanded: (context) => const DesktopView(),
/// )
/// ```
class AdaptiveLayout extends StatelessWidget {
  /// Creates an [AdaptiveLayout].
  ///
  /// [compact] and [expanded] are required. [medium] defaults to [compact]
  /// and [ultra] defaults to [expanded] when not provided.
  const AdaptiveLayout({
    super.key,
    required this.compact,
    this.medium,
    required this.expanded,
    this.ultra,
  });

  /// Builder for compact (phone) breakpoint.
  final WidgetBuilder compact;

  /// Builder for medium (tablet) breakpoint. Defaults to [compact].
  final WidgetBuilder? medium;

  /// Builder for expanded (desktop) breakpoint.
  final WidgetBuilder expanded;

  /// Builder for ultra (large monitor) breakpoint. Defaults to [expanded].
  final WidgetBuilder? ultra;

  @override
  Widget build(BuildContext context) {
    final bp = AppBreakpoints.of(context);
    return switch (bp) {
      LuminaBreakpoint.compact => compact(context),
      LuminaBreakpoint.medium => (medium ?? compact)(context),
      LuminaBreakpoint.expanded => expanded(context),
      LuminaBreakpoint.ultra => (ultra ?? expanded)(context),
    };
  }
}
