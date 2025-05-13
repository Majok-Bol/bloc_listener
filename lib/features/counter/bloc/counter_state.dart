part of 'counter_bloc.dart';

@immutable
sealed class CounterState {}

final class CounterInitial extends CounterState {}

class CounterIncrementState extends CounterState {
  final int val;

  CounterIncrementState({required this.val});
}

abstract class CounterActionState extends CounterState {}

//only invoke a function
//not rebuilding the ui
class CounterShowSnackBarActionState extends CounterActionState {}

// //handle successful loading state
// class CounterLoadingStateSuccessful extends CounterState {
//   final int count;

//   CounterLoadingStateSuccessful({required this.count});
// }
//handle snackbar state
class CounterSnackBarState extends CounterState {}
