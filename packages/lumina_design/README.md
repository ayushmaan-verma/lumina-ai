# lumina_design

Lumina Spatial Design System (LSDS) package.

This package owns Lumina AI's visual foundation. Future packages should import `package:lumina_design/lumina_design.dart` for design tokens, theme data, adaptive utilities, motion helpers, surface recipes, glass recipes, and foundation widgets.

## Public API

The package exports:

- Design tokens: colors, typography, spacing, radius, blur, shadows, opacity, elevation, borders, gradients, icon sizes, z-index, durations, and curves.
- Theme engine: `LuminaThemeData`, `LuminaTheme`, and `FlutterThemeAdapter`.
- Adaptive engine: breakpoints, device classes, platform resolution, adaptive spacing, adaptive typography, adaptive layout, and window sizing.
- Surface and glass systems: surface levels/styles, animated surfaces, glass recipes, glass decorations, glass surfaces, and glass backgrounds.
- Foundation widgets: glass and surface containers, adaptive padding/spacers/text, hover and press regions, icons, and skeleton placeholders.

## Usage

```dart
import 'package:lumina_design/lumina_design.dart';
```

Wrap application trees with `LuminaTheme` and consume LSDS values through the exported theme, token, and context extension APIs. Feature widgets must not define independent colors, spacing, radius, typography, shadows, blur, or motion values.

## Verification

Current package gates:

```sh
flutter analyze packages/lumina_design
cd packages/lumina_design && flutter test
```
