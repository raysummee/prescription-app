import 'package:app/core/config/app_config.dart';
import 'package:app/core/theme/light_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/extension/theme_extension.dart';
import 'core/routes/app_routes.dart';

void main() {
  runApp(const EntryPoint());
}

class EntryPoint extends StatelessWidget {
  const EntryPoint({super.key});

  @override
  Widget build(BuildContext context) {
    return AppConfig(
      appTheme: AppThemeLight(),
      child: ScreenUtilInit(
        builder: (BuildContext context, Widget? child) { 
          return const App();
        },
      )
    );
  }
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final appTheme = AppConfig.of(context).appTheme;
    return MaterialApp(
      title: 'Flutter Demo',
      theme: appTheme.toThemeData(),
      onGenerateRoute: AppRoutes.onGenerateRoute
    );
  }
}
