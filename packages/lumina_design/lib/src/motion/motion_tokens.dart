import 'package:flutter/material.dart';
import '../tokens/motion/app_curves.dart';
import '../tokens/motion/app_durations.dart';

@immutable
abstract final class MotionTokens {
  static const Duration hoverDuration = AppDurations.hover;
  static const Curve hoverCurve = AppCurves.hover;
  static const double hoverScale = 1.02;
  static const double hoverLift = 4.0;
  static const Duration pressDuration = AppDurations.press;
  static const Curve pressCurve = AppCurves.press;
  static const double pressScale = 0.98;
  static const Duration pageTransitionDuration = AppDurations.pageTransition;
  static const Curve pageTransitionCurve = AppCurves.navigation;
  static const double pageTransitionOffset = 24.0;
  static const Duration standardDuration = AppDurations.standard;
  static const Curve standardCurve = AppCurves.standard;
  static const Duration modalDuration = AppDurations.medium;
  static const Curve modalCurve = AppCurves.modal;
  static const Duration heroDuration = AppDurations.hero;
  static const Curve heroCurve = AppCurves.emphasized;
}
