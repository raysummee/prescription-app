import 'package:app/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

extension AppThemeExtension on AppTheme{
  ThemeData toThemeData(){
    return ThemeData(
      scaffoldBackgroundColor: backgroundColor,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      primaryColor: colorPrimary,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      brightness: Brightness.light,
      fontFamily: 'poppins',
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
      ),
      appBarTheme: AppBarTheme(
          elevation: 0, backgroundColor: colorAppbar, foregroundColor: colorTextPrimary),
    );
  }
}