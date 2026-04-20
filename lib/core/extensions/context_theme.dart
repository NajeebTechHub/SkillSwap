import 'package:flutter/material.dart';
import 'package:skill_swap/core/theme/extensions/app_custom_colors.dart';

extension ContextTheme on BuildContext{
  ThemeData get appTheme => Theme.of(this);
  TextTheme get appTextTheme => appTheme.textTheme;
  ColorScheme get colors => appTheme.colorScheme;
  double get height => MediaQuery.of(this).size.height;
  double get width => MediaQuery.of(this).size.width;
  AppCustomColors get customColors => Theme.of(this).extension<AppCustomColors>()!;
}
