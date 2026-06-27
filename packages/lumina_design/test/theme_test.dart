import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lumina_design/lumina_design.dart';

void main() {
  // Must be initialized before any google_fonts usage in non-widget tests.
  TestWidgetsFlutterBinding.ensureInitialized();

  // Prevent google_fonts from making HTTP requests to fonts.gstatic.com
  // during tests. Behavioral assertions do not depend on the specific
  // font being loaded — only on ThemeData structure.
  GoogleFonts.config.allowRuntimeFetching = false;

  group('LuminaThemeData', () {
    test('dark factory creates dark theme', () {
      final theme = LuminaThemeData.dark();
      expect(theme.isDark, isTrue);
    });

    test('light factory creates light theme', () {
      final theme = LuminaThemeData.light();
      expect(theme.isDark, isFalse);
    });

    test('dark theme uses dark background', () {
      final theme = LuminaThemeData.dark();
      expect(theme.colors.background, AppColors.background1);
    });

    test('light theme uses light background', () {
      final theme = LuminaThemeData.light();
      expect(theme.colors.background, const Color(0xFFF8FAFC));
    });

    test('copyWith preserves unchanged fields', () {
      final original = LuminaThemeData.dark();
      final copy = original.copyWith(isDark: false);
      expect(copy.isDark, isFalse);
      expect(copy.colors, original.colors);
      expect(copy.spacing, original.spacing);
    });

    test('dark and light themes share same spacing', () {
      final dark = LuminaThemeData.dark();
      final light = LuminaThemeData.light();
      expect(dark.spacing.compact, light.spacing.compact);
    });
  });

  group('LuminaColorTheme', () {
    test('dark theme primary color is LSDS primary', () {
      const colors = LuminaColorTheme.dark();
      expect(colors.primary, AppColors.primary);
    });

    test('light theme text primary is dark', () {
      const colors = LuminaColorTheme.light();
      expect(colors.textPrimary.computeLuminance(), lessThan(0.5));
    });

    test('dark theme text primary is light', () {
      const colors = LuminaColorTheme.dark();
      expect(colors.textPrimary.computeLuminance(), greaterThan(0.5));
    });
  });

  group('FlutterThemeAdapter', () {
    testWidgets('fromLumina dark returns dark ThemeData', (tester) async {
      final themeData = FlutterThemeAdapter.fromLumina(LuminaThemeData.dark());
      await tester.pumpAndSettle();
      expect(themeData.brightness, Brightness.dark);
    });

    testWidgets('fromLumina light returns light ThemeData', (tester) async {
      final themeData = FlutterThemeAdapter.fromLumina(LuminaThemeData.light());
      await tester.pumpAndSettle();
      expect(themeData.brightness, Brightness.light);
    });

    testWidgets('fromLumina sets primary color in colorScheme', (tester) async {
      final themeData = FlutterThemeAdapter.fromLumina(LuminaThemeData.dark());
      await tester.pumpAndSettle();
      expect(themeData.colorScheme.primary, AppColors.primary);
    });

    testWidgets('fromLumina uses material3', (tester) async {
      final themeData = FlutterThemeAdapter.fromLumina(LuminaThemeData.dark());
      await tester.pumpAndSettle();
      expect(themeData.useMaterial3, isTrue);
    });
  });
}
