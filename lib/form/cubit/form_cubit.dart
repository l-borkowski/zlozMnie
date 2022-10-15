import 'package:bloc/bloc.dart';

part 'form_state.dart';

class FormCubit extends Cubit<FormState> {
  FormCubit() : super(FormState.initial());

  void changeClientType(ClientType type) {
    emit(state.copyWith(selectedClient: type));
  }

  void nameChanged(String? val) {
    var value = val;
    if (val == null) value = '';
    emit(state.copyWith(clientName: value));
  }

  void surnameChanged(String? val) {
    var value = val;
    if (val == null) value = '';
    emit(state.copyWith(clientSurname: value));
  }

  void businessChanged(String? val) {
    var value = val;
    if (val == null) value = '';
    emit(state.copyWith(clientBusiness: value));
  }

  void numberChanged(String? val) {
    var value = val;
    if (val == null) value = '';
    emit(state.copyWith(clientNumber: value));
  }

  void addressChanged(String? val) {
    var value = val;
    if (val == null) value = '';
    emit(state.copyWith(clientAddress: value));
  }

  void cityChanged(String? val) {
    var value = val;
    if (val == null) value = '';
    emit(state.copyWith(clientCity: value));
  }

  void zipCodeChanged(String? val) {
    var value = val;
    if (val == null) value = '';
    emit(state.copyWith(clientZipCode: value));
  }
}

enum ClientType { jdg, company, person }
