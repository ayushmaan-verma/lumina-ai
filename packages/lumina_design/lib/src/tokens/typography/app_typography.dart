import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../colors/app_colors.dart';

/// Lumina AI Typography Token System.
///
/// Primary font: Inter (via google_fonts).
/// All styles originate from the LSDS specification (Volume II, section 15).
///
/// Usage:
/// ```dart
/// Text('Hello', style: AppTypography.heading1)
/// ```
@immutable
final class AppTypography {
  const AppTypography._();

  /// Base Inter text style. All other styles derive from this.
  static TextStyle get _base => GoogleFonts.inter();

  // ---------------------------------------------------------------------------
  // Display
  // ---------------------------------------------------------------------------

  /// Display XL — 56px, Bold, line-height 110%, letter-spacing -2%.
  static TextStyle get displayXl => _base.copyWith(
        fontSize: 56,
        fontWeight: FontWeight.w700,
        height: 1.1,
        letterSpacing: -1.12,
        color: AppColors.textPrimary,
      );

  /// Display L — 48px, Bold, line-height 110%, letter-spacing -2%.
  static TextStyle get displayL => _base.copyWith(
        fontSize: 48,
        fontWeight: FontWeight.w700,
        height: 1.1,
        letterSpacing: -0.96,
        color: AppColors.textPrimary,
      );

  /// Display M — 40px, Bold, line-height 110%, letter-spacing -2%.
  static TextStyle get displayM => _base.copyWith(
        fontSize: 40,
        fontWeight: FontWeight.w700,
        height: 1.1,
        letterSpacing: -0.8,
        color: AppColors.textPrimary,
      );

  // ---------------------------------------------------------------------------
  // Headings
  // ---------------------------------------------------------------------------

  /// Heading 1 — 32px, Bold, line-height 120%, letter-spacing -1%.
  static TextStyle get heading1 => _base.copyWith(
        fontSize: 32,
        fontWeight: FontWeight.w700,
        height: 1.2,
        letterSpacing: -0.32,
        color: AppColors.textPrimary,
      );

  /// Heading 2 — 28px, SemiBold, line-height 120%, letter-spacing -1%.
  static TextStyle get heading2 => _base.copyWith(
        fontSize: 28,
        fontWeight: FontWeight.w600,
        height: 1.2,
        letterSpacing: -0.28,
        color: AppColors.textPrimary,
      );

  /// Heading 3 — 24px, SemiBold, line-height 120%, letter-spacing -1%.
  static TextStyle get heading3 => _base.copyWith(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        height: 1.2,
        letterSpacing: -0.24,
        color: AppColors.textPrimary,
      );

  // ---------------------------------------------------------------------------
  // Title / Subtitle
  // ---------------------------------------------------------------------------

  /// Title — 20px, SemiBold, line-height 140%.
  static TextStyle get title => _base.copyWith(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        height: 1.4,
        letterSpacing: 0,
        color: AppColors.textPrimary,
      );

  /// Subtitle — 18px, Medium, line-height 140%.
  static TextStyle get subtitle => _base.copyWith(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        height: 1.4,
        letterSpacing: 0,
        color: AppColors.textSecondary,
      );

  // ---------------------------------------------------------------------------
  // Body
  // ---------------------------------------------------------------------------

  /// Body — 16px, Regular, line-height 150%.
  static TextStyle get body => _base.copyWith(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        height: 1.5,
        letterSpacing: 0,
        color: AppColors.textSecondary,
      );

  /// Body Small — 14px, Regular, line-height 150%.
  static TextStyle get bodySmall => _base.copyWith(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        height: 1.5,
        letterSpacing: 0,
        color: AppColors.textTertiary,
      );

  // ---------------------------------------------------------------------------
  // Label
  // ---------------------------------------------------------------------------

  /// Label Large — 14px, SemiBold, line-height 140%, letter-spacing 1%.
  static TextStyle get labelLarge => _base.copyWith(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        height: 1.4,
        letterSpacing: 0.14,
        color: AppColors.textPrimary,
      );

  /// Label Medium — 12px, Medium, line-height 140%, letter-spacing 2%.
  static TextStyle get labelMedium => _base.copyWith(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        height: 1.4,
        letterSpacing: 0.24,
        color: AppColors.textSecondary,
      );

  // ---------------------------------------------------------------------------
  // Caption / Micro
  // ---------------------------------------------------------------------------

  /// Caption — 12px, Regular, line-height 140%, letter-spacing 2%.
  static TextStyle get caption => _base.copyWith(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        height: 1.4,
        letterSpacing: 0.24,
        color: AppColors.textTertiary,
      );

  /// Micro — 10px, Regular, line-height 140%, letter-spacing 2%.
  static TextStyle get micro => _base.copyWith(
        fontSize: 10,
        fontWeight: FontWeight.w400,
        height: 1.4,
        letterSpacing: 0.2,
        color: AppColors.textDisabled,
      );

  // ---------------------------------------------------------------------------
  // Mono / Code
  // ---------------------------------------------------------------------------

  /// Mono — Roboto Mono 14px, Regular, line-height 150%.
  static TextStyle get mono => GoogleFonts.robotoMono(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        height: 1.5,
        color: AppColors.textSecondary,
      );

  /// Code — Roboto Mono 13px, Regular, line-height 160%.
  static TextStyle get code => GoogleFonts.robotoMono(
        fontSize: 13,
        fontWeight: FontWeight.w400,
        height: 1.6,
        color: AppColors.textSecondary,
      );
}
