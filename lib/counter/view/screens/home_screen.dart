import 'package:bloc_trial/counter/view/screens/second_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants/enums.dart';
import '../../logic/logic.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.title, this.color})
      : super(key: key);

  final String title;
  final Color? color;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: widget.color,
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              BlocBuilder<InternetCubit, InternetState>(
                  builder: (context, state) {
                if (state is InternetConnected &&
                    state.connectionType == ConnectionType.wifi) {
                  return const Text(
                    'WIFI',
                  );
                } else if (state is InternetConnected &&
                    state.connectionType == ConnectionType.mobile) {
                  return const Text(
                    'Mobile',
                  );
                } else if (state is InternetDisconnected) {
                  return const Text(
                    'Disconnected',
                  );
                }

                return const CircularProgressIndicator();
              }),
              const Text(
                'Consumer',
              ),
              const Text(
                'Counter Value',
              ),
              BlocConsumer<CounterCubit, CounterState>(
                listener: (context, state) {
                  if (state.wasIncremented == true) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('++Increment++'),
                      duration: Duration(milliseconds: 100),
                    ));
                  } else if (state.wasIncremented == false) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('--Decrement--'),
                      duration: Duration(milliseconds: 100),
                      dismissDirection: DismissDirection.up,
                    ));
                  }
                },
                builder: (context, state) {
                  if (state.counterValue < 0) {
                    return Text(
                      'Cons NEG ${state.counterValue}',
                      style: Theme.of(context).textTheme.headline4,
                    );
                  } else if (state.counterValue % 2 == 0) {
                    return Text(
                      'Cons Even ${state.counterValue}',
                      style: Theme.of(context).textTheme.headline4,
                    );
                  } else if (state.counterValue == 1) {
                    return Text(
                      'Cons NUMBA WAN',
                      style: Theme.of(context).textTheme.headline4,
                    );
                  } else if (state.counterValue > 0) {
                    return Text(
                      'Cons POS ${state.counterValue}',
                      style: Theme.of(context).textTheme.headline4,
                    );
                  } else {
                    return Text(
                      state.counterValue.toString(),
                      style: Theme.of(context).textTheme.headline4,
                    );
                  }
                },
              ),
              /*            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FloatingActionButton(
                    heroTag: null,
                    onPressed: () {
                      BlocProvider.of<CounterCubit>(context).decrement();
                    },
                    tooltip: 'Decrement',
                    child: const Icon(Icons.remove),
                  ),
                  FloatingActionButton(
                    heroTag: null,
                    onPressed: () {
                      context.read<CounterCubit>().increment();
                    },
                    tooltip: 'Increment',
                    child: const Icon(Icons.add),
                  ),
                ],
              ), */
              MaterialButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => BlocProvider.value(
                          value: /*  BlocProvider.of<CounterCubit>(
                              context), */
                              context.read<CounterCubit>(),
                          child: const SecondScreen(
                            title: 'Second Screen',
                            color: Colors.blueAccent,
                          ))));
                },
                child: const Text('Anon Route - 2nd Screen'),
                color: widget.color,
              ),
              MaterialButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/second');
                },
                child: const Text('Named/Generated Route - 2nd Screen'),
                color: widget.color,
              ),
              MaterialButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/third');
                },
                child: const Text('Named/Generated Route - 3rd Screen'),
                color: widget.color,
              )
            ],
          ),
        )
        // const ListenBuildBloc(),
        );
  }
}
