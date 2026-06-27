import 'package:flutter/material.dart';

/// Lumina AI Color Token System.
///
/// All colors originate from the Lumina Spatial Design System (LSDS).
/// Never use raw Color() values inside widgets. Always consume from this class.
@immutable
abstract final class AppColors {
  // --- Brand ---
  static const Color primary = Color(0xFF7C3AED);
  static const Color primaryHover = Color(0xFF8B5CF6);
  static const Color primaryPressed = Color(0xFF6D28D9);

  static const Color secondary = Color(0xFF06B6D4);
  static const Color secondaryHover = Color(0xFF0891B2);

  static const Color accent = Color(0xFFEC4899);

  // --- Semantic ---
  static const Color success = Color(0xFF10B981);
  static const Color warning = Color(0xFFF59E0B);
  static const Color error = Color(0xFFEF4444);
  static const Color info = Color(0xFF3B82F6);

  // --- Backgrounds ---
  static const Color background0 = Color(0xFF05070F);
  static const Color background1 = Color(0xFF0A0F1A);
  static const Color background2 = Color(0xFF101828);
  static const Color background3 = Color(0xFF182230);

  // --- Glass Surfaces ---
  static const Color surface1 = Color(0x0AFFFFFF);
  static const Color surface2 = Color(0x0FFFFFFF);
  static const Color surface3 = Color(0x14FFFFFF);
  static const Color surfaceActive = Color(0x1FFFFFFF);
  static const Color surfaceHover = Color(0x24FFFFFF);
  static const Color surfacePressed = Color(0x2EFFFFFF);

  // --- Borders ---
  static const Color borderDefault = Color(0x1FFFFFFF);
  static const Color borderHover = Color(0x2EFFFFFF);
  static const Color borderFocused = Color(0x737C3AED);
  static const Color borderSelected = Color(0x7306B6D4);
  static const Color borderDisabled = Color(0x0DFFFFFF);

  // --- Text ---
  static const Color textPrimary = Color(0xFFF8FAFC);
  static const Color textSecondary = Color(0xFFCBD5E1);
  static const Color textTertiary = Color(0xFF94A3B8);
  static const Color textDisabled = Color(0xFF475569);
  static const Color textInverse = Color(0xFF0A0F1A);

  // --- Glow ---
  static const Color glowPrimary = Color(0x407C3AED);
  static const Color glowSecondary = Color(0x4006B6D4);
  static const Color glowAccent = Color(0x40EC4899);
  static const Color glowSuccess = Color(0x4010B981);
  static const Color glowError = Color(0x40EF4444);
  static const Color glowWarning = Color(0x40F59E0B);
}
