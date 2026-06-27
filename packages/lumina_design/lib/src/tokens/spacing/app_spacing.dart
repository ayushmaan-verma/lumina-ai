import 'package:flutter/material.dart';

/// Lumina AI Spacing Token System.
///
/// Base unit: 8px. All spacing originates from the LSDS scale.
/// Never use arbitrary EdgeInsets values in widgets.
@immutable
abstract final class AppSpacing {
  // --- Base Scale ---
  static const double xxs = 4;
  static const double xs = 8;
  static const double sm = 12;
  static const double md = 16;
  static const double lg = 20;
  static const double xl = 24;
  static const double xxl = 32;
  static const double xxxl = 40;
  static const double s48 = 48;
  static const double s56 = 56;
  static const double s64 = 64;
  static const double s80 = 80;
  static const double s96 = 96;
  static const double s128 = 128;

  // --- Semantic Names ---
  static const double tiny = xxs;
  static const double small = xs;
  static const double compact = md;
  static const double comfortable = xl;
  static const double relaxed = xxl;
  static const double large = s48;
  static const double hero = s64;
  static const double cinematic = s96;

  // --- Edge Insets Helpers ---
  static const EdgeInsets paddingXxs = EdgeInsets.all(xxs);
  static const EdgeInsets paddingXs = EdgeInsets.all(xs);
  static const EdgeInsets paddingSm = EdgeInsets.all(sm);
  static const EdgeInsets paddingMd = EdgeInsets.all(md);
  static const EdgeInsets paddingLg = EdgeInsets.all(lg);
  static const EdgeInsets paddingXl = EdgeInsets.all(xl);
  static const EdgeInsets paddingXxl = EdgeInsets.all(xxl);
  static const EdgeInsets horizontalMd = EdgeInsets.symmetric(horizontal: md);
  static const EdgeInsets horizontalXl = EdgeInsets.symmetric(horizontal: xl);
  static const EdgeInsets verticalMd = EdgeInsets.symmetric(vertical: md);
  static const EdgeInsets verticalXl = EdgeInsets.symmetric(vertical: xl);
}
