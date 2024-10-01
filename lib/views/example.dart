import 'package:bloc_project/bloc/first/counter_bloc.dart';
import 'package:bloc_project/bloc/first/counter_event.dart';
import 'package:bloc_project/bloc/first/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Example extends StatefulWidget {
  const Example({super.key});

  @override
  State<Example> createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
            onPressed: () =>
                context.read<CounterBloc>().add(IncrementCounter())),
        body: Center(
          child: Column(
            children: [
              BlocBuilder<CounterBloc, CounterState>(
                builder: (context, state) {
                  return Text(state.counter.toString(),
                      style: TextStyle(fontSize: 30));
                },
              )
            ],
          ),
        ));
  }
}
