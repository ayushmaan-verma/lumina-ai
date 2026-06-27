import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lumina_design/lumina_design.dart';

void main() {
  group('AppBreakpoints', () {
    test('resolve returns compact for narrow width', () {
      expect(AppBreakpoints.resolve(320), LuminaBreakpoint.compact);
    });

    test('resolve returns medium for tablet width', () {
      expect(AppBreakpoints.resolve(768), LuminaBreakpoint.medium);
    });

    test('resolve returns expanded for desktop width', () {
      expect(AppBreakpoints.resolve(1200), LuminaBreakpoint.expanded);
    });

    test('resolve returns ultra for wide desktop width', () {
      expect(AppBreakpoints.resolve(1600), LuminaBreakpoint.ultra);
    });

    test('compact threshold is 600', () {
      expect(AppBreakpoints.resolve(599), LuminaBreakpoint.compact);
      expect(AppBreakpoints.resolve(600), LuminaBreakpoint.medium);
    });
  });

  group('SurfaceStyle', () {
    test('background level has zero blur', () {
      final style = SurfaceStyle.resolve(SurfaceLevel.background);
      expect(style.blur, 0);
    });

    test('card level has non-zero blur', () {
      final style = SurfaceStyle.resolve(SurfaceLevel.card);
      expect(style.blur, greaterThan(0));
    });

    test('dialog level has higher blur than card level', () {
      final card = SurfaceStyle.resolve(SurfaceLevel.card);
      final dialog = SurfaceStyle.resolve(SurfaceLevel.dialog);
      expect(dialog.blur, greaterThan(card.blur));
    });

    test('background level has zero border radius', () {
      final style = SurfaceStyle.resolve(SurfaceLevel.background);
      expect(style.borderRadius, BorderRadius.zero);
    });
  });

  group('GlassRecipe', () {
    test('navigation recipe has navigation blur', () {
      expect(GlassRecipe.navigation.blur, AppBlur.navigation);
    });

    test('dialog recipe enables higher blur than card recipe', () {
      expect(
        GlassRecipe.dialog.blur,
        greaterThan(GlassRecipe.card.blur),
      );
    });

    test('spotlight recipe enables glow', () {
      expect(GlassRecipe.spotlight.enableGlow, isTrue);
    });

    test('card recipe does not enable glow', () {
      expect(GlassRecipe.card.enableGlow, isFalse);
    });
  });

  group('MotionTokens', () {
    test('hoverScale is greater than 1', () {
      expect(MotionTokens.hoverScale, greaterThan(1.0));
    });

    test('pressScale is less than 1', () {
      expect(MotionTokens.pressScale, lessThan(1.0));
    });

    test('hover duration is longer than press duration', () {
      expect(
        MotionTokens.hoverDuration.inMilliseconds,
        greaterThan(MotionTokens.pressDuration.inMilliseconds),
      );
    });
  });

  group('LuminaTheme widget', () {
    testWidgets('LuminaTheme.of returns theme data', (tester) async {
      final themeData = LuminaThemeData.dark();
      late LuminaThemeData captured;

      await tester.pumpWidget(
        LuminaTheme(
          data: themeData,
          child: Builder(
            builder: (context) {
              captured = LuminaTheme.of(context);
              return const SizedBox.shrink();
            },
          ),
        ),
      );

      expect(captured.isDark, isTrue);
      expect(captured.colors.primary, AppColors.primary);
    });

    testWidgets('LuminaTheme.maybeOf returns null outside tree',
        (tester) async {
      late LuminaThemeData? captured;

      await tester.pumpWidget(
        Builder(
          builder: (context) {
            captured = LuminaTheme.maybeOf(context);
            return const SizedBox.shrink();
          },
        ),
      );

      expect(captured, isNull);
    });
  });
}
