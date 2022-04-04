import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../logic/logic.dart';

class ConsumerBloc extends StatelessWidget {
  const ConsumerBloc({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
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
                    content: Text("+++++"),
                    duration: Duration(milliseconds: 200)));
              } else if (state.wasIncremented == false) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("----"),
                    duration: Duration(milliseconds: 200)));
              }
            },
            builder: (context, state) {
              if (state.counterValue < 0) {
                return Text(
                  "Cons NEG ${state.counterValue}",
                  style: Theme.of(context).textTheme.headline4,
                );
              } else if (state.counterValue % 2 == 0) {
                return Text(
                  "Cons Even ${state.counterValue}",
                  style: Theme.of(context).textTheme.headline4,
                );
              } else if (state.counterValue == 1) {
                return Text(
                  "Cons NUMBA WAN",
                  style: Theme.of(context).textTheme.headline4,
                );
              } else if (state.counterValue > 0) {
                return Text(
                  "Cons POS ${state.counterValue}",
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FloatingActionButton(
                onPressed: () {
                  BlocProvider.of<CounterCubit>(context).decrement();
                },
                tooltip: 'Decrement',
                child: const Icon(Icons.remove),
              ),
              FloatingActionButton(
                onPressed: () {
                  context.read<CounterCubit>().increment();
                },
                tooltip: 'Increment',
                child: const Icon(Icons.add),
              ),
            ],
          )
        ],
      ),
    );
  }
}
