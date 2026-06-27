// ignore_for_file: avoid_void_async

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'lumina_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Lock status bar to transparent for immersive LSDS experience.
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.light,
    ),
  );

  runApp(const LuminaApp());
}
