import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';

enum CounterEvent { increment, decrement }

class CounterBloc extends Bloc<CounterEvent, int> {
  @override
  int get initialState => 0;

  @override
  Stream<int> mapEventToState(CounterEvent event) {
    var current = currentState;

    switch (event) {
      case CounterEvent.decrement:
        current = currentState - 1;
        break;
      case CounterEvent.increment:
        current = currentState + 1;
        break;
    }
    return Future.value(current).asStream();
  }
}
