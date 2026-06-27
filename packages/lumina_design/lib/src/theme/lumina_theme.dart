import 'package:flutter/material.dart';
import 'lumina_theme_data.dart';

/// Provides [LuminaThemeData] to the widget tree.
class LuminaTheme extends InheritedWidget {
  const LuminaTheme({
    super.key,
    required this.data,
    required super.child,
  });

  final LuminaThemeData data;

  static LuminaThemeData of(BuildContext context) {
    final theme = context.dependOnInheritedWidgetOfExactType<LuminaTheme>();
    assert(
      theme != null,
      'No LuminaTheme found in widget tree. '
      'Ensure your app is wrapped with LuminaTheme.',
    );
    return theme!.data;
  }

  static LuminaThemeData? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<LuminaTheme>()?.data;
  }

  @override
  bool updateShouldNotify(LuminaTheme oldWidget) => data != oldWidget.data;
}
