/* import 'package:flutter/material.dart';

import '../router/app_route_generated.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AppRoute _appRouter = AppRoute();

  @override
  void dispose() {
    _appRouter.dispose();
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
      // pass the function as an argument, not as result
      onGenerateRoute: _appRouter.onGenerateRoute,
    );
  }
}
 */