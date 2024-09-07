import 'package:blogs_comments/core/theme/app_pallete.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final darkThemeMode = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: AppPallete.background,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppPallete.background,
    ),
  );
}
