import 'package:flutter/material.dart';

/// Paleta Flat Segura (Fase 3). Extraida fielmente do painel HFT Stitch.
/// Nenhuma cor deve possuir canal Alpha/Opacity alto na UI Root para evitar drops de FPS.
class AppColors {
  // Surfaces
  static const Color surface = Color(0xFF0E0E0E); // Fundo Principal 
  static const Color surfaceContainer = Color(0xFF191A1A); // Cards
  static const Color surfaceContainerHigh = Color(0xFF1F2020);
  static const Color surfaceContainerLowest = Color(0xFF000000); // Sidebar
  
  // Typography
  static const Color onSurface = Color(0xFFE7E5E5);
  static const Color onSurfaceVariant = Color(0xFFACABAA);
  static const Color outlineVariant = Color(0xFF484848);
  
  // High-Contrast Accent (Income)
  static const Color primary = Color(0xFF77DD77); // Sage Green
  static const Color onPrimary = Color(0xFF004B11);
  static const Color primaryContainer = Color(0xFF005314);
  
  // High-Contrast Accent (Expense)
  static const Color secondary = Color(0xFFD58F24); // Soft Amber
  static const Color onSecondary = Color(0xFF301C00);

  // Alerts
  static const Color error = Color(0xFFEE7D77);
}
