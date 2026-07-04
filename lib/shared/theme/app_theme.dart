import 'package:flutter/material.dart';

class AppTheme {
  static const Color _primary = Color(0xFF2F6F4E);
  static const Color _onPrimary = Colors.white;
  static const Color _secondary = Color(0xFF1F4D36);
  static const Color _background = Color(0xFFF4F7F2);
  static const Color _surface = Color(0xFFFFFFFF);
  static const Color _surfaceVariant = Color(0xFFDDE6D8);

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: _primary,
      onPrimary: _onPrimary,
      secondary: _secondary,
      onSecondary: Colors.white,
      error: Color(0xFFB00020),
      onError: Colors.white,
      surface: _surface,
      onSurface: Color(0xFF1C2938),
      surfaceContainerHighest: _surfaceVariant,
      onSurfaceVariant: Color(0xFF545D64),
      outline: Color(0xFF8E9A99),
      shadow: Colors.black,
      inverseSurface: Color(0xFF2E3337),
      inversePrimary: _secondary,
    ),
    scaffoldBackgroundColor: _background,
    cardTheme: const CardThemeData(
      surfaceTintColor: _surface,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(22)),
      ),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: _surface,
      foregroundColor: Color(0xFF1C2938),
      elevation: 0,
      surfaceTintColor: _surface,
      iconTheme: IconThemeData(color: Color(0xFF1C2938)),
      titleTextStyle: TextStyle(
        color: Color(0xFF1C2938),
        fontSize: 20,
        fontWeight: FontWeight.w700,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: _primary,
        foregroundColor: _onPrimary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      filled: true,
      fillColor: Color(0xFFEEF0EA),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(16)),
        borderSide: BorderSide.none,
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: _primary,
      foregroundColor: _onPrimary,
    ),
    navigationBarTheme: NavigationBarThemeData(
      labelTextStyle: WidgetStateProperty.all(
        const TextStyle(fontWeight: FontWeight.w600),
      ),
      indicatorColor: _secondary,
    ),
  );
}
