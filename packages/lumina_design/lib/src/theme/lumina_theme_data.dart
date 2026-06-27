import 'package:flutter/material.dart';
import '../tokens/blur/app_blur.dart';
import '../tokens/colors/app_colors.dart';
import '../tokens/gradients/app_gradients.dart';
import '../tokens/motion/app_curves.dart';
import '../tokens/motion/app_durations.dart';
import '../tokens/opacity/app_opacity.dart';
import '../tokens/radius/app_radius.dart';
import '../tokens/shadows/app_shadows.dart';
import '../tokens/spacing/app_spacing.dart';
import '../tokens/typography/app_typography.dart';

/// The runtime design data object for the Lumina Spatial Design System.
@immutable
final class LuminaThemeData {
  const LuminaThemeData({
    required this.isDark,
    required this.colors,
    required this.typography,
    required this.spacing,
    required this.radius,
    required this.shadows,
    required this.durations,
    required this.curves,
    required this.blur,
    required this.opacity,
    required this.gradients,
  });

  final bool isDark;
  final LuminaColorTheme colors;
  final LuminaTypographyTheme typography;
  final LuminaSpacingTheme spacing;
  final LuminaRadiusTheme radius;
  final LuminaShadowTheme shadows;
  final LuminaDurationTheme durations;
  final LuminaCurveTheme curves;
  final LuminaBlurTheme blur;
  final LuminaOpacityTheme opacity;
  final LuminaGradientTheme gradients;

  factory LuminaThemeData.dark() => const LuminaThemeData(
        isDark: true,
        colors: LuminaColorTheme.dark(),
        typography: LuminaTypographyTheme(),
        spacing: LuminaSpacingTheme(),
        radius: LuminaRadiusTheme(),
        shadows: LuminaShadowTheme(),
        durations: LuminaDurationTheme(),
        curves: LuminaCurveTheme(),
        blur: LuminaBlurTheme(),
        opacity: LuminaOpacityTheme(),
        gradients: LuminaGradientTheme(),
      );

  factory LuminaThemeData.light() => const LuminaThemeData(
        isDark: false,
        colors: LuminaColorTheme.light(),
        typography: LuminaTypographyTheme(),
        spacing: LuminaSpacingTheme(),
        radius: LuminaRadiusTheme(),
        shadows: LuminaShadowTheme(),
        durations: LuminaDurationTheme(),
        curves: LuminaCurveTheme(),
        blur: LuminaBlurTheme(),
        opacity: LuminaOpacityTheme(),
        gradients: LuminaGradientTheme(),
      );

  LuminaThemeData copyWith({
    bool? isDark,
    LuminaColorTheme? colors,
    LuminaTypographyTheme? typography,
    LuminaSpacingTheme? spacing,
    LuminaRadiusTheme? radius,
    LuminaShadowTheme? shadows,
    LuminaDurationTheme? durations,
    LuminaCurveTheme? curves,
    LuminaBlurTheme? blur,
    LuminaOpacityTheme? opacity,
    LuminaGradientTheme? gradients,
  }) =>
      LuminaThemeData(
        isDark: isDark ?? this.isDark,
        colors: colors ?? this.colors,
        typography: typography ?? this.typography,
        spacing: spacing ?? this.spacing,
        radius: radius ?? this.radius,
        shadows: shadows ?? this.shadows,
        durations: durations ?? this.durations,
        curves: curves ?? this.curves,
        blur: blur ?? this.blur,
        opacity: opacity ?? this.opacity,
        gradients: gradients ?? this.gradients,
      );
}

@immutable
final class LuminaColorTheme {
  const LuminaColorTheme.dark()
      : primary = AppColors.primary,
        primaryHover = AppColors.primaryHover,
        primaryPressed = AppColors.primaryPressed,
        secondary = AppColors.secondary,
        accent = AppColors.accent,
        success = AppColors.success,
        warning = AppColors.warning,
        error = AppColors.error,
        info = AppColors.info,
        background = AppColors.background1,
        surface1 = AppColors.surface1,
        surface2 = AppColors.surface2,
        surface3 = AppColors.surface3,
        surfaceActive = AppColors.surfaceActive,
        surfaceHover = AppColors.surfaceHover,
        borderDefault = AppColors.borderDefault,
        borderFocused = AppColors.borderFocused,
        textPrimary = AppColors.textPrimary,
        textSecondary = AppColors.textSecondary,
        textTertiary = AppColors.textTertiary,
        textDisabled = AppColors.textDisabled;

  const LuminaColorTheme.light()
      : primary = AppColors.primary,
        primaryHover = AppColors.primaryHover,
        primaryPressed = AppColors.primaryPressed,
        secondary = AppColors.secondary,
        accent = AppColors.accent,
        success = AppColors.success,
        warning = AppColors.warning,
        error = AppColors.error,
        info = AppColors.info,
        background = const Color(0xFFF8FAFC),
        surface1 = const Color(0x0A000000),
        surface2 = const Color(0x0F000000),
        surface3 = const Color(0x14000000),
        surfaceActive = const Color(0x1A000000),
        surfaceHover = const Color(0x0D000000),
        borderDefault = const Color(0x1A000000),
        borderFocused = AppColors.borderFocused,
        textPrimary = const Color(0xFF0F172A),
        textSecondary = const Color(0xFF475569),
        textTertiary = const Color(0xFF94A3B8),
        textDisabled = const Color(0xFFCBD5E1);

