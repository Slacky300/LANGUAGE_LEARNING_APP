import 'package:flutter/material.dart';
import 'package:lla/core/theme/app_pallete.dart';

class AppTheme{

  static  _border([Color color= AppPallete.borderColor]) => OutlineInputBorder(
    borderSide:  BorderSide(
      color:  color,
      width: 3
    ),
    borderRadius: BorderRadius.circular(10)
  );

  static final darkThemeMode = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: AppPallete.backgroundColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppPallete.backgroundColor,
      elevation: 0,
      iconTheme: IconThemeData(
        color: AppPallete.textColor
      )
    ),
    inputDecorationTheme:  InputDecorationTheme(
      contentPadding:  const EdgeInsets.all(27),
      enabledBorder: _border(),
      focusedBorder: _border(AppPallete.gradient4),
      
    ),
  );
}