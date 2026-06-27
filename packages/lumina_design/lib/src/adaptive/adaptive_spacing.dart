import 'package:flutter/material.dart';

import '../tokens/spacing/app_spacing.dart';
import 'app_breakpoints.dart';

@immutable
final class AdaptiveSpacing {
  const AdaptiveSpacing._(this._breakpoint);

  final LuminaBreakpoint _breakpoint;

  static AdaptiveSpacing of(BuildContext context) =>
      AdaptiveSpacing._(AppBreakpoints.of(context));

  double get pagePadding => switch (_breakpoint) {
        LuminaBreakpoint.compact => AppSpacing.md,
        LuminaBreakpoint.medium => AppSpacing.xl,
        LuminaBreakpoint.expanded => AppSpacing.xxl,
        LuminaBreakpoint.ultra => AppSpacing.xxxl,
      };

  double get sectionGap => switch (_breakpoint) {
        LuminaBreakpoint.compact => AppSpacing.xl,
        LuminaBreakpoint.medium => AppSpacing.xxl,
        LuminaBreakpoint.expanded => AppSpacing.xxxl,
        LuminaBreakpoint.ultra => AppSpacing.s48,
      };

  double get cardPadding => switch (_breakpoint) {
        LuminaBreakpoint.compact => AppSpacing.md,
        LuminaBreakpoint.medium => AppSpacing.xl,
        LuminaBreakpoint.expanded => AppSpacing.xl,
        LuminaBreakpoint.ultra => AppSpacing.xxl,
      };
}
