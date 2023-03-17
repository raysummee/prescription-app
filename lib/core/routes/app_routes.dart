import 'package:app/features/home/presentation/pages/home_page.dart';
import 'package:app/features/login/data/repository/authentication_repository.dart';
import 'package:app/features/login/domain/repository/authentication_repository.dart';
import 'package:app/features/login/presentation/pages/login_page.dart';
import 'package:app/features/login/presentation/pages/register_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRoutes{
  static final AuthenticationRepository _repository = AuthenticationRepositoryImp();
  static final router = GoRouter(
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const HomePage(),
        redirect: (context, state) {
          if(_repository.getCurrentUser()==null){
            return "/login";
          }
          return null;
        },
      ),
      GoRoute(
        path: '/register',
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            child: const RegisterPage(), 
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              return FadeTransition(opacity: animation, child: child,);
            },
          );
        },
      ),
      GoRoute(
        path: '/login',
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            child: const LoginPage(), 
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              return FadeTransition(opacity: animation, child: child,);
            },
          );
        },
      ),
    ],
  );
}