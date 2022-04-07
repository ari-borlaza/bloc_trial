import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/logic.dart';
import '../screens/screens.dart';

class AppRouter {
  final CounterCubit _counterCubit = CounterCubit();

  Route onGenerateRoute(RouteSettings routeSettings) {
    // final GlobalKey<ScaffoldState> key = settings.arguments;
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => BlocProvider<CounterCubit>.value(
            value: _counterCubit,
            child: const HomeScreen(
              title: 'Home Screen',
              color: Colors.greenAccent,
            ),
          ),
        );
      case '/second':
        return MaterialPageRoute(
          builder: (_) => BlocProvider<CounterCubit>.value(
            value: _counterCubit,
            child: const SecondScreen(
              title: 'Second Screen',
              color: Colors.blueAccent,
              // homeScreenKey: key,
            ),
          ),
        );
      case '/third':
        return MaterialPageRoute(
          builder: (_) => BlocProvider<CounterCubit>.value(
            value: _counterCubit,
            child: const ThirdScreen(
              title: 'Third Screen',
              color: Colors.purpleAccent,
              // homeScreenKey: key,
            ),
          ),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<CounterCubit>.value(
            value: _counterCubit,
            child: const HomeScreen(
              title: 'Home Screen',
              color: Colors.greenAccent,
            ),
          ),
        );
    }
  }

  void dispose() {
    _counterCubit.close();
  }
}
