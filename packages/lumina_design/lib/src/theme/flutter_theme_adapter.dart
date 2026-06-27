import 'package:flutter/material.dart';
import '../tokens/colors/app_colors.dart';
import '../tokens/radius/app_radius.dart';
import '../tokens/typography/app_typography.dart';
import 'lumina_theme_data.dart';

/// Bridges [LuminaThemeData] to Flutter's [ThemeData].
final class FlutterThemeAdapter {
  FlutterThemeAdapter._();

  static ThemeData fromLumina(LuminaThemeData lumina) {
    final colors = lumina.colors;
    return ThemeData(
      useMaterial3: true,
      brightness: lumina.isDark ? Brightness.dark : Brightness.light,
      colorScheme: ColorScheme(
        brightness: lumina.isDark ? Brightness.dark : Brightness.light,
        primary: colors.primary,
        onPrimary: AppColors.textPrimary,
        secondary: colors.secondary,
        onSecondary: AppColors.textPrimary,
        error: colors.error,
        onError: AppColors.textPrimary,
        surface: colors.surface2,
        onSurface: colors.textPrimary,
      ),
      scaffoldBackgroundColor: colors.background,
      textTheme: TextTheme(
        displayLarge: AppTypography.displayXl,
        displayMedium: AppTypography.displayL,
        displaySmall: AppTypography.displayM,
        headlineLarge: AppTypography.heading1,
        headlineMedium: AppTypography.heading2,
        headlineSmall: AppTypography.heading3,
        titleLarge: AppTypography.title,
        titleMedium: AppTypography.subtitle,
        bodyLarge: AppTypography.body,
        bodyMedium: AppTypography.bodySmall,
        labelLarge: AppTypography.labelLarge,
        labelMedium: AppTypography.labelMedium,
        labelSmall: AppTypography.caption,
      ),
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
      cardTheme: CardThemeData(
        color: colors.surface2,
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: AppRadius.cardRadius,
        ),
      ),
    );
  }
}
