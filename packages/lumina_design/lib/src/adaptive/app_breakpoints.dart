import 'package:flutter/material.dart';

/// Lumina AI Breakpoint Token System.
enum LuminaBreakpoint { compact, medium, expanded, ultra }

@immutable
abstract final class AppBreakpoints {
  static const double compact = 0;
  static const double medium = 600;
  static const double expanded = 1024;
  static const double ultra = 1440;

  static LuminaBreakpoint resolve(double width) {
    if (width < medium) return LuminaBreakpoint.compact;
    if (width < expanded) return LuminaBreakpoint.medium;
    if (width < ultra) return LuminaBreakpoint.expanded;
    return LuminaBreakpoint.ultra;
  }

  static LuminaBreakpoint of(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return resolve(width);
  }
}
