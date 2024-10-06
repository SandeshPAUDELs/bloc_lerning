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
