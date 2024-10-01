import 'package:bloc_project/bloc/forms/form_event.dart';
import 'package:bloc_project/bloc/forms/form_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FormBloc extends Bloc<FormEvent, CustomFormState> {
  FormBloc() : super(const CustomFormState(ageController: '', nameController: '', phoneController: '')) {
    on<SaveEvent>(_addData);
    on<DeleteEvent>(_deleteData);
  }

  void _addData(SaveEvent event, Emitter<CustomFormState> emit) {
    emit(state.copyWith(
      nameController: event.name,
      ageController: event.age.toString(),
      phoneController: event.phone.toString(),
      data : List.from(state.data)..add({
        'name': event.name,
        'age': event.age.toString(),
        'phone': event.phone.toString(),
      }),
     
    ));
  }
  void _deleteData(DeleteEvent event, Emitter<CustomFormState> emit) {
    emit(state.copyWith(
      data: List.from(state.data)..removeAt(event.index),
    ));
  }

}
