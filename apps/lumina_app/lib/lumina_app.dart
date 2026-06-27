library lumina_app;

import 'package:flutter/material.dart';
import 'package:lumina_design/lumina_design.dart';

import 'core/showcase/showcase_shell.dart';

/// Root application widget for the Lumina AI LSDS Showcase.
///
/// Wraps the entire widget tree with [LuminaTheme] (dark by default)
/// and [MaterialApp] configured to use the Lumina Flutter theme adapter.
///
/// This application demonstrates every LSDS token, component,
/// motion primitive, surface, and adaptive behavior defined in
/// Volume II of the Lumina AI documentation.
class LuminaApp extends StatefulWidget {
  const LuminaApp({super.key});

  @override
  State<LuminaApp> createState() => _LuminaAppState();
}

class _LuminaAppState extends State<LuminaApp> {
  LuminaThemeData _themeData = LuminaThemeData.dark();

  void _toggleTheme() {
    setState(() {
      _themeData =
          _themeData.isDark ? LuminaThemeData.light() : LuminaThemeData.dark();
    });
  }

  @override
  Widget build(BuildContext context) {
    return LuminaTheme(
      data: _themeData,
      child: MaterialApp(
        title: 'Lumina AI — LSDS Showcase',
        debugShowCheckedModeBanner: false,
        theme: FlutterThemeAdapter.fromLumina(_themeData),
        home: ShowcaseShell(onToggleTheme: _toggleTheme),
      ),
    );
  }
}
