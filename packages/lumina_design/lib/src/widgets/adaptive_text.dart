import 'package:flutter/material.dart';

import '../tokens/colors/app_colors.dart';
import '../tokens/spacing/app_spacing.dart';
import '../tokens/typography/app_typography.dart';

/// An adaptive text widget that enforces the LSDS typography system.
///
/// Never use [Text] with ad-hoc [TextStyle] in Lumina widgets.
/// Use [AdaptiveText] with a semantic style getter from [AppTypography].
///
/// Example:
/// ```dart
/// AdaptiveText(
///   'Hello World',
///   style: AppTypography.heading2,
/// )
/// ```
class AdaptiveText extends StatelessWidget {
  /// Creates an [AdaptiveText].
  const AdaptiveText(
    this.text, {
    super.key,
    required this.style,
    this.maxLines,
    this.overflow = TextOverflow.ellipsis,
    this.textAlign,
    this.semanticsLabel,
  });

  /// The text to display.
  final String text;

  /// The LSDS-sourced [TextStyle].
  final TextStyle style;

  /// Maximum number of lines.
  final int? maxLines;

  /// Overflow behaviour. Defaults to [TextOverflow.ellipsis].
  final TextOverflow overflow;

  /// Text alignment.
  final TextAlign? textAlign;

  /// Accessibility override for the text content.
  final String? semanticsLabel;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
      maxLines: maxLines,
      overflow: overflow,
      textAlign: textAlign,
      semanticsLabel: semanticsLabel,
    );
  }
}

/// A section header widget that renders a label and optional action.
///
/// Used to denote top-level sections within a panel or page.
/// Typography and spacing originate from LSDS tokens.
///
/// Example:
/// ```dart
/// SectionHeader(
///   label: 'Recent Workspaces',
///   action: TextButton(onPressed: () {}, child: Text('See all')),
/// )
/// ```
class SectionHeader extends StatelessWidget {
  /// Creates a [SectionHeader].
  const SectionHeader({
    super.key,
    required this.label,
    this.action,
    this.padding,
  });

  /// The section label text.
  final String label;

  /// Optional trailing action widget (e.g., a "See all" button).
  final Widget? action;

  /// Padding around the header. Defaults to vertical AppSpacing.xs.
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.symmetric(vertical: AppSpacing.xs),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              label.toUpperCase(),
              style: AppTypography.micro.copyWith(
                letterSpacing: 0.08,
                color: AppColors.textTertiary,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          if (action != null) action!,
        ],
      ),
    );
  }
}
