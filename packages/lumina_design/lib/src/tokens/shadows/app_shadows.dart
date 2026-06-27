import 'package:flutter/material.dart';
import '../colors/app_colors.dart';

/// Lumina AI Shadow Token System.
///
/// Pre-defined BoxShadow collections. Never construct BoxShadow inline.
@immutable
abstract final class AppShadows {
  static const List<BoxShadow> small = [
    BoxShadow(
      color: Color(0x1A000000),
      blurRadius: 16,
      offset: Offset(0, 4),
    ),
  ];

  static const List<BoxShadow> medium = [
    BoxShadow(
      color: Color(0x26000000),
      blurRadius: 32,
      offset: Offset(0, 8),
    ),
  ];

  static const List<BoxShadow> large = [
    BoxShadow(
      color: Color(0x33000000),
      blurRadius: 48,
      offset: Offset(0, 16),
    ),
  ];

  static const List<BoxShadow> hero = [
    BoxShadow(
      color: Color(0x40000000),
      blurRadius: 72,
      offset: Offset(0, 24),
    ),
  ];

  static const List<BoxShadow> glowPrimary = [
    BoxShadow(
      color: AppColors.glowPrimary,
      blurRadius: 32,
      spreadRadius: -4,
    ),
  ];

  static const List<BoxShadow> glowSecondary = [
    BoxShadow(
      color: AppColors.glowSecondary,
      blurRadius: 32,
      spreadRadius: -4,
    ),
  ];

  static const List<BoxShadow> glowAccent = [
    BoxShadow(
      color: AppColors.glowAccent,
      blurRadius: 32,
      spreadRadius: -4,
    ),
  ];

  static const List<BoxShadow> glowError = [
    BoxShadow(
      color: AppColors.glowError,
      blurRadius: 24,
      spreadRadius: -4,
    ),
  ];

  static const List<BoxShadow> glowSuccess = [
    BoxShadow(
      color: AppColors.glowSuccess,
      blurRadius: 24,
      spreadRadius: -4,
    ),
  ];

  static const List<BoxShadow> glowWarning = [
    BoxShadow(
      color: AppColors.glowWarning,
      blurRadius: 24,
      spreadRadius: -4,
    ),
  ];

  static const List<BoxShadow> floating = [
    BoxShadow(
      color: Color(0x33000000),
      blurRadius: 40,
      offset: Offset(0, 12),
    ),
    BoxShadow(
      color: Color(0x1A000000),
      blurRadius: 16,
      offset: Offset(0, 4),
    ),
  ];
}
