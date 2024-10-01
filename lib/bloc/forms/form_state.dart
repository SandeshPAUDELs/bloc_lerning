import 'package:equatable/equatable.dart';

class CustomFormState extends Equatable {
  final String nameController;
  final String ageController;
  final String phoneController;

  const CustomFormState({
    required this.ageController,
    required this.nameController,
    required this.phoneController,
  });

  CustomFormState copyWith({String? nameController, String? ageController, String? phoneController}) {
    return CustomFormState(
      ageController: ageController ?? this.ageController,
      nameController: nameController ?? this.nameController,
      phoneController: phoneController ?? this.phoneController,
    );
  }

  @override
  List<Object> get props => [nameController, ageController, phoneController];
}
