import 'package:bloc_test/bloc_test.dart';
import 'package:bloc_trial/counter/logic/logic.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Counter Cubit', () {
    CounterCubit? counterCubit;
    setUp(() {
      counterCubit = CounterCubit();
    });
    tearDown(() {
      counterCubit!.close();
    });
    test('init state for CounteCubit is CounterState(counterValue: 0)', () {
      expect(counterCubit!.state,
          CounterState(counterValue: 0, wasIncremented: false));
    });
    blocTest<CounterCubit, CounterState>('decrement',
        build: () => CounterCubit(),
        act: (cubit) => cubit.decrement(),
        expect: () => [CounterState(counterValue: -1, wasIncremented: false)]);
    blocTest<CounterCubit, CounterState>('increment',
        build: () => CounterCubit(),
        act: (cubit) => cubit.increment(),
        expect: () => [CounterState(counterValue: 1, wasIncremented: true)]);
  });
}
