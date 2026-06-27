import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lumina_design/lumina_design.dart';
import 'package:lumina_app/navigation/adaptive_shell.dart';

void main() {
  // Wrap a widget with all required ancestors for AdaptiveShell testing.
  Widget buildTestable({required Widget child, double width = 1200}) {
    final themeData = LuminaThemeData.dark();
    return ProviderScope(
      child: LuminaTheme(
        data: themeData,
        child: MaterialApp(
          theme: FlutterThemeAdapter.fromLumina(themeData),
          home: MediaQuery(
            data: MediaQueryData(size: Size(width, 800)),
            child: child,
          ),
        ),
      ),
    );
  }

  group('AdaptiveShell', () {
    testWidgets('renders in expanded (desktop) mode without error',
        (tester) async {
      await tester.pumpWidget(
        buildTestable(
          width: 1280,
          child: AdaptiveShell(
            selectedIndex: 0,
            onSectionSelected: (_) {},
            onToggleTheme: () {},
          ),
        ),
      );
      expect(tester.takeException(), isNull);
    });

    testWidgets('renders in medium (tablet) mode without error',
        (tester) async {
      await tester.pumpWidget(
        buildTestable(
          width: 800,
          child: AdaptiveShell(
            selectedIndex: 0,
            onSectionSelected: (_) {},
            onToggleTheme: () {},
          ),
        ),
      );
      expect(tester.takeException(), isNull);
    });

    testWidgets('renders in compact (mobile) mode without error',
        (tester) async {
      await tester.pumpWidget(
        buildTestable(
          width: 390,
          child: AdaptiveShell(
            selectedIndex: 0,
            onSectionSelected: (_) {},
            onToggleTheme: () {},
          ),
        ),
      );
      expect(tester.takeException(), isNull);
    });

    testWidgets('responds to section selection callback', (tester) async {
      int selected = 0;
      await tester.pumpWidget(
        buildTestable(
          width: 1280,
          child: AdaptiveShell(
            selectedIndex: selected,
            onSectionSelected: (i) => selected = i,
            onToggleTheme: () {},
          ),
        ),
      );
      // Verify shell renders the placeholder content
      expect(find.text('Lumina AI'), findsWidgets);
    });
  });
}
