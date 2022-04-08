/* import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/logic.dart';
import '../screens/screens.dart';

class MainAnonNamed extends StatefulWidget {
  const MainAnonNamed({Key? key}) : super(key: key);

  @override
  State<MainAnonNamed> createState() => _MainAnonNamedState();
}

class _MainAnonNamedState extends State<MainAnonNamed> {
  //to pass only one cubit and not create new one
  final CounterCubit _counterCubit = CounterCubit();

  @override
  void dispose() {
    //if cubit is manually created, you need to dispose/close it manually as well
    _counterCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        /* home: BlocProvider<CounterCubit>(
        create: (context) => CounterCubit(),
        child: const HomeScreen(
          title: 'Flutter Demo Home Page',
          color: Colors.greenAccent, 
        ),
      ), */
        initialRoute: '/',
        routes: {
          '/': (context) => BlocProvider<CounterCubit>.value(
              value: _counterCubit,
              child: const HomeScreen(
                title: '1st ',
                color: Colors.redAccent,
              )),
          '/second': (context) => BlocProvider<CounterCubit>.value(
              value: _counterCubit,
              child: const SecondScreen(
                title: '2nd',
                color: Colors.orangeAccent,
              )),
          '/third': (context) => BlocProvider<CounterCubit>.value(
              value: _counterCubit,
              child: const ThirdScreen(
                title: '3rd',
                color: Colors.yellowAccent,
              )),
        });
  }
}
 */