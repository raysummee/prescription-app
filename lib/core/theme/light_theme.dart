import 'package:flutter/material.dart';

import 'app_theme.dart';

class AppThemeLight implements AppTheme {
  @override
  Color colorPrimary = const Color.fromRGBO(57, 60, 153, 1);

  @override
  Color colorSecondary = const Color.fromRGBO(234, 237, 244, 1);

  @override
  Color colorTextPrimary = Colors.black;

  @override
  Color colorTextSecondary = const Color(0xFF9D9DA8);
  
  @override
  Color colorTextError = const Color(0xFFCD594D);

  @override
  Color colorShadow = const Color.fromRGBO(224, 225, 255, 0.3);
  
  @override
  Color colorAccentPrimary = const Color.fromRGBO(246, 247, 251, 1);

  @override
  Color colorTertiary = const Color.fromRGBO(207, 207, 207, 1);

  @override
  Color colorAppbar =  const Color.fromRGBO(250, 250, 250, 1);

  @override
  ButtonStyle buttonStyle(Color color, {bool withBorder = false}) =>
      ButtonStyle(
          elevation: MaterialStateProperty.all<double>(0),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))),
          backgroundColor: MaterialStateProperty.all<Color>(color));

  @override
  Color colorProgress = const Color(0xFF4930EE);

  @override
  Color colorProgressBackground = const Color(0xFF9D9DA8);

  @override
  Color backgroundColor = const Color.fromRGBO(250, 250, 250, 1);

  @override
  BoxDecoration bottomButtonDecoration = const BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      stops: [0, 0.25],
      colors: [
        Colors.transparent,
        Colors.black,
      ],
    ),
  );
}
