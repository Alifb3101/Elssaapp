import 'package:flutter/material.dart';

class AppTheme {
  static const _primary = Color(0xFF0A84FF);
  static const _textPrimary = Color(0xFF111111);
  static const _textSecondary = Color(0xFF6B7280);
  static const _surface = Color(0xFFF6F7F9);

  static ThemeData get light => ThemeData(
    useMaterial3: false,
    primaryColor: _primary,
    scaffoldBackgroundColor: Colors.white,
    colorScheme: ColorScheme.fromSeed(seedColor: _primary),
    textTheme: const TextTheme(
      titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: _textPrimary),
      titleMedium: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: _textPrimary),
      bodyMedium: TextStyle(fontSize: 14, color: _textSecondary),
      bodySmall: TextStyle(fontSize: 12, color: _textSecondary),
    ),
    dividerColor: const Color(0xFFE5E7EB),
    splashFactory: InkRipple.splashFactory,
  );

  static const surface = _surface;
  static const textSecondary = _textSecondary;
}
