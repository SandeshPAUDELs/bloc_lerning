import 'package:bloc_project/bloc/users/users_bloc.dart';
import 'package:bloc_project/bloc/users/users_event.dart';
import 'package:bloc_project/bloc/users/users_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreenView extends StatefulWidget {
  const LoginScreenView({super.key});

  @override
  State<LoginScreenView> createState() => _LoginScreenViewState();
}

class _LoginScreenViewState extends State<LoginScreenView> {
  @override
  void initState(){
    super.initState();
    getToken();
  }
  var token = "Nothing";
  Widget build(BuildContext context) {
    final usernameController = TextEditingController();
    final passwordController = TextEditingController();

    return Scaffold(
      
      body: BlocListener<AuthenticateduserBloc, AuthenticatedUserState>(
        listener: (context, state) {
          if (state.status == AddUserStatus.success) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          } else if (state.status == AddUserStatus.failure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text('stored token is : ${token}'),
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
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  final username = usernameController.text;
                  final password = passwordController.text;
                  if (username.isNotEmpty && password.isNotEmpty) {
                    context.read<AuthenticateduserBloc>().add(
                      LoginUsers(username: username, password: password),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Please enter both username and password')),
                    );
                  }
                },
                child: const Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
  
  Future<void> getToken() async {
    var prefix = await SharedPreferences.getInstance();
    var storedToken = prefix.getString("auth_token");
    token = storedToken ?? "Nothing";
    setState(() {
      
    });

  }
}
