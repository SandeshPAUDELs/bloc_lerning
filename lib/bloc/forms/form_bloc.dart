import 'package:bloc_project/bloc/forms/form_event.dart';
import 'package:bloc_project/bloc/forms/form_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FormBloc extends Bloc<FormEvent, CustomFormState> {
  FormBloc() : super(const CustomFormState(ageController: '', nameController: '', phoneController: '')) {
    on<SaveEvent>(_addData);
  }

  void _addData(SaveEvent event, Emitter<CustomFormState> emit) {
    emit(state.copyWith(
      nameController: event.name,
      ageController: event.age,
      phoneController: event.phone,
    ));
  }
}
