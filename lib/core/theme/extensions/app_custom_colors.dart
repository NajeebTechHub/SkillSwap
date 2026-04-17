import 'package:flutter/material.dart';

class AppCustomColors extends ThemeExtension<AppCustomColors> {

  const AppCustomColors({
    required this.success,
    required this.error,
    required this.accent,
  });
  final Color success;
  final Color error;
  final Color accent;

  @override
  AppCustomColors copyWith({
    Color? success,
    Color? error,
    Color? accent,
  }) {
    return AppCustomColors(
      success: success ?? this.success,
      error: error ?? this.error,
      accent: accent ?? this.accent,
    );
  }

  @override
  AppCustomColors lerp(ThemeExtension<AppCustomColors>? other, double t) {
    if (other is! AppCustomColors) return this;
    return AppCustomColors(
      success: Color.lerp(success, other.success, t)!,
      error: Color.lerp(error, other.error, t)!,
      accent: Color.lerp(accent, other.accent, t)!,
    );
  }
}