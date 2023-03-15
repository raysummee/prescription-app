import 'package:app/features/login/presentation/pages/login_page.dart';
import 'package:flutter/material.dart';

class AppRoutes{
  static Route<dynamic>? onGenerateRoute(RouteSettings routeSettings){
    switch (routeSettings.name) {
      case "/":
        return MaterialPageRoute(
          builder: (_) => const LoginPage(),
        );
    }
    return null;
  }
}