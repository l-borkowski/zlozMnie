import 'package:bloc/bloc.dart';

part 'form_state.dart';

class FormCubit extends Cubit<FormState> {
  FormCubit() : super(FormState.initial());
}
