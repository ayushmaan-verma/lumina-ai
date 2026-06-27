import 'package:flutter/material.dart';
import '../tokens/blur/app_blur.dart';
import '../tokens/borders/app_borders.dart';
import '../tokens/colors/app_colors.dart';
import '../tokens/radius/app_radius.dart';
import '../tokens/shadows/app_shadows.dart';

@immutable
final class GlassRecipe {
  const GlassRecipe({
    required this.blur,
    required this.backgroundColor,
    required this.border,
    required this.borderRadius,
    required this.shadows,
    this.enableGlow = false,
  });

  final double blur;
  final Color backgroundColor;
  final Border border;
  final BorderRadius borderRadius;
  final List<BoxShadow> shadows;
  final bool enableGlow;

  static const GlassRecipe navigation = GlassRecipe(
    blur: AppBlur.navigation,
    backgroundColor: AppColors.surface2,
    border: AppBorders.defaultBorder,
    borderRadius: AppRadius.largeRadius,
    shadows: [],
  );

  static const GlassRecipe card = GlassRecipe(
    blur: AppBlur.card,
    backgroundColor: AppColors.surface2,
    border: AppBorders.defaultBorder,
    borderRadius: AppRadius.cardRadius,
    shadows: AppShadows.small,
  );

  static const GlassRecipe workspacePanel = GlassRecipe(
    blur: AppBlur.workspacePanel,
    backgroundColor: AppColors.surface3,
    border: AppBorders.defaultBorder,
    borderRadius: AppRadius.canvasRadius,
    shadows: AppShadows.large,
  );

  static const GlassRecipe dialog = GlassRecipe(
    blur: AppBlur.dialog,
    backgroundColor: Color(0x29FFFFFF),
    border: AppBorders.defaultBorder,
    borderRadius: AppRadius.dialogRadius,
    shadows: AppShadows.hero,
  );

  static const GlassRecipe spotlight = GlassRecipe(
    blur: AppBlur.spotlight,
    backgroundColor: Color(0x29FFFFFF),
    border: AppBorders.hoverBorder,
    borderRadius: AppRadius.xlRadius,
    shadows: AppShadows.hero,
    enableGlow: true,
  );
}
