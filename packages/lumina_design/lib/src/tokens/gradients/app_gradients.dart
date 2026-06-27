import 'package:flutter/material.dart';

/// Lumina AI Gradient Token System.
@immutable
abstract final class AppGradients {
  // --- Named Gradients ---
  static const LinearGradient aurora = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF7C3AED), Color(0xFF3B82F6)],
  );

  static const LinearGradient nebula = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF3B82F6), Color(0xFFEC4899)],
  );

  static const LinearGradient sunrise = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFFF97316), Color(0xFFEC4899)],
  );

  static const LinearGradient ocean = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF06B6D4), Color(0xFF3B82F6)],
  );

  static const LinearGradient galaxy = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF7C3AED), Color(0xFFEC4899), Color(0xFF3B82F6)],
    stops: [0.0, 0.5, 1.0],
  );

  static const LinearGradient backgroundDark = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF05070F), Color(0xFF0A0F1A)],
  );

  static const LinearGradient glassBorder = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0x33FFFFFF), Color(0x0DFFFFFF)],
  );

  static const RadialGradient primaryGlow = RadialGradient(
    colors: [Color(0x407C3AED), Color(0x007C3AED)],
  );

  static const RadialGradient secondaryGlow = RadialGradient(
    colors: [Color(0x4006B6D4), Color(0x0006B6D4)],
  );
}
