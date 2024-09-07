import 'package:blogs_comments/core/theme/app_pallete.dart';
import 'package:flutter/material.dart';

class AppTheme {
  // static _border([Color color = AppPallete.borderColor]) => OutlineInputBorder(
  //       borderSide: BorderSide(
  //         color: color,
  //         width: 3,
  //       ),
  //       borderRadius: BorderRadius.circular(10),
  //     );

  static final darkThemeMode = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: AppPallete.background,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppPallete.background,
    ),
    // chipTheme: const ChipThemeData(
    //   color: MaterialStatePropertyAll(AppPallete.white),
    //   side: BorderSide.none,
    // ),
  );
}
