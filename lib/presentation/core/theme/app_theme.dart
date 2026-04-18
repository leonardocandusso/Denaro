import 'package:flutter/material.dart';
import 'colors.dart';

class AppTheme {
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.surface,
      primaryColor: AppColors.primary,
      
      // Tipografia Offline Rigorosa
      fontFamily: 'Inter',
      textTheme: const TextTheme(
        // Numeros críticos usam Monospace para alinhamento em grid HFT.
        displayLarge: TextStyle(fontFamily: 'RobotoMono', fontWeight: FontWeight.bold, color: AppColors.onSurface),
        displayMedium: TextStyle(fontFamily: 'RobotoMono', fontWeight: FontWeight.w600, color: AppColors.onSurface),
        bodyLarge: TextStyle(color: AppColors.onSurface),
        bodyMedium: TextStyle(color: AppColors.onSurfaceVariant),
      ),

      colorScheme: const ColorScheme.dark(
        surface: AppColors.surface,
        onSurface: AppColors.onSurface,
        onSurfaceVariant: AppColors.onSurfaceVariant,
        primary: AppColors.primary,
        onPrimary: AppColors.onPrimary,
        secondary: AppColors.secondary,
        onSecondary: AppColors.onSecondary,
        error: AppColors.error,
      ),
    );
  }
}
