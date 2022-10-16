import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:lawsuit_repository/lawsuit_repository.dart';
import 'package:lawsuit_repository/models/models.dart';

part 'form_state.dart';

class FormCubit extends Cubit<FormState> {
  FormCubit(
    this._lawsuitRepository,
  ) : super(FormState.initial());

  final LawsuitRepository _lawsuitRepository;

  Future<void> init() async {
    final suedEntities = await _lawsuitRepository.getSuedEntities();

    emit(state.copyWith(suedEntitiesList: suedEntities));
  }

  void changeSuedEntity(int id) {
    emit(state.copyWith(selectedSuedEntity: id));
  }

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
  void changeView(int id) => emit(
        state.copyWith(
          pageIndex: id,
          reverse: id < state.pageIndex,
        ),
      );

  void selectClaimType(int id) => emit(
        state.copyWith(
          claimId: id,
          reverse: true,
        ),
      );

  void claimValueChanged(String text) {
    final value = double.tryParse(text);

    
    emit(state.copyWith(claimValue: value ?? 0));
  }

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
