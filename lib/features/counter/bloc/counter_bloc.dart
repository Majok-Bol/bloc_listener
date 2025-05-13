import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterInitial()) {
    on<CounterIncrementEvent>(counterIncrementEvent);
    on<CounterSnackBarEvent>(counterSnackBarEvent);
  }
  int value = 0;

  FutureOr<void> counterIncrementEvent(
    CounterIncrementEvent event,
    Emitter<CounterState> emit,
  ) {
    //increase the counter
    value++;
    emit(CounterIncrementState(val: value));
  }

  //handle snackbar state
  FutureOr<void> counterSnackBarEvent(
    CounterSnackBarEvent event,
    Emitter<CounterState> emit,
  ) {
    emit(CounterShowSnackBarActionState());
  }
}
