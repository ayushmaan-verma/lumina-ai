import 'package:flutter/material.dart';

import 'app_breakpoints.dart';
import 'platform_type.dart';

/// Describes the combination of platform and breakpoint for adaptive decisions.
///
/// [DeviceClass] is a higher-level classification than [LuminaBreakpoint]
/// because it also factors in the platform (desktop vs. mobile vs. web).
enum DeviceClass {
  /// Phone-sized mobile device.
  mobilePhone,

  /// Tablet-sized mobile device.
  mobileTablet,

  /// Desktop OS running a small/medium window.
  desktopCompact,

  /// Desktop OS running in an expanded or large window.
  desktopFull,

  /// Web browser (any window size).
  web,
}

/// Resolves the [DeviceClass] from platform and breakpoint information.
///
/// Used to make layout decisions that depend on both screen size
/// and input method (touch vs. pointer).
@immutable
abstract final class DeviceClassResolver {
  /// Resolves the [DeviceClass] from explicit [platform] and [breakpoint].
  static DeviceClass resolve({
    required LuminaPlatform platform,
    required LuminaBreakpoint breakpoint,
  }) {
    if (platform == LuminaPlatform.web) return DeviceClass.web;

    if (platform == LuminaPlatform.android || platform == LuminaPlatform.ios) {
      return breakpoint == LuminaBreakpoint.compact
          ? DeviceClass.mobilePhone
          : DeviceClass.mobileTablet;
    }

    // Desktop platforms (Windows, macOS, Linux)
    return breakpoint == LuminaBreakpoint.compact ||
            breakpoint == LuminaBreakpoint.medium
        ? DeviceClass.desktopCompact
        : DeviceClass.desktopFull;
  }

  /// Resolves the [DeviceClass] from [context].
  static DeviceClass of(BuildContext context) => resolve(
        platform: PlatformResolver.current,
        breakpoint: AppBreakpoints.of(context),
      );

  /// Returns the recommended [LuminaNavigationType] for the given [DeviceClass].
  static LuminaNavigationType navigationTypeFor(DeviceClass cls) =>
      switch (cls) {
        DeviceClass.mobilePhone => LuminaNavigationType.bottomBar,
        DeviceClass.mobileTablet => LuminaNavigationType.rail,
        DeviceClass.desktopCompact => LuminaNavigationType.rail,
        DeviceClass.desktopFull => LuminaNavigationType.sidebar,
        DeviceClass.web => LuminaNavigationType.sidebar,
      };

  /// Whether the [DeviceClass] supports hover interactions.
  static bool supportsHover(DeviceClass cls) =>
      cls == DeviceClass.desktopFull ||
      cls == DeviceClass.desktopCompact ||
      cls == DeviceClass.web;

  /// Whether keyboard shortcuts should be registered for the [DeviceClass].
  static bool supportsKeyboardShortcuts(DeviceClass cls) =>
      cls == DeviceClass.desktopFull ||
      cls == DeviceClass.desktopCompact ||
      cls == DeviceClass.web;
}
