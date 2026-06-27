import 'package:flutter/material.dart';

/// Lumina AI Z-Index Token System.
@immutable
abstract final class AppZIndex {
  static const int background = 0;
  static const int canvas = 10;
  static const int surface = 20;
  static const int navigation = 30;
  static const int floating = 40;
  static const int overlay = 50;
  static const int dialog = 60;
  static const int modal = 70;
  static const int tooltip = 80;
  static const int notification = 90;
  static const int spotlight = 100;
}
