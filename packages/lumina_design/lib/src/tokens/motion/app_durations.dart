import 'package:flutter/material.dart';

/// Lumina AI Duration Token System.
@immutable
abstract final class AppDurations {
  static const Duration instant = Duration(milliseconds: 0);
  static const Duration veryFast = Duration(milliseconds: 80);
  static const Duration fast = Duration(milliseconds: 120);
  static const Duration standard = Duration(milliseconds: 220);
  static const Duration medium = Duration(milliseconds: 320);
  static const Duration slow = Duration(milliseconds: 450);
  static const Duration hero = Duration(milliseconds: 700);
  static const Duration hover = Duration(milliseconds: 180);
  static const Duration press = Duration(milliseconds: 90);
  static const Duration pageTransition = Duration(milliseconds: 250);
  static const Duration tooltipDelay = Duration(milliseconds: 400);
  static const Duration skeletonPulse = Duration(milliseconds: 1400);
  static const Duration shimmer = Duration(milliseconds: 1600);
  static const int ambientMinMs = 20000;
  static const int ambientMaxMs = 40000;
}
