import 'package:flutter/material.dart';

/// Lumina AI Radius Token System.
///
/// Every border radius originates from this class.
@immutable
abstract final class AppRadius {
  // --- Scale ---
  static const double small = 8;
  static const double medium = 12;
  static const double large = 20;
  static const double xl = 28;
  static const double pill = 999;

  // --- Semantic ---
  static const double workspaceCanvas = 32;
  static const double dialog = 24;
  static const double card = 24;
  static const double button = 18;
  static const double input = 18;

  // --- BorderRadius ---
  static const BorderRadius smallRadius =
      BorderRadius.all(Radius.circular(small));
  static const BorderRadius mediumRadius =
      BorderRadius.all(Radius.circular(medium));
  static const BorderRadius largeRadius =
      BorderRadius.all(Radius.circular(large));
  static const BorderRadius xlRadius = BorderRadius.all(Radius.circular(xl));
  static const BorderRadius pillRadius =
      BorderRadius.all(Radius.circular(pill));
  static const BorderRadius cardRadius =
      BorderRadius.all(Radius.circular(card));
  static const BorderRadius dialogRadius =
      BorderRadius.all(Radius.circular(dialog));
  static const BorderRadius buttonRadius =
      BorderRadius.all(Radius.circular(button));
  static const BorderRadius inputRadius =
      BorderRadius.all(Radius.circular(input));
  static const BorderRadius canvasRadius =
      BorderRadius.all(Radius.circular(workspaceCanvas));
}
