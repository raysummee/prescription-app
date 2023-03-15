import 'package:flutter/material.dart';

abstract class AppTheme {
  late Color colorPrimary;
  late Color colorSecondary;
  late Color colorTextPrimary;
  late Color colorTextSecondary;
  late Color colorTextError;
  late Color colorAccentSecondary;
  late Color colorTertiary;
  late Color colorAppbar;
  late Color colorProgressBackground;
  late Color colorProgress;
  late Color backgroundColor;

  late BoxDecoration bottomButtonDecoration;

  ButtonStyle buttonStyle(Color color, {bool withBorder});

}
