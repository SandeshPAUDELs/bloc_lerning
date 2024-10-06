import 'package:bloc_project/bloc/users/users_bloc.dart';
import 'package:bloc_project/bloc/users/users_event.dart';
import 'package:bloc_project/models/users_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddUsersView extends StatelessWidget {
  const AddUsersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final usernameController = TextEditingController();
    final passwordController = TextEditingController();
    final phoneController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add User'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                hintText: 'Email',
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: usernameController,
              decoration: const InputDecoration(
                hintText: 'Username',
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(
                hintText: 'Password',
              ),
              obscureText: true,
            ),
            const SizedBox(height: 8),
            TextField(
              controller: phoneController,
              decoration: const InputDecoration(
                hintText: 'Phone',
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                final email = emailController.text;
                final username = usernameController.text;
                final password = passwordController.text;
                final phone = phoneController.text;

                if (email.isNotEmpty &&
                    username.isNotEmpty &&
                    password.isNotEmpty &&
                    phone.isNotEmpty) {
                  final user = AddUsersModels(
                    email: email,
                    username: username,
                    password: password,
                    phone: phone,
                  );

                  context.read<UsersBloc>().add(AddUsers(user: user));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Please fill in all fields')),
                  );
                }
              },
              child: const Text('Add User'),
            ),
            const SizedBox(height: 16),
            
          ],
        ),
      ),
    );
  }
}
