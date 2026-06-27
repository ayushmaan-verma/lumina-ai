import 'package:flutter/material.dart';
import '../tokens/colors/app_colors.dart';
import '../tokens/icons/app_icon_sizes.dart';

/// A token-safe icon widget that enforces LSDS icon size and color standards.
///
/// Never use [Icon] directly in widgets. Use [LuminaIcon] instead to ensure
/// all icon sizes and colors originate from LSDS tokens.
class LuminaIcon extends StatelessWidget {
  const LuminaIcon(
    this.icon, {
    super.key,
    this.size = AppIconSizes.md,
    this.color = AppColors.textSecondary,
    this.semanticLabel,
  });

  final IconData icon;
  final double size;
  final Color color;
  final String? semanticLabel;

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      size: size,
      color: color,
      semanticLabel: semanticLabel,
    );
  }
}
