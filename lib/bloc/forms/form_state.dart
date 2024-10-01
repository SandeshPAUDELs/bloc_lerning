import 'package:equatable/equatable.dart';

class CustomFormState extends Equatable {
  final String nameController;
  final String ageController;
  final String phoneController;
  final List<Map<String, String>> data;

  const CustomFormState({
    required this.ageController,
    required this.nameController,
    required this.phoneController,
    this.data = const [],
  });

  CustomFormState copyWith({String? nameController, String? ageController, String? phoneController, List<Map<String, String>>? data}) {
    return CustomFormState(
      ageController: ageController ?? this.ageController,
      nameController: nameController ?? this.nameController,
      phoneController: phoneController ?? this.phoneController,
      data: data ?? this.data,
    );
  }

  @override
  List<Object> get props => [nameController, ageController, phoneController, data];
}
