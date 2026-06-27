import 'package:flutter/material.dart';

import '../adaptive/adaptive_spacing.dart';
import '../adaptive/app_breakpoints.dart';
import '../adaptive/platform_type.dart';
import '../theme/lumina_theme.dart';
import '../theme/lumina_theme_data.dart';

/// BuildContext extensions for the Lumina Spatial Design System.
///
/// These extensions provide convenient, zero-boilerplate access to the Lumina
/// theme system. Always use these over manual [LuminaTheme.of] calls.
///
/// Example:
/// ```dart
/// final colors = context.luminaColors;
/// final spacing = context.luminaSpacing;
/// ```
extension LuminaBuildContextX on BuildContext {
  /// The current [LuminaThemeData] from the nearest [LuminaTheme] ancestor.
  LuminaThemeData get luminaTheme => LuminaTheme.of(this);

  /// Shorthand for [luminaTheme.colors].
  LuminaColorTheme get luminaColors => luminaTheme.colors;

  /// Shorthand for [luminaTheme.typography].
  LuminaTypographyTheme get luminaTypography => luminaTheme.typography;

  /// Shorthand for [luminaTheme.spacing].
  LuminaSpacingTheme get luminaSpacing => luminaTheme.spacing;

  /// Shorthand for [luminaTheme.radius].
  LuminaRadiusTheme get luminaRadius => luminaTheme.radius;

  /// Shorthand for [luminaTheme.shadows].
  LuminaShadowTheme get luminaShadows => luminaTheme.shadows;

  /// Shorthand for [luminaTheme.durations].
  LuminaDurationTheme get luminaDurations => luminaTheme.durations;

  /// Shorthand for [luminaTheme.curves].
  LuminaCurveTheme get luminaCurves => luminaTheme.curves;

  /// Shorthand for [luminaTheme.blur].
  LuminaBlurTheme get luminaBlur => luminaTheme.blur;

  /// Shorthand for [luminaTheme.opacity].
  LuminaOpacityTheme get luminaOpacity => luminaTheme.opacity;

  /// Shorthand for [luminaTheme.gradients].
  LuminaGradientTheme get luminaGradients => luminaTheme.gradients;

  /// The current [LuminaBreakpoint] derived from the window width.
  LuminaBreakpoint get luminaBreakpoint => AppBreakpoints.of(this);

  /// Adaptive spacing values for the current breakpoint.
  AdaptiveSpacing get luminaAdaptiveSpacing => AdaptiveSpacing.of(this);

  /// The current [LuminaPlatform].
  LuminaPlatform get luminaPlatform => PlatformResolver.current;

  /// Whether the current platform is a desktop (Windows, macOS, Linux).
  bool get isDesktop => PlatformResolver.isDesktop;

  /// Whether the current platform is a mobile device (Android, iOS).
  bool get isMobile => PlatformResolver.isMobile;

  /// Whether the current platform is web.
  bool get isLuminaWeb => PlatformResolver.isWeb;

  /// Whether the current breakpoint is compact (phone-sized window).
  bool get isCompact => luminaBreakpoint == LuminaBreakpoint.compact;

  /// Whether the current breakpoint is medium (tablet-sized window).
  bool get isMediumBreakpoint => luminaBreakpoint == LuminaBreakpoint.medium;

  /// Whether the current breakpoint is expanded or ultra (desktop-sized).
  bool get isExpandedBreakpoint =>
      luminaBreakpoint == LuminaBreakpoint.expanded ||
      luminaBreakpoint == LuminaBreakpoint.ultra;

  /// The current window size from [MediaQuery].
  Size get mediaSize => MediaQuery.sizeOf(this);

  /// Whether the current platform supports hover interactions.
  bool get supportsHover => PlatformResolver.supportsHover;
}
