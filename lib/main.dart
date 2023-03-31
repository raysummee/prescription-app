import 'package:app/core/config/app_config.dart';
import 'package:app/core/theme/light_theme.dart';
import 'package:app/features/login/data/repository/authentication_repository.dart';
import 'package:app/features/medicine/data/repository/medicine_repository.dart';
import 'package:app/features/timeline/presentation/bloc/data_pick/cubit/data_pick_cubit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'core/extension/theme_extension.dart';
import 'core/observer/custom_bloc_observer.dart';
import 'core/routes/app_routes.dart';
import 'features/login/presentation/bloc/authentication/authentication_bloc.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Bloc.observer = CustomBlocObserver();
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
        ));
  }
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final appTheme = AppConfig.of(context).appTheme;
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => AuthenticationRepositoryImp(),
        ),
        RepositoryProvider(
          create: (context) => MedicineRepositoryImpl(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                AuthenticationBloc(context.read<AuthenticationRepositoryImp>())
                  ..add(AuthenticationStarted()),
          ),
          BlocProvider(
            create: (context) => DatePickCubit(),
          ),
        ],
        child: MaterialApp.router(
          title: 'HealthAid',
          theme: appTheme.toThemeData(),
          routerConfig: AppRoutes.router,
        ),
      ),
    );
  }
}
