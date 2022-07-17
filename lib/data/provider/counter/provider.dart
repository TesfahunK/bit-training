import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterStateProvider =
    StateNotifierProvider<CounterState, int>((ref) => CounterState());

class CounterState extends StateNotifier<int> {
  CounterState() : super(0);

  void add() {
    state = state + 1;
  }

  void sub() {
    state--;
  }
}

final counterDependentStateProvider =
    StateNotifierProvider<CounterDependentState, int>((ref) {
// TODO : your tasks here

  return CounterDependentState(ref);
});

class CounterDependentState extends StateNotifier<int> {
  final Ref ref;
  CounterDependentState(this.ref) : super(10) {
    state = ref.watch(counterStateProvider) + state;
  }
}
