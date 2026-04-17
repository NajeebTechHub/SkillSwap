import 'package:flutter/material.dart';

extension ContextTheme on BuildContext{
  ThemeData get appTheme => Theme.of(this);
  TextTheme get appTextTheme => appTheme.textTheme;
  ColorScheme get colors => appTheme.colorScheme;
  double get height => MediaQuery.of(this).size.height;
  double get width => MediaQuery.of(this).size.width;
}
