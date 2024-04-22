import 'package:flutter_bloc/flutter_bloc.dart';


abstract class CounterEvent {}

class CounterIncremented extends CounterEvent {}

class CounterDecremented extends CounterEvent {}

abstract class CounterState {
  get counter => null;
}

class CounterLoaded extends CounterState {
  @override
  final int counter;

  CounterLoaded(this.counter);
}


class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterLoaded(0)) {
    on<CounterIncremented>((event, emit) {
      emit(CounterLoaded(state.counter + 1));
    });

    on<CounterDecremented>((event, emit) {
      emit(CounterLoaded(state.counter - 1));
    });
  }
}