import 'package:bloc/bloc.dart';
import 'package:bloc_project/bloc/users/users_event.dart';
import 'package:bloc_project/bloc/users/users_state.dart';
import 'package:bloc_project/models/users_models.dart';
import 'package:bloc_project/respository/users_repo.dart';

class UsersBloc extends Bloc<AddUsersEvent, AddUserState> {
  UsersRepo usersRepo = UsersRepo();
  List <AddUsersModels> users = [];

  // UsersBloc(super.initialState);
  UsersBloc() : super (const AddUserState()) {
    on<AddUsers>(_addUser);
  }

  
  // Future<void> _addUser(AddUsers event, Emitter<AddUserState> emit) async {
  //   await UsersRepo.addUsers(event.user).then((value){
  //     emit(state.copyWith(status: AddUserStatus.success, users: value, message: 'success'));
  //   });
  // }
  Future<void> _addUser(AddUsers event, Emitter<AddUserState> emit) async {
  try {
    final users = await UsersRepo.addUsers(event.user);
    emit(state.copyWith(
      status: AddUserStatus.success,
      users: users,
      message: 'User added successfully',
    ));
  } catch (e) {
    emit(state.copyWith(
      status: AddUserStatus.failure,
      message: 'Failed to add user',
    ));
  }
}
}

// for login

class AuthenticateduserBloc extends Bloc<AuthenticatedUserEvent, AuthenticatedUserState> {
  UsersRepo usersRepo = UsersRepo();
  AuthenticatedUser? user;

  AuthenticateduserBloc() : super(const AuthenticatedUserState()) {
    on<LoginUsers>(_loginUser);
  }
  Future<void> _loginUser(LoginUsers event, Emitter<AuthenticatedUserState> emit) async {
  try {
    final user = await UsersRepo.login(event.username, event.password);
    if (user != null) {
      emit(state.copyWith(
        status: AddUserStatus.success,
        user: user,
        message: 'Login successful',
        
      ));
    } else {
      emit(state.copyWith(
        status: AddUserStatus.failure,
        message: 'Login failed',
      ));
    }
  } catch (e) {
    emit(state.copyWith(
      status: AddUserStatus.failure,
      message: 'Failed to login',
    ));
  }
}

}