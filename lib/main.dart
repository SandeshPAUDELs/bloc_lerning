import 'package:bloc_project/bloc/forms/form_bloc.dart';
import 'package:bloc_project/views/form_example.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<FormBloc>(
      create: (context) => FormBloc(),
      child: const MaterialApp(
        home: FormExample(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
