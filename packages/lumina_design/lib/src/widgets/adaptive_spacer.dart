import 'package:flutter/material.dart';

import '../adaptive/app_breakpoints.dart';
import '../tokens/colors/app_colors.dart';

/// A responsive spacer widget that adapts its size to the current breakpoint.
///
/// Replaces raw [SizedBox] calls in layouts so that spacing always derives
/// from the LSDS spacing system. For vertical spacing, use [AdaptiveSpacer.vertical];
/// for horizontal, use [AdaptiveSpacer.horizontal].
///
/// Example:
/// ```dart
/// Column(children: [
///   Text('Hello'),
///   const AdaptiveSpacer.vertical(compact: AppSpacing.md, expanded: AppSpacing.xl),
///   Text('World'),
/// ])
/// ```
class AdaptiveSpacer extends StatelessWidget {
  /// Creates a vertical adaptive spacer.
  const AdaptiveSpacer.vertical({
    super.key,
    required this.compact,
    this.medium,
    required this.expanded,
    this.ultra,
  }) : _axis = Axis.vertical;

  /// Creates a horizontal adaptive spacer.
  const AdaptiveSpacer.horizontal({
    super.key,
    required this.compact,
    this.medium,
    required this.expanded,
    this.ultra,
  }) : _axis = Axis.horizontal;

  final Axis _axis;

  /// Size on compact breakpoint.
  final double compact;

  /// Size on medium breakpoint. Defaults to lerp between [compact] and [expanded].
  final double? medium;

  /// Size on expanded breakpoint.
  final double expanded;

  /// Size on ultra breakpoint. Defaults to [expanded].
  final double? ultra;

  @override
  Widget build(BuildContext context) {
    final bp = AppBreakpoints.of(context);
    final size = switch (bp) {
      LuminaBreakpoint.compact => compact,
      LuminaBreakpoint.medium => medium ?? (compact + expanded) / 2,
      LuminaBreakpoint.expanded => expanded,
      LuminaBreakpoint.ultra => ultra ?? expanded,
    };

    return _axis == Axis.vertical
        ? SizedBox(height: size)
        : SizedBox(width: size);
  }
}

/// A standard horizontal or vertical divider following LSDS visual standards.
///
/// Uses [AppColors.borderDefault] as the divider color, with optional
/// leading/trailing insets via [indent] and [endIndent].
class LuminaDivider extends StatelessWidget {
  /// Creates a horizontal [LuminaDivider].
  const LuminaDivider.horizontal({
    super.key,
    this.indent,
    this.endIndent,
    this.thickness = 1.0,
  }) : _axis = Axis.horizontal;

  /// Creates a vertical [LuminaDivider].
  const LuminaDivider.vertical({
    super.key,
    this.indent,
    this.endIndent,
    this.thickness = 1.0,
  }) : _axis = Axis.vertical;

  final Axis _axis;

  /// Leading indent in logical pixels.
  final double? indent;

  /// Trailing indent in logical pixels.
  final double? endIndent;

  /// Divider line thickness.
  final double thickness;

  @override
  Widget build(BuildContext context) {
    // LSDS: border default is rgba(255,255,255,0.12)
    const dividerColor = AppColors.borderDefault;

    if (_axis == Axis.horizontal) {
      return Divider(
        height: thickness,
        thickness: thickness,
        indent: indent,
        endIndent: endIndent,
        color: dividerColor,
      );
    }

    return VerticalDivider(
      width: thickness,
      thickness: thickness,
      indent: indent,
      endIndent: endIndent,
      color: dividerColor,
    );
  }
}
