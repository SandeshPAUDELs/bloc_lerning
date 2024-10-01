import 'package:bloc_project/bloc/forms/form_bloc.dart';
import 'package:bloc_project/bloc/forms/form_event.dart';
import 'package:bloc_project/bloc/forms/form_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
                        decoration: InputDecoration(labelText: "Enter Name"),
                        controller: nameController,
                      ),
                      TextField(
                        decoration: InputDecoration(labelText: "Enter Age"),
                        controller: ageController,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                      ),
                      TextField(
                        decoration:
                            InputDecoration(labelText: "Enter Phone Number"),
                        controller: phoneController,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                      ),
                    ],
                  ),
                  actions: [
                    OutlinedButton(
                      onPressed: () {
                        context.read<FormBloc>().add(SaveEvent(
                            name: nameController.text,
                            age: int.parse(ageController.text),
                            phone: int.parse(phoneController.text)));
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
                return Expanded(
                  child: ListView.builder(
                    itemCount: state.data.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(state.data[index]['name'] ?? ''),
                        subtitle: Column(
                          children: [
                            Text(state.data[index]['age'] ?? ''),
                            Text(state.data[index]['phone'] ?? ''),
                          ],
                        ),
                        trailing: IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                  context.read<FormBloc>().add(DeleteEvent(index: index));

                          },
                        ),
                      );
                    },
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
