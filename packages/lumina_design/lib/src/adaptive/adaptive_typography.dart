import 'package:flutter/material.dart';
import 'app_breakpoints.dart';

/// Provides breakpoint-aware typography scale adjustments.
///
/// On mobile ([LuminaBreakpoint.compact]) display and heading sizes scale
/// down proportionally to maintain visual balance without overwhelming the
/// smaller canvas. Body and label sizes remain constant across breakpoints.
@immutable
final class AdaptiveTypography {
  const AdaptiveTypography._(this._breakpoint);

  final LuminaBreakpoint _breakpoint;

  /// Resolves adaptive typography from [context].
  static AdaptiveTypography of(BuildContext context) =>
      AdaptiveTypography._(AppBreakpoints.of(context));

  /// Scale factor applied to display-level type on the current breakpoint.
  double get displayScale => switch (_breakpoint) {
        LuminaBreakpoint.compact => 0.75,
        LuminaBreakpoint.medium => 0.875,
        LuminaBreakpoint.expanded => 1.0,
        LuminaBreakpoint.ultra => 1.0,
      };

  /// Scale factor applied to heading-level type on the current breakpoint.
  double get headingScale => switch (_breakpoint) {
        LuminaBreakpoint.compact => 0.85,
        LuminaBreakpoint.medium => 0.925,
        LuminaBreakpoint.expanded => 1.0,
        LuminaBreakpoint.ultra => 1.0,
      };

  /// Whether compact line heights should be used on this breakpoint.
  bool get useCompactLineHeight => _breakpoint == LuminaBreakpoint.compact;

  /// Returns [base] scaled for display text at the current breakpoint.
  TextStyle scaledDisplay(TextStyle base) => base.copyWith(
        fontSize: (base.fontSize ?? 40) * displayScale,
      );

  /// Returns [base] scaled for heading text at the current breakpoint.
  TextStyle scaledHeading(TextStyle base) => base.copyWith(
        fontSize: (base.fontSize ?? 24) * headingScale,
      );
}
