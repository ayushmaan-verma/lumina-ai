import 'package:flutter_test/flutter_test.dart';
import 'package:lumina_design/lumina_design.dart';

void main() {
  group('AppColors', () {
    test('primary color has correct value', () {
      expect(AppColors.primary.toARGB32(), 0xFF7C3AED);
    });

    test('secondary color has correct value', () {
      expect(AppColors.secondary.toARGB32(), 0xFF06B6D4);
    });

    test('background1 is darkest recommended background', () {
      expect(AppColors.background1.toARGB32(), 0xFF0A0F1A);
    });

    test('glass surface colors have non-zero alpha for transparency', () {
      expect(AppColors.surface1.a, isNonZero);
      expect(AppColors.surface2.a, isNonZero);
      expect(AppColors.surface3.a, isNonZero);
    });

    test('glow colors have partial opacity', () {
      expect(AppColors.glowPrimary.a, greaterThan(0));
      expect(AppColors.glowPrimary.a, lessThan(1));
    });
  });

  group('AppSpacing', () {
    test('base unit is 8px (xs)', () {
      expect(AppSpacing.xs, 8);
    });

    test('scale is consistent multiples', () {
      expect(AppSpacing.md, 16); // 2 × 8
      expect(AppSpacing.xl, 24); // 3 × 8
      expect(AppSpacing.xxl, 32); // 4 × 8
    });

    test('semantic names map to correct values', () {
      expect(AppSpacing.tiny, AppSpacing.xxs);
      expect(AppSpacing.small, AppSpacing.xs);
      expect(AppSpacing.compact, AppSpacing.md);
      expect(AppSpacing.comfortable, AppSpacing.xl);
    });
  });

  group('AppRadius', () {
    test('button radius is 18', () {
      expect(AppRadius.button, 18);
    });

    test('card radius is 24', () {
      expect(AppRadius.card, 24);
    });

    test('pill radius is 999', () {
      expect(AppRadius.pill, 999);
    });

    test('cardRadius BorderRadius uses card value', () {
      const radius = AppRadius.cardRadius;
      expect(radius.topLeft.x, AppRadius.card);
    });
  });

  group('AppBlur', () {
    test('card blur is 24', () {
      expect(AppBlur.card, 24);
    });

    test('dialog blur is greater than card blur', () {
      expect(AppBlur.dialog, greaterThan(AppBlur.card));
    });

    test('overlay blur is maximum surface blur', () {
      expect(AppBlur.overlay, greaterThanOrEqualTo(AppBlur.dialog));
    });
  });

  group('AppOpacity', () {
    test('disabled opacity is 0.38 per Material spec', () {
      expect(AppOpacity.disabled, 0.38);
    });

    test('glass opacities are in valid range', () {
      expect(AppOpacity.glassMd, greaterThan(0));
      expect(AppOpacity.glassXl, lessThan(1));
      expect(AppOpacity.glassMd, lessThan(AppOpacity.glassXl));
    });
  });

  group('AppDurations', () {
    test('fast is shorter than standard', () {
      expect(
        AppDurations.fast.inMilliseconds,
        lessThan(AppDurations.standard.inMilliseconds),
      );
    });

    test('hero duration is the longest named duration', () {
      expect(
        AppDurations.hero.inMilliseconds,
        greaterThan(AppDurations.slow.inMilliseconds),
      );
    });

    test('press duration is very short for responsiveness', () {
      expect(AppDurations.press.inMilliseconds, lessThanOrEqualTo(100));
    });
  });

  group('AppElevation', () {
    test('level0 is zero (flat)', () {
      expect(AppElevation.level0, 0);
    });

    test('levels are ascending', () {
      expect(AppElevation.level1, greaterThan(AppElevation.level0));
      expect(AppElevation.level2, greaterThan(AppElevation.level1));
      expect(AppElevation.level5, greaterThan(AppElevation.level4));
    });
  });

  group('AppIconSizes', () {
    test('minTouchTarget is 48 per WCAG', () {
      expect(AppIconSizes.minTouchTarget, 48);
    });

    test('sizes are ascending', () {
      expect(AppIconSizes.sm, greaterThan(AppIconSizes.xs));
      expect(AppIconSizes.md, greaterThan(AppIconSizes.sm));
      expect(AppIconSizes.lg, greaterThan(AppIconSizes.md));
    });
  });
}
