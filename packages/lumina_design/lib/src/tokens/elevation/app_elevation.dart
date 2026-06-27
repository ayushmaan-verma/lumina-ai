import 'package:flutter/material.dart';

/// Lumina AI Elevation Token System.
@immutable
abstract final class AppElevation {
  /// Flat - backgrounds, canvases.
  static const double level0 = 0;

  /// Card - glass cards, list items.
  static const double level1 = 1;

  /// Floating - panels, tooltips.
  static const double level2 = 2;

  /// Dialog - modal dialogs, sheets.
  static const double level3 = 3;

  /// Workspace Overlay - contextual overlays.
  static const double level4 = 4;

  /// Modal - highest priority surfaces.
  static const double level5 = 5;
}
