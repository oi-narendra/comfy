import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// Configuring the theme of an application.

class AppTheme {
  static const Color _kPrimaryColor = Color(0xFF1F65A7);
  static const Color _kPrimaryColorLight = Color(0xFF4F8CC9);

  static const Color _kAccentColor = Color(0xFF1F65A7);
  static const Color _kBackgroundColor = Color(0xFFE5E5E5);
  static const Color _kSurfaceColor = Color(0xFFFFFFFF);
  static const Color _kErrorColor = Color(0xFFB00020);

  static const Color _kOnPrimaryColor = Color(0xFFFFFFFF);

  static const Color _kOnBackgroundColor = Color(0xFF000000);
  static const Color _kOnSurfaceColor = Color(0xFF000000);
  static const Color _kOnErrorColor = Color(0xFFFFFFFF);

  static ThemeData get defaultTheme {
    return ThemeData.from(
      colorScheme: const ColorScheme(
        primary: _kPrimaryColor,
        primaryContainer: _kPrimaryColorLight,
        onPrimary: _kOnPrimaryColor,
        secondary: _kAccentColor,
        surface: _kSurfaceColor,
        background: _kBackgroundColor,
        error: _kErrorColor,
        onSecondary: _kOnPrimaryColor,
        onSurface: _kOnSurfaceColor,
        onBackground: _kOnBackgroundColor,
        onError: _kOnErrorColor,
        brightness: Brightness.light,
      ),
      textTheme: Typography.material2018(platform: defaultTargetPlatform).black,
    );
  }
}
