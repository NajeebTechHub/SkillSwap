import 'package:flutter/material.dart';
import 'package:skill_swap/core/theme/app_colors.dart';
import 'package:skill_swap/core/theme/extensions/app_custom_colors.dart';

class AppTheme {
  static ThemeData get lightTheme => _createTheme(Brightness.light);
  static ThemeData get darkTheme => _createTheme(Brightness.dark);

  static ThemeData _createTheme(Brightness brightness) {
    final _ = brightness == Brightness.dark;

    final ColorScheme colorScheme = ColorScheme.fromSeed(
      seedColor: AppColors.primary,
      brightness: brightness,
      primary: AppColors.primary,
      onPrimary: AppColors.background,
      secondary: AppColors.accent,
      onSecondary: AppColors.background,
      surface: AppColors.background,
      onSurface: AppColors.textPrimary,
      onSurfaceVariant: AppColors.textSecondary,
      outline: AppColors.outline,
      error: AppColors.error,
      onError: AppColors.background,
    );

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorScheme: colorScheme,
      fontFamily: 'Inter',

      appBarTheme: AppBarTheme(
        backgroundColor: colorScheme.surface,
        foregroundColor: colorScheme.onSurface,
        elevation: 0,
        centerTitle: false,
        titleTextStyle: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 18,
          color: colorScheme.onSurface,
        ),
      ),

      scaffoldBackgroundColor: colorScheme.surface,

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
          textStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        ),
      ),

      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: colorScheme.primary,
          side: BorderSide(color: colorScheme.primary),
          textStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        ),
      ),

      navigationBarTheme: NavigationBarThemeData(
        indicatorColor: colorScheme.primary.withValues(alpha: 0.3),
        labelTextStyle: WidgetStateProperty.all(
          const TextStyle(fontWeight: FontWeight.w600),
        ),
      ),

      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: colorScheme.primary,
          textStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
        ),
      ),

      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
        shape: const CircleBorder(),
        iconSize: 28,
      ),

      textTheme: TextTheme(
        displayLarge: TextStyle(fontSize: 57, fontWeight: FontWeight.w400, color: colorScheme.onSurface),
        displayMedium: TextStyle(fontSize: 45, fontWeight: FontWeight.w400, color: colorScheme.onSurface),
        displaySmall: TextStyle(fontSize: 36, fontWeight: FontWeight.w400, color: colorScheme.onSurface),

        headlineLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.w600, color: colorScheme.onSurface),
        headlineMedium: TextStyle(fontSize: 28, fontWeight: FontWeight.w600, color: colorScheme.onSurface),
        headlineSmall: TextStyle(fontSize: 24, fontWeight: FontWeight.w600, color: colorScheme.onSurface),

        titleLarge: TextStyle(fontSize: 22, fontWeight: FontWeight.w600, color: colorScheme.onSurface),
        titleMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: colorScheme.onSurface),
        titleSmall: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: colorScheme.onSurface),

        bodyLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: colorScheme.onSurface),
        bodyMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: colorScheme.onSurface),
        bodySmall: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: colorScheme.onSurfaceVariant),

        labelLarge: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: colorScheme.onSurface),
        labelMedium: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: colorScheme.onSurface),
        labelSmall: TextStyle(fontSize: 11, fontWeight: FontWeight.w500, color: colorScheme.onSurfaceVariant),
      ),

      extensions: const <ThemeExtension<dynamic>>[
        AppCustomColors(
          success: AppColors.success,
          error: AppColors.error,
          accent: AppColors.accent,
        ),
      ],
    );
  }
}