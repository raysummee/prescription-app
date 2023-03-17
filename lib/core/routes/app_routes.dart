import 'package:app/features/home/presentation/pages/home_page.dart';
import 'package:app/features/login/presentation/pages/login_page.dart';
import 'package:go_router/go_router.dart';

class AppRoutes{
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const LoginPage(),
        routes: [
          GoRoute(
            path: 'home',
            builder: (context, state) => const HomePage(),
          ),
        ]
      ),
    ],
  );
}