import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lumina_design/lumina_design.dart';

import '../navigation/app_shell.dart';
import 'app_config.dart';
import 'lifecycle/app_lifecycle_observer.dart';

/// Lumina AI — Root Application Widget.
///
/// The root of the Lumina widget tree. Responsibilities:
///
/// - Registers the [AppLifecycleObserver] for centralized lifecycle events.
/// - Provides [LuminaTheme] to the entire widget tree.
/// - Configures [MaterialApp] using [FlutterThemeAdapter] to bridge LSDS
///   tokens to Material's [ThemeData] (Material widgets degrade gracefully;
///   all custom UI reads [LuminaTheme] directly).
/// - Mounts the adaptive navigation shell as the home route.
///
/// # Why ConsumerStatefulWidget?
///
/// This widget is a [ConsumerStatefulWidget] to integrate cleanly with
/// Riverpod from the first frame. The `ref` is unused in Phase 3.1 but
/// will be consumed in Phase 3.3 (theme Riverpod provider) and Phase 3.4
/// (error/logging providers). Changing widget base type later is disruptive;
/// establishing it now preserves architectural consistency.
///
/// # Theme Management (Phase 3.1)
///
/// Theme toggle is a local state callback. Phase 10 replaces this with a
/// Riverpod-backed `AppThemeNotifier` that persists the preference to Hive.
///
/// # Phase Roadmap
///
/// - Phase 3.1: MaterialApp + LuminaTheme + AppShell + lifecycle.
/// - Phase 3.2: Replace [MaterialApp.home] with [MaterialApp.router] + go_router.
/// - Phase 3.3: Read theme from a Riverpod provider; remove local setState.
/// - Phase 10:  Theme persisted via Hive; lifecycle flushes on pause.
class LuminaApp extends ConsumerStatefulWidget {
  const LuminaApp({super.key});

  @override
  ConsumerState<LuminaApp> createState() => _LuminaAppState();
}

class _LuminaAppState extends ConsumerState<LuminaApp> {
  // ---------------------------------------------------------------------------
  // Lifecycle
  // ---------------------------------------------------------------------------

  late final AppLifecycleObserver _lifecycleObserver;

  @override
  void initState() {
    super.initState();
    _lifecycleObserver = AppLifecycleObserver();
    WidgetsBinding.instance.addObserver(_lifecycleObserver);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(_lifecycleObserver);
    _lifecycleObserver.dispose();
    super.dispose();
  }

  // ---------------------------------------------------------------------------
  // Theme (Phase 3.1 — local state; Phase 3.3 replaces with Riverpod provider)
  // ---------------------------------------------------------------------------

  /// Current LSDS theme data.
  ///
  /// Defaults to dark, which is Lumina's canonical design mode.
  /// Light mode is provided for accessibility and platform preference.
  LuminaThemeData _themeData = LuminaThemeData.dark();

  /// Toggles between dark and light LSDS themes.
  ///
  /// Phase 3.3 will replace this setState with a `ref.read(themeProvider.notifier)` call.
  void _toggleTheme() {
    setState(() {
      _themeData = _themeData.isDark
          ? LuminaThemeData.light()
          : LuminaThemeData.dark();
    });
  }

  // ---------------------------------------------------------------------------
  // Build
  // ---------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return LuminaTheme(
      data: _themeData,
      child: MaterialApp(
        // -----------------------------------------------------------------------
        // Application Identity
        // -----------------------------------------------------------------------
        title: AppConfig.appName,
        debugShowCheckedModeBanner: AppConfig.showDebugBanner,

        // -----------------------------------------------------------------------
        // Theme
        // -----------------------------------------------------------------------
        // [FlutterThemeAdapter] bridges LuminaThemeData to Material's ThemeData.
        // Custom widgets always read from LuminaTheme.of(context), never from
        // Theme.of(context).
        theme: FlutterThemeAdapter.fromLumina(_themeData),

        // -----------------------------------------------------------------------
        // Localization (Placeholders)
        // -----------------------------------------------------------------------
        // Phase 10 replaces these with flutter_localizations delegates and
        // an Intl-backed locale resolution strategy.
        localizationsDelegates: const [
          DefaultWidgetsLocalizations.delegate,
          DefaultMaterialLocalizations.delegate,
        ],
        supportedLocales: const [Locale('en', 'US')],

        // -----------------------------------------------------------------------
        // Root Shell
        // -----------------------------------------------------------------------
        // Phase 3.2 replaces [home:] with [routerConfig:] (go_router).
        home: AppShell(onToggleTheme: _toggleTheme),
      ),
    );
  }
}
