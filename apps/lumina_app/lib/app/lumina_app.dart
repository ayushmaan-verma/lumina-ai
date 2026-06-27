import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lumina_design/lumina_design.dart';

import '../navigation/app_shell.dart';
import 'app_config.dart';

/// Lumina AI — Root Application Widget.
///
/// Responsibilities:
/// - Provides [LuminaTheme] to the entire widget tree.
/// - Configures [MaterialApp] with the LSDS [FlutterThemeAdapter].
/// - Wires the adaptive navigation shell as the home route.
/// - Exposes theme-toggle capability while awaiting Phase 3.2 routing.
///
/// This widget is intentionally free of business logic.
///
/// Phase 3.1: MaterialApp + LuminaTheme + AppShell placeholder.
/// Phase 3.2: Replace [MaterialApp] home with [MaterialApp.router] + go_router.
/// Phase 10:  Theme preference will be persisted and loaded from storage.
class LuminaApp extends ConsumerStatefulWidget {
  const LuminaApp({super.key});

  @override
  ConsumerState<LuminaApp> createState() => _LuminaAppState();
}

class _LuminaAppState extends ConsumerState<LuminaApp> {
  /// Current LSDS theme data. Defaults to dark (Lumina's canonical mode).
  LuminaThemeData _themeData = LuminaThemeData.dark();

  /// Toggles between dark and light LSDS themes.
  ///
  /// Exposed to child widgets via the [AppShell] callback.
  /// Phase 10 will replace this with a persisted Riverpod-backed state.
  void _toggleTheme() {
    setState(() {
      _themeData = _themeData.isDark
          ? LuminaThemeData.light()
          : LuminaThemeData.dark();
    });
  }

  @override
  Widget build(BuildContext context) {
    return LuminaTheme(
      data: _themeData,
      child: MaterialApp(
        // --- Application Identity ---
        title: AppConfig.appName,
        debugShowCheckedModeBanner: AppConfig.showDebugBanner,

        // --- Theme ---
        // The FlutterThemeAdapter bridges LuminaThemeData to Flutter's
        // ThemeData so that Material widgets degrade gracefully. All custom
        // UI consumes LuminaTheme directly rather than Theme.of(context).
        theme: FlutterThemeAdapter.fromLumina(_themeData),

        // --- Localization Placeholders ---
        // Phase 10 will replace these with flutter_localizations delegates
        // and a proper locale resolution strategy.
        localizationsDelegates: const [
          DefaultWidgetsLocalizations.delegate,
          DefaultMaterialLocalizations.delegate,
        ],
        supportedLocales: const [Locale('en', 'US')],

        // --- Root Shell ---
        // Phase 3.2 will replace [home] with [routerConfig] (go_router).
        home: AppShell(onToggleTheme: _toggleTheme),
      ),
    );
  }
}
