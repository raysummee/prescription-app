import 'package:app/core/config/app_config.dart';
import 'package:app/core/icon/app_icon.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../home/presentation/components/home_appbar.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key, required this.child});
  final Widget child;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    final appTheme = AppConfig.of(context).appTheme;
    return Scaffold(
      appBar: const HomeAppbar(),
      body: widget.child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _calculateSelectedIndex(context),
        onTap: onTap,
        selectedItemColor: appTheme.colorPrimary,
        unselectedItemColor: appTheme.colorTextSecondary,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(AppIcon.uilHomeAlt), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(AppIcon.mdiClockTimeSevenOutline), label: 'Timeline'),
          BottomNavigationBarItem(
              icon: Icon(AppIcon.uilSetting), label: 'Settings'),
        ],
      ),
    );
  }

  int _calculateSelectedIndex(BuildContext context) {
    final GoRouter route = GoRouter.of(context);
    final String location = route.location;
    if (location.startsWith('/home')) {
      return 0;
    }
    if (location.startsWith('/timeline')) {
      return 1;
    }
    if (location.startsWith('/settings')) {
      return 2;
    }
    return 0;
  }

  void onTap(int value) {
    switch (value) {
      case 0:
        return context.go('/home');
      case 1:
        return context.go('/timeline');
      case 2:
        return context.go('/settings');
    }
  }
}
