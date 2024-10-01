import 'package:bloc_project/bloc/forms/form_bloc.dart';
import 'package:bloc_project/bloc/forms/form_event.dart';
import 'package:bloc_project/bloc/forms/form_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FormExample extends StatefulWidget {
  const FormExample({super.key});

  @override
  State<FormExample> createState() => _FormExampleState();
}

class _FormExampleState extends State<FormExample> {
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () => showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Fill the form'),
                  content: Column(
                    children: [
                      TextField(
                        controller: nameController,
                      ),
                      TextField(
                        controller: ageController,
                      ),
                      TextField(
                        controller: phoneController,
                      ),
                    ],
                  ),
                  actions: [
                    OutlinedButton(
                      onPressed: () {
                        context.read<FormBloc>().add(SaveEvent(name: nameController.text, age: ageController.text, phone: phoneController.text));
                        Navigator.of(context).pop();
                      },
                      child: Text('Save'),
                    ),
                  ],
                );
              })),
              
      body: Center(
        child: Column(
          children: [
            BlocBuilder<FormBloc, CustomFormState>(
              builder: (context, state) {
                return Column(
                  children: [
                    Text(state.nameController),
                    Text(state.ageController),
                    Text(state.phoneController),
                  ],
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
