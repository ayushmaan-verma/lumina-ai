import 'package:flutter/material.dart';
import '../colors/app_colors.dart';

/// Lumina AI Border Token System.
@immutable
abstract final class AppBorders {
  static const double widthDefault = 1;
  static const double widthThick = 1.5;

  static const Border defaultBorder = Border.fromBorderSide(
    BorderSide(color: AppColors.borderDefault, width: widthDefault),
  );

  static const Border hoverBorder = Border.fromBorderSide(
    BorderSide(color: AppColors.borderHover, width: widthDefault),
  );

  static const Border focusedBorder = Border.fromBorderSide(
    BorderSide(color: AppColors.borderFocused, width: widthThick),
  );

  static const Border selectedBorder = Border.fromBorderSide(
    BorderSide(color: AppColors.borderSelected, width: widthDefault),
  );

  static const Border disabledBorder = Border.fromBorderSide(
    BorderSide(color: AppColors.borderDisabled, width: widthDefault),
  );

  static const Border noneBorder = Border.fromBorderSide(
    BorderSide(color: Color(0x00000000), width: 0),
  );
}
