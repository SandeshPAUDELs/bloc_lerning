import 'package:bloc_project/bloc/carts/carts_bloc.dart';
import 'package:bloc_project/bloc/first/counter_bloc.dart';
import 'package:bloc_project/bloc/forms/form_bloc.dart';
import 'package:bloc_project/bloc/products/product_bloc.dart';
import 'package:bloc_project/bloc/users/users_bloc.dart';
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
    return MultiBlocProvider(
      providers: [
        BlocProvider<FormBloc>(
          create: (context) => FormBloc(),
        ),
        BlocProvider(
          create: (context) => CounterBloc(),
        ),
        BlocProvider(create: (context) => ProductBloc()),
        BlocProvider(create: (context) => UsersBloc()),
        BlocProvider(create: (context) => AuthenticateduserBloc()),
        BlocProvider(create: (context) => CartBloc()),
      ],
      child: const MaterialApp(
        home: FormExample(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
