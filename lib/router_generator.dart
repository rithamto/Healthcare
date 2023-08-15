import 'package:flutter/material.dart';

import 'screen/main_screen/main_screen.dart';
import 'screen/splash_screen/splash_screen.dart';

class RouteGenerator {
  static const String splashScreen = '/';
  static const String mainScreen = '/main-screen';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (context) => SplashScreen.provider(),
          settings: settings,
        );
      case '/main-screen':
        return MaterialPageRoute(
          builder: (context) => const MainScreen(),
          settings: settings,
        );
      default:
        return MaterialPageRoute(
          builder: (context) => SplashScreen.provider(),
          settings: settings,
        );

    }
  }
}
