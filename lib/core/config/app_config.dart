import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class AppConfig extends InheritedWidget {
  final AppTheme appTheme;

  const AppConfig({super.key, required this.appTheme, required super.child});

  static AppConfig of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<AppConfig>()!);
  }

  @override
  bool updateShouldNotify(AppConfig oldWidget) {
    return appTheme != oldWidget.appTheme;
  }
}
