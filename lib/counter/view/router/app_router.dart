import 'package:flutter/material.dart';

import '../screens/screens.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings routeSettings) {
    // final GlobalKey<ScaffoldState> key = settings.arguments;
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(
            title: 'Home Screen',
            color: Colors.greenAccent,
          ),
        );
      case '/second':
        return MaterialPageRoute(
          builder: (_) => const SecondScreen(
            title: 'Second Screen',
            color: Colors.blueAccent,
            // homeScreenKey: key,
          ),
        );
      case '/third':
        return MaterialPageRoute(
          builder: (_) => const ThirdScreen(
            title: 'Third Screen',
            color: Colors.purpleAccent,
            // homeScreenKey: key,
          ),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(
            title: 'Home Screen',
            color: Colors.greenAccent,
          ),
        );
    }
  }
}
