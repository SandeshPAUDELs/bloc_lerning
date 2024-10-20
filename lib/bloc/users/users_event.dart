import 'package:bloc_project/models/users_models.dart';
import 'package:equatable/equatable.dart';

abstract class AddUsersEvent extends Equatable{
  const AddUsersEvent();
  @override
  List<Object> get props => [];
}

class AddUsers extends AddUsersEvent{

  final AddUsersModels user;


  const AddUsers({required this.user});

  @override
  List<Object> get props => [user];
}

// for login
abstract class AuthenticatedUserEvent extends Equatable{
  const AuthenticatedUserEvent();
  @override
  List<Object> get props => [];

}

class LoginUsers extends AuthenticatedUserEvent {
  final String username;
  final String password;

  const LoginUsers({required this.username, required this.password});

  @override
  List<Object> get props => [username, password];
}
