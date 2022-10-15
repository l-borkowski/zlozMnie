part of 'form_cubit.dart';

class FormState {
  const FormState({
    required this.selectedForm,
  });

  factory FormState.initial() => const FormState(selectedForm: 0);

  final int selectedForm;
}
