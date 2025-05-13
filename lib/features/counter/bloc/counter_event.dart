part of 'counter_bloc.dart';

@immutable
sealed class CounterEvent {}

//initial event
//on opening the page
// class CounterInitialEvent extends CounterEvent {}

//increment event
class CounterIncrementEvent extends CounterEvent {
  final int val;

  CounterIncrementEvent({required this.val});
}

class CounterSnackBarEvent extends CounterEvent {}
