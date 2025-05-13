//handle counter page
import 'package:bloc_listener/features/counter/bloc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  @override
  void initState() {
    counterBloc.add(CounterIncrementEvent(val: 0));

    super.initState();
  }

  //create instance of block
  final counterBloc = CounterBloc();
  @override
  Widget build(BuildContext context) {
    return BlocListener<CounterBloc, CounterState>(
      bloc: counterBloc,
      listener: (context, state) {
        if (state is CounterShowSnackBarActionState) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('SnackBar message')));
        } else if (state is CounterIncrementState) {
          setState(() {});
        }
        // TODO: implement listener
      },
      child: Scaffold(
        appBar: AppBar(title: Text('Counter App'), centerTitle: true),
        body: Column(
          children: [
            Text('Counter: '),
            ElevatedButton(onPressed: () {}, child: Text('Increase')),
            ElevatedButton(
              onPressed: () {
                counterBloc.add(CounterSnackBarEvent());
              },
              child: Text('Snackbar'),
            ),
          ],
        ),
      ),
    );
  }
}
