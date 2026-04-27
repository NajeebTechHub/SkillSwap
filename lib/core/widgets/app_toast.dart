import 'dart:ui';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:skill_swap/core/theme/app_colors.dart';

class AppToast {
  static void showToast({
    required String message,
    ToastGravity gravity = ToastGravity.BOTTOM,
    Color bgColor = AppColors.textPrimary,
    Color textColor = AppColors.surface,
    double fontSize = 12.0
}){
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: gravity,
      backgroundColor: bgColor,
      textColor: textColor,
      fontSize: fontSize
    );
  }
}