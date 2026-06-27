import 'package:flutter/material.dart';

/// Lumina AI Blur Token System.
///
/// Never hardcode sigma values in BackdropFilter widgets.
@immutable
abstract final class AppBlur {
  static const double small = 12;
  static const double medium = 20;
  static const double large = 28;
  static const double hero = 36;
  static const double overlay = 48;
  static const double navigation = 20;
  static const double card = 24;
  static const double workspacePanel = 32;
  static const double dialog = 40;
  static const double spotlight = 48;
  static const double orbMin = 120;
  static const double orbMax = 250;
}
