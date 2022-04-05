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
      expect(counterCubit!.state, CounterState(counterValue: 0));
    });
  });
}
