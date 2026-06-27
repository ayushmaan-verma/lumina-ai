import 'package:flutter/foundation.dart';

enum LuminaPlatform { android, ios, windows, macos, linux, web, unknown }

enum LuminaNavigationType { bottomBar, rail, sidebar }

@immutable
abstract final class PlatformResolver {
  static LuminaPlatform get current {
    if (kIsWeb) return LuminaPlatform.web;
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return LuminaPlatform.android;
      case TargetPlatform.iOS:
        return LuminaPlatform.ios;
      case TargetPlatform.windows:
        return LuminaPlatform.windows;
      case TargetPlatform.macOS:
        return LuminaPlatform.macos;
      case TargetPlatform.linux:
        return LuminaPlatform.linux;
      case TargetPlatform.fuchsia:
        return LuminaPlatform.unknown;
    }
  }

  static bool get isDesktop =>
      current == LuminaPlatform.windows ||
      current == LuminaPlatform.macos ||
      current == LuminaPlatform.linux;

  static bool get isMobile =>
      current == LuminaPlatform.android || current == LuminaPlatform.ios;

  static bool get isWeb => current == LuminaPlatform.web;

  static bool get supportsHover => isDesktop || isWeb;
}
