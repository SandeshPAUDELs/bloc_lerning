import 'package:bloc_project/models/users_models.dart';
import 'package:equatable/equatable.dart';
enum AddUserStatus { initial, success, failure }

class AddUserState extends Equatable{
  const AddUserState({
    this.status = AddUserStatus.initial,
    this.message = '',
    this.users = const <AddUsersModels>[],
  });
  final AddUserStatus status;
  final String message;
  final List<AddUsersModels> users;

  AddUserState copyWith({
    AddUserStatus? status,
    String? message,
    List<AddUsersModels>? users,
  }) {
    return AddUserState(
      status: status ?? this.status,
      message: message ?? this.message,
      users: users ?? this.users,
    );
  }

  @override
  // TODO: implement props
  // List<Object?> get props => throw UnimplementedError();
  List<Object?> get props => [status, message, users];

}

class AuthenticatedUserState extends Equatable {
  const AuthenticatedUserState({
    this.status = AddUserStatus.initial,
    this.message = '',
    this.user,
  });

  final AddUserStatus status;
  final String message;
  final AuthenticatedUser? user;

  AuthenticatedUserState copyWith({
    AddUserStatus? status,
    String? message,
    AuthenticatedUser? user,
  }) {
    return AuthenticatedUserState(
      status: status ?? this.status,
      message: message ?? this.message,
      user: user ?? this.user,
    );
  }

  @override
  List<Object?> get props => [status, message, user];
}