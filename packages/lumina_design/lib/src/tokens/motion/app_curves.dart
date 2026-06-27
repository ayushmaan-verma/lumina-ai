import 'package:flutter/material.dart';

/// Lumina AI Animation Curve Token System.
@immutable
abstract final class AppCurves {
  static const Curve standard = Curves.easeInOut;
  static const Curve navigation = Curves.easeOut;
  static const Curve hover = Curves.easeOut;
  static const Curve modal = Curves.easeInOut;
  static const Curve loading = Curves.linear;
  static const Curve press = Curves.easeIn;
  static const Curve exit = Curves.easeIn;
  static const Curve enter = Curves.easeOut;
  static const Curve emphasized = Curves.easeInOutCubic;
}
