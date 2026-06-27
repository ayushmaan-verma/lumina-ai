import 'package:flutter/material.dart';
import '../tokens/blur/app_blur.dart';
import '../tokens/borders/app_borders.dart';
import '../tokens/colors/app_colors.dart';
import '../tokens/radius/app_radius.dart';
import '../tokens/shadows/app_shadows.dart';

enum SurfaceLevel {
  background,
  card,
  floating,
  dialog,
  workspaceOverlay,
  modal
}

@immutable
final class SurfaceStyle {
  const SurfaceStyle({
    required this.color,
    required this.blur,
    required this.border,
    required this.boxShadow,
    required this.borderRadius,
  });

  final Color color;
  final double blur;
  final Border border;
  final List<BoxShadow> boxShadow;
  final BorderRadius borderRadius;

  static SurfaceStyle resolve(SurfaceLevel level) => switch (level) {
        SurfaceLevel.background => const SurfaceStyle(
            color: AppColors.background1,
            blur: 0,
            border: AppBorders.noneBorder,
            boxShadow: [],
            borderRadius: BorderRadius.zero,
          ),
        SurfaceLevel.card => const SurfaceStyle(
            color: AppColors.surface2,
            blur: AppBlur.card,
            border: AppBorders.defaultBorder,
            boxShadow: AppShadows.small,
            borderRadius: AppRadius.cardRadius,
          ),
        SurfaceLevel.floating => const SurfaceStyle(
            color: AppColors.surface3,
            blur: AppBlur.workspacePanel,
            border: AppBorders.defaultBorder,
            boxShadow: AppShadows.floating,
            borderRadius: AppRadius.largeRadius,
          ),
        SurfaceLevel.dialog => const SurfaceStyle(
            color: Color(0x29FFFFFF),
            blur: AppBlur.dialog,
            border: AppBorders.defaultBorder,
            boxShadow: AppShadows.hero,
            borderRadius: AppRadius.dialogRadius,
          ),
        SurfaceLevel.workspaceOverlay => const SurfaceStyle(
            color: AppColors.surfaceActive,
            blur: AppBlur.overlay,
            border: AppBorders.defaultBorder,
            boxShadow: AppShadows.large,
            borderRadius: AppRadius.canvasRadius,
          ),
        SurfaceLevel.modal => const SurfaceStyle(
            color: Color(0x2EFFFFFF),
            blur: AppBlur.overlay,
            border: AppBorders.defaultBorder,
            boxShadow: AppShadows.hero,
            borderRadius: AppRadius.dialogRadius,
          ),
      };
}
