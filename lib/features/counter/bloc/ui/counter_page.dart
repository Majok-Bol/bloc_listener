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

  int val = 0;

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
          setState(() {
            val = val + 1;
          });
        }
        // TODO: implement listener
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Counter App'),
          centerTitle: true,
          backgroundColor: Colors.blue.shade200,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Counter: $val ', style: TextStyle(fontSize: 22)),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    counterBloc.add(CounterIncrementEvent(val: val));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green.shade100,
                  ),
                  child: Text('Increase', style: TextStyle(fontSize: 22)),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    counterBloc.add(CounterSnackBarEvent());
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.shade100,
                  ),
                  child: Text('Snackbar', style: TextStyle(fontSize: 22)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