  final Color primary;
  final Color primaryHover;
  final Color primaryPressed;
  final Color secondary;
  final Color accent;
  final Color success;
  final Color warning;
  final Color error;
  final Color info;
  final Color background;
  final Color surface1;
  final Color surface2;
  final Color surface3;
  final Color surfaceActive;
  final Color surfaceHover;
  final Color borderDefault;
  final Color borderFocused;
  final Color textPrimary;
  final Color textSecondary;
  final Color textTertiary;
  final Color textDisabled;
}

@immutable
final class LuminaTypographyTheme {
  const LuminaTypographyTheme();
  TextStyle get displayXl => AppTypography.displayXl;
  TextStyle get displayL => AppTypography.displayL;
  TextStyle get displayM => AppTypography.displayM;
  TextStyle get heading1 => AppTypography.heading1;
  TextStyle get heading2 => AppTypography.heading2;
  TextStyle get heading3 => AppTypography.heading3;
  TextStyle get title => AppTypography.title;
  TextStyle get subtitle => AppTypography.subtitle;
  TextStyle get body => AppTypography.body;
  TextStyle get bodySmall => AppTypography.bodySmall;
  TextStyle get labelLarge => AppTypography.labelLarge;
  TextStyle get labelMedium => AppTypography.labelMedium;
  TextStyle get caption => AppTypography.caption;
  TextStyle get micro => AppTypography.micro;
  TextStyle get mono => AppTypography.mono;
  TextStyle get code => AppTypography.code;
}

@immutable
final class LuminaSpacingTheme {
  const LuminaSpacingTheme();
  double get tiny => AppSpacing.tiny;
  double get small => AppSpacing.small;
  double get compact => AppSpacing.compact;
  double get comfortable => AppSpacing.comfortable;
  double get relaxed => AppSpacing.relaxed;
  double get large => AppSpacing.large;
  double get hero => AppSpacing.hero;
  double get cinematic => AppSpacing.cinematic;
}

@immutable
final class LuminaRadiusTheme {
  const LuminaRadiusTheme();
  double get small => AppRadius.small;
  double get medium => AppRadius.medium;
  double get large => AppRadius.large;
  double get xl => AppRadius.xl;
  double get pill => AppRadius.pill;
  double get card => AppRadius.card;
  double get dialog => AppRadius.dialog;
  double get button => AppRadius.button;
  double get input => AppRadius.input;
}

@immutable
final class LuminaShadowTheme {
  const LuminaShadowTheme();
  List<BoxShadow> get small => AppShadows.small;
  List<BoxShadow> get medium => AppShadows.medium;
  List<BoxShadow> get large => AppShadows.large;
  List<BoxShadow> get hero => AppShadows.hero;
  List<BoxShadow> get floating => AppShadows.floating;
  List<BoxShadow> get glowPrimary => AppShadows.glowPrimary;
  List<BoxShadow> get glowSecondary => AppShadows.glowSecondary;
  List<BoxShadow> get glowAccent => AppShadows.glowAccent;
  List<BoxShadow> get glowSuccess => AppShadows.glowSuccess;
  List<BoxShadow> get glowWarning => AppShadows.glowWarning;
  List<BoxShadow> get glowError => AppShadows.glowError;
}

@immutable
final class LuminaDurationTheme {
  const LuminaDurationTheme();
  Duration get fast => AppDurations.fast;
  Duration get standard => AppDurations.standard;
  Duration get medium => AppDurations.medium;
  Duration get slow => AppDurations.slow;
  Duration get hero => AppDurations.hero;
  Duration get hover => AppDurations.hover;
  Duration get press => AppDurations.press;
  Duration get pageTransition => AppDurations.pageTransition;
}

@immutable
final class LuminaCurveTheme {
  const LuminaCurveTheme();
  Curve get standard => AppCurves.standard;
  Curve get navigation => AppCurves.navigation;
  Curve get hover => AppCurves.hover;
  Curve get modal => AppCurves.modal;
  Curve get emphasized => AppCurves.emphasized;
}

@immutable
final class LuminaBlurTheme {
  const LuminaBlurTheme();
  double get small => AppBlur.small;
  double get medium => AppBlur.medium;
  double get large => AppBlur.large;
  double get hero => AppBlur.hero;
  double get overlay => AppBlur.overlay;
  double get navigation => AppBlur.navigation;
  double get card => AppBlur.card;
  double get workspacePanel => AppBlur.workspacePanel;
  double get dialog => AppBlur.dialog;
}

@immutable
final class LuminaOpacityTheme {
  const LuminaOpacityTheme();
  double get disabled => AppOpacity.disabled;
  double get hover => AppOpacity.hover;
  double get pressed => AppOpacity.pressed;
  double get glassMd => AppOpacity.glassMd;
  double get glassLg => AppOpacity.glassLg;
  double get glassXl => AppOpacity.glassXl;
}

@immutable
final class LuminaGradientTheme {
  const LuminaGradientTheme();
  LinearGradient get aurora => AppGradients.aurora;
  LinearGradient get nebula => AppGradients.nebula;
  LinearGradient get ocean => AppGradients.ocean;
  LinearGradient get galaxy => AppGradients.galaxy;
  LinearGradient get backgroundDark => AppGradients.backgroundDark;
  LinearGradient get glassBorder => AppGradients.glassBorder;
}
