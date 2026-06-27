import 'dart:ui';
import 'package:flutter/material.dart';
import '../tokens/blur/app_blur.dart';
import '../tokens/colors/app_colors.dart';
import '../tokens/gradients/app_gradients.dart';

/// A full-screen animated glass background for Lumina AI scenes.
///
/// Renders the multi-layer background environment described in LSDS section 27:
/// - Layer 1: Dark foundation
/// - Layer 2: Static gradient (ambient mesh gradient simulation)
/// - Layer 3: Soft vignette overlay
///
/// Note: The floating light orbs described in the spec are implemented as a
/// separate ambient animation layer to keep this widget under 200 lines and
/// maintain separation of concerns.
class GlassBackground extends StatelessWidget {
  /// Creates a [GlassBackground].
  ///
  /// [child] is rendered on top of the background layers.
  const GlassBackground({
    super.key,
    this.child,
    this.gradient,
    this.showVignette = true,
  });

  /// Optional child widget rendered above the background.
  final Widget? child;

  /// Override gradient. Defaults to [AppGradients.backgroundDark].
  final Gradient? gradient;

  /// Whether to render a soft vignette edge effect.
  final bool showVignette;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        // Layer 1: Dark foundation
        const ColoredBox(color: AppColors.background0),

        // Layer 2: Ambient gradient
        DecoratedBox(
          decoration: BoxDecoration(
            gradient: gradient ?? AppGradients.backgroundDark,
          ),
        ),

        // Layer 3: Vignette
        if (showVignette)
          DecoratedBox(
            decoration: BoxDecoration(
              gradient: RadialGradient(
                center: Alignment.center,
                radius: 1.2,
                colors: [
                  Colors.transparent,
                  AppColors.background0.withValues(alpha: 0.6),
                ],
              ),
            ),
          ),

        // Content layer
        if (child != null) child!,
      ],
    );
  }
}

/// A blurred overlay backdrop widget.
///
/// Used when displaying dialogs, modals, or drawers on top of the workspace.
/// Applies a configurable blur and dark tint to communicate modal depth.
class GlassOverlay extends StatelessWidget {
  /// Creates a [GlassOverlay].
  const GlassOverlay({
    super.key,
    this.blur = AppBlur.overlay,
    this.tintOpacity = 0.4,
    this.child,
  });

  /// Blur sigma applied to the backdrop.
  final double blur;

  /// Opacity of the dark tint over the blurred backdrop (0.0–1.0).
  final double tintOpacity;

  /// Optional child rendered above the overlay.
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
          child: ColoredBox(
            color: AppColors.background0.withValues(alpha: tintOpacity),
          ),
        ),
        if (child != null) child!,
      ],
    );
  }
}
