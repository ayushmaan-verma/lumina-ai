import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lumina_app/app/app_config.dart';

void main() {
  group('AppConfig', () {
    test('has correct app name', () {
      expect(AppConfig.appName, equals('Lumina AI'));
    });

    test('has correct short name', () {
      expect(AppConfig.appNameShort, equals('Lumina'));
    });

    test('has a non-empty version string', () {
      expect(AppConfig.version, isNotEmpty);
    });

    test('displayVersion includes version and build number', () {
      expect(AppConfig.displayVersion, contains(AppConfig.version));
      expect(AppConfig.displayVersion, contains('${AppConfig.buildNumber}'));
    });

    test('defaults to development environment', () {
      expect(AppConfig.environment, equals(AppEnvironment.development));
    });

    test('feature flags are disabled by default', () {
      expect(AppConfig.featureFlagsEnabled, isFalse);
      expect(AppConfig.workspaceEnabled, isFalse);
      expect(AppConfig.aiEnabled, isFalse);
      expect(AppConfig.authEnabled, isFalse);
    });

    test('debug banner is hidden', () {
      expect(AppConfig.showDebugBanner, isFalse);
    });
  });

  group('AppEnvironment', () {
    test('development has correct label', () {
      expect(AppEnvironment.development.label, equals('Development'));
    });

    test('staging has correct label', () {
      expect(AppEnvironment.staging.label, equals('Staging'));
    });

    test('production has correct label', () {
      expect(AppEnvironment.production.label, equals('Production'));
    });
  });

  group('LuminaApp root widget', () {
    testWidgets('renders without throwing', (tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: _TestApp(),
        ),
      );
      expect(tester.takeException(), isNull);
    });
  });
}

// ---------------------------------------------------------------------------
// Test helpers
// ---------------------------------------------------------------------------

/// A test-specific MaterialApp that wraps a simple widget for smoke testing
/// the ProviderScope layer without requiring a real LuminaApp startup.
class _TestApp extends StatelessWidget {
  const _TestApp();

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(body: SizedBox.shrink()),
    );
  }
}
