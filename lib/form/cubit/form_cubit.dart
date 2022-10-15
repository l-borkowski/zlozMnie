import 'package:bloc/bloc.dart';
import 'package:lawsuit_repository/lawsuit_repository.dart';
import 'package:lawsuit_repository/models/lawsuit_subject.dart';

part 'form_state.dart';

class FormCubit extends Cubit<FormState> {
  FormCubit(
    this._lawsuitRepository,
  ) : super(FormState.initial());

  final LawsuitRepository _lawsuitRepository;

  void nextPage() => emit(
        state.copyWith(
          pageIndex: state.pageIndex + 1,
          reverse: false,
        ),
      );

  void previousPage() => emit(
        state.copyWith(
          pageIndex: state.pageIndex - 1,
          reverse: true,
        ),
      );

  void selectSubject(int id) => emit(
        state.copyWith(
          subjectId: id,
          reverse: true,
        ),
      );

  Future<void> loadLawsuitSubjects() async {
    if (state.lawsuitSubjects.isNotEmpty) return;

    final lawsuitSubjects = await _lawsuitRepository.getLawsuitSubjects();

    emit(
      state.copyWith(
        lawsuitSubjects: lawsuitSubjects,
      ),
    );
  }

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
