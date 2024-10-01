import 'package:equatable/equatable.dart';

abstract class FormEvent extends Equatable {
  const FormEvent();

  @override
  List<Object> get props => [];
}

class SaveEvent extends FormEvent {
  final String name;
  final int age;
  final int phone;

  const SaveEvent({required this.name, required this.age, required this.phone});

  @override
  List<Object> get props => [name, age, phone];
}
class DeleteEvent extends FormEvent {
  final int index;

  const DeleteEvent({required this.index});

}
