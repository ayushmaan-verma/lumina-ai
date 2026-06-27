import 'dart:ui';
import 'package:flutter/material.dart';
import '../glass/glass_recipe.dart';
import '../tokens/colors/app_colors.dart';
import '../tokens/shadows/app_shadows.dart';

/// A helper that builds a [BoxDecoration] from a [GlassRecipe].
///
/// Use [GlassDecoration.fromRecipe] to obtain a glass decoration without
/// manually configuring [BackdropFilter], [ImageFilter], and borders.
///
/// This decoration is for use with [Container]. For a widget with blur,
/// wrap with [GlassContainer] or [GlassSurface] instead.
@immutable
final class GlassDecoration {
  const GlassDecoration._();

  /// Builds a [BoxDecoration] representing the glass visual layer
  /// (background color, border, border radius, shadow) from [recipe].
  ///
  /// The blur must be applied separately using [BackdropFilter].
  static BoxDecoration fromRecipe(GlassRecipe recipe) => BoxDecoration(
        color: recipe.backgroundColor,
        borderRadius: recipe.borderRadius,
        border: recipe.border,
        boxShadow: recipe.shadows,
      );

  /// The standard navigation glass decoration (Recipe A from LSDS section 28).
  static BoxDecoration get navigation => fromRecipe(GlassRecipe.navigation);

  /// The standard card glass decoration (Recipe B).
  static BoxDecoration get card => fromRecipe(GlassRecipe.card);

  /// The workspace panel glass decoration (Recipe C).
  static BoxDecoration get workspacePanel =>
      fromRecipe(GlassRecipe.workspacePanel);

  /// The dialog glass decoration (Recipe D).
  static BoxDecoration get dialog => fromRecipe(GlassRecipe.dialog);

  /// The spotlight glass decoration (Recipe E).
  static BoxDecoration get spotlight => fromRecipe(GlassRecipe.spotlight);

  /// Creates an [ImageFilter] for the given [sigmaBlur] value.
  ///
  /// Convenience method to create a consistent blur filter from a token value.
  static ImageFilter blurFilter(double sigmaBlur) =>
      ImageFilter.blur(sigmaX: sigmaBlur, sigmaY: sigmaBlur);

  /// Creates a glow [BoxShadow] for the primary brand color.
  static BoxShadow primaryGlow({double blurRadius = 32}) => BoxShadow(
        color: AppColors.glowPrimary,
        blurRadius: blurRadius,
        spreadRadius: -4,
      );

  /// Creates a glow [BoxShadow] for the secondary brand color.
  static BoxShadow secondaryGlow({double blurRadius = 32}) => BoxShadow(
        color: AppColors.glowSecondary,
        blurRadius: blurRadius,
        spreadRadius: -4,
      );

  /// Creates a glow [BoxShadow] for the accent color.
  static BoxShadow accentGlow({double blurRadius = 32}) => BoxShadow(
        color: AppColors.glowAccent,
        blurRadius: blurRadius,
        spreadRadius: -4,
      );

  /// Creates a gradient border decoration suitable for glass panels.
  ///
  /// The gradient runs from top-left (slightly brighter) to bottom-right
  /// following the LSDS lighting model (section 29).
  static BoxDecoration gradientBorder({
    required BorderRadius borderRadius,
    List<BoxShadow>? shadows,
  }) =>
      BoxDecoration(
        borderRadius: borderRadius,
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0x33FFFFFF), // top-left highlight
            Color(0x0DFFFFFF), // bottom-right fade
          ],
        ),
        boxShadow: shadows ?? AppShadows.small,
      );
}
