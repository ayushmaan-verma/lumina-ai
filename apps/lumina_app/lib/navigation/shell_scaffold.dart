import 'package:flutter/material.dart';
import 'package:lumina_design/lumina_design.dart';

/// Lumina AI — Shell Scaffold.
///
/// A thin wrapper around Flutter's [Scaffold] that applies LSDS-correct
/// background coloring and ensures the scaffold never exposes raw Material
/// defaults (white background, etc.) to the application shell.
///
/// All three adaptive variants (desktop, tablet, mobile) compose this widget
/// rather than using [Scaffold] directly, ensuring visual consistency across
/// breakpoints.
///
/// Phase 3.1: Background + body only. No floating action buttons, drawers,
/// or app bars are added here; the adaptive shell controls those.
class ShellScaffold extends StatelessWidget {
  const ShellScaffold({
    super.key,
    required this.body,
    this.bottomNavigationBar,
    this.backgroundColor,
  });

  /// The primary content of this scaffold.
  final Widget body;

  /// Optional bottom navigation bar (mobile breakpoint only).
  final Widget? bottomNavigationBar;

  /// Optional background color override. Defaults to [AppColors.background1].
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Never use Colors.xxx directly — consume from LSDS token.
      backgroundColor: backgroundColor ?? AppColors.background1,
      // Ensure the body extends behind the system UI chrome.
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: body,
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
