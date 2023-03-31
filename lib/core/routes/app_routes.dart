import 'package:app/features/home/presentation/pages/home_page.dart';
import 'package:app/features/login/presentation/bloc/authentication/authentication_bloc.dart';
import 'package:app/features/login/presentation/pages/login_page.dart';
import 'package:app/features/login/presentation/pages/register_page.dart';
import 'package:app/features/main/presentation/pages/main_page.dart';
import 'package:app/features/settings/presentation/pages/settings_page.dart';
import 'package:app/features/timeline/presentation/pages/timeline_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AppRoutes {
  static final router = GoRouter(
    debugLogDiagnostics: true,
    redirect: (context, state) {
      final isFailure =
          context.read<AuthenticationBloc>().state is AuthenticationFailure;
      final onIsFailure = state.location == '/login';
      if (isFailure && !onIsFailure) return '/login';
      return null;
    },
    routes: [
      GoRoute(
        path: "/",
        redirect: (context, state) {
          final isAuthenticated =
              context.read<AuthenticationBloc>().state is AuthenticationSuccess;
          if (isAuthenticated) {
            return "/home";
          }
          return null;
        },
        builder: (context, state) {
          return BlocListener<AuthenticationBloc, AuthenticationState>(
            listener: (context, state) {
              if (state is AuthenticationFailure) {
                context.go("/login");
              }
              if (state is AuthenticationSuccess) {
                context.go("/home");
              }
            },
            child: const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        },
      ),
      ShellRoute(
          pageBuilder: (context, state, child) {
            return CustomTransitionPage(
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  return FadeTransition(opacity: animation, child: child);
                },
                child: MainPage(child: child));
          },
          routes: [
            GoRoute(
              path: "/home",
              pageBuilder: (context, state) =>
                  const NoTransitionPage(child: HomePage()),
            ),
            GoRoute(
              path: "/timeline",
              pageBuilder: (context, state) =>
                  const NoTransitionPage(child: TimelinePage()),
            ),
            GoRoute(
              path: "/settings",
              pageBuilder: (context, state) =>
                  const NoTransitionPage(child: SettingsPage()),
            ),
          ]),
      GoRoute(
        path: '/register',
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            child: const RegisterPage(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
          );
        },
      ),
      GoRoute(
        path: '/login',
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            child: const LoginPage(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
          );
        },
      ),
    ],
  );
}
