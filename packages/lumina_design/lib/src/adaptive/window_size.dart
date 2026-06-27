import 'package:flutter/material.dart';

/// Window size classes for adaptive layout decisions.
///
/// Classifies the window by absolute size rather than semantic breakpoint,
/// enabling fine-grained panel dimension control independent of [LuminaBreakpoint].
enum WindowSizeClass { compact, medium, expanded, large }

/// Provides window dimension constants and size classification.
///
/// Used to calculate recommended panel widths (sidebar, canvas, AI panel)
/// per the LSDS adaptive layout specification (section 43).
@immutable
abstract final class WindowSize {
  // --- Minimum window constraints ---
  /// Minimum supported window width.
  static const double minWidth = 320.0;

  /// Minimum supported window height.
  static const double minHeight = 480.0;

  // --- Default desktop dimensions ---
  static const double defaultDesktopWidth = 1280.0;
  static const double defaultDesktopHeight = 800.0;

  // --- Desktop panel width fractions (LSDS section 43) ---
  /// Sidebar occupies 18% on desktop.
  static const double sidebarFraction = 0.18;

  /// Canvas occupies 58% on desktop.
  static const double canvasFraction = 0.58;

  /// AI Context Panel occupies 24% on desktop.
  static const double aiPanelFraction = 0.24;

  /// Canvas occupies 80% on tablet.
  static const double tabletCanvasFraction = 0.80;

  // --- Absolute panel constraints ---
  static const double minSidebarWidth = 200.0;
  static const double maxSidebarWidth = 320.0;
  static const double minAiPanelWidth = 280.0;
  static const double maxAiPanelWidth = 400.0;

  /// Width of the navigation rail (medium breakpoint).
  static const double railWidth = 64.0;

  // --- Interaction constants (LSDS section 52) ---
  /// Delay before showing tooltips on desktop.
  static const Duration tooltipDelay = Duration(milliseconds: 400);

  /// Classifies [size] into a [WindowSizeClass].
  static WindowSizeClass classify(Size size) {
    final width = size.width;
    if (width < 600) return WindowSizeClass.compact;
    if (width < 1024) return WindowSizeClass.medium;
    if (width < 1440) return WindowSizeClass.expanded;
    return WindowSizeClass.large;
  }

  /// Resolves the [WindowSizeClass] from [context].
  static WindowSizeClass of(BuildContext context) =>
      classify(MediaQuery.sizeOf(context));

  /// Recommended sidebar width for the given [context].
  static double sidebarWidth(BuildContext context) {
    final cls = of(context);
    return switch (cls) {
      WindowSizeClass.compact => 0.0,
      WindowSizeClass.medium => railWidth,
      WindowSizeClass.expanded => 240.0,
      WindowSizeClass.large => 280.0,
    };
  }

  /// Recommended AI context panel width for the given [context].
  ///
  /// Returns 0 for compact/medium where the panel is not docked.
  static double aiPanelWidth(BuildContext context) {
    final cls = of(context);
    return switch (cls) {
      WindowSizeClass.compact => 0.0,
      WindowSizeClass.medium => 0.0,
      WindowSizeClass.expanded => 300.0,
      WindowSizeClass.large => 340.0,
    };
  }
}
