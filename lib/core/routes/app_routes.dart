import 'package:app/features/home/presentation/pages/home_page.dart';
import 'package:app/features/login/presentation/bloc/authentication/authentication_bloc.dart';
import 'package:app/features/login/presentation/pages/login_page.dart';
import 'package:app/features/login/presentation/pages/register_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AppRoutes{
  static final router = GoRouter(
    debugLogDiagnostics: true,
    redirect: (context, state) {
      final isFailure = context.read<AuthenticationBloc>().state is AuthenticationFailure;
      final onIsFailure = state.location == '/login';
      if (isFailure && !onIsFailure) return '/login';
      return null;
    },
    routes: [
      GoRoute(
        path: "/",
        builder: (context, state) {
          return BlocConsumer<AuthenticationBloc, AuthenticationState>(
            buildWhen: (previous, current) {
              return previous is AuthenticationInitial;
            },
            listener: (context, state) {
              if(state is AuthenticationFailure){
                context.go("/login");
              }
            },
            builder: (context, state) {
              if(state is AuthenticationSuccess){
                return const HomePage();
              }
              return const Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            },
          );
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