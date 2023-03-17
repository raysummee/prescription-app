import 'package:app/core/config/app_config.dart';
import 'package:app/core/theme/light_theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/extension/theme_extension.dart';
import 'core/observer/custom_bloc_observer.dart';
import 'core/routes/app_routes.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  Bloc.observer = CustomBlocObserver();
  await FirebaseAuth.instance.signOut();
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
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: appTheme.toThemeData(),
      routerConfig: AppRoutes.router,
    );
  }
}
