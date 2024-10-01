import 'package:bloc_project/bloc/counter_bloc.dart';
import 'package:bloc_project/views/example.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => CounterBloc(),
    child: MaterialApp(
      home: Example(),
    ),
    
    );

  }
}