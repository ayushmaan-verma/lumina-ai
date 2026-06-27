import 'dart:ui';
import 'package:flutter/material.dart';
import '../glass/glass_recipe.dart';

/// A glass-morphism container that applies a [GlassRecipe].
class GlassContainer extends StatelessWidget {
  const GlassContainer({
    super.key,
    required this.recipe,
    this.child,
    this.width,
    this.height,
    this.padding,
    this.margin,
    this.clipBehavior = Clip.antiAliasWithSaveLayer,
  });

  final GlassRecipe recipe;
  final Widget? child;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Clip clipBehavior;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: recipe.borderRadius,
        border: recipe.border,
        boxShadow: recipe.shadows,
      ),
      child: ClipRRect(
        borderRadius: recipe.borderRadius,
        clipBehavior: clipBehavior,
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: recipe.blur,
            sigmaY: recipe.blur,
          ),
          child: Container(
            width: width,
            height: height,
            padding: padding,
            decoration: BoxDecoration(
              color: recipe.backgroundColor,
              borderRadius: recipe.borderRadius,
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
