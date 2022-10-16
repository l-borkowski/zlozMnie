// ignore_for_file: avoid_setters_without_getters

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:lawsuit_repository/lawsuit_repository.dart';
import 'package:zloz_mnie/models/proof.dart';
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
    emit(
      state.copyWith(
        selectedSuedEntity: id,
        suedEntity:
            state.suedEntitiesList?.firstWhere((element) => element.id == id),
      ),
    );
  }

  set proxyFile(Uint8List val) => state.copyWith(proxyFile: val);
  set feeFile(Uint8List val) => state.copyWith(feeFile: val);

  // ignore: avoid_positional_boolean_parameters
  void changeReimbursement(bool? val) {
    emit(state.copyWith(reimbursement: val));
  }

  void showSuedModal() {
    emit(state.copyWith(showSuedModal: true));
  }

  void hideSuedModal() {
    emit(state.copyWith(showSuedModal: false));
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

  void changeClientType(ClientType type, {required bool isClient}) {
    Entity updatedEntity;
    if (isClient) {
      updatedEntity = state.client.copyWith(clientType: type);
      emit(state.copyWith(selectedClient: type, client: updatedEntity));
    } else {
      updatedEntity = state.suedEntity.copyWith(clientType: type);
      emit(state.copyWith(selectedClient: type, suedEntity: updatedEntity));
    }
  }

  void nameChanged(String? val, {required bool isClient}) {
    var value = val;
    if (val == null) value = '';
    if (isClient) {
      final updatedClient = state.client.copyWith(name: value);
      emit(state.copyWith(client: updatedClient));
    } else {
      final updatedClient = state.suedEntity.copyWith(name: value);
      emit(state.copyWith(suedEntity: updatedClient));
    }
  }

  void surnameChanged(String? val, {required bool isClient}) {
    var value = val;
    if (val == null) value = '';
    if (isClient) {
      final updatedClient = state.client.copyWith(surname: value);
      emit(state.copyWith(client: updatedClient));
    } else {
      final updatedClient = state.suedEntity.copyWith(surname: value);
      emit(state.copyWith(suedEntity: updatedClient));
    }
  }

  void businessChanged(String? val, {required bool isClient}) {
    var value = val;
    if (val == null) value = '';
    if (isClient) {
      final updatedClient = state.client.copyWith(business: value);
      emit(state.copyWith(client: updatedClient));
    } else {
      final updatedClient = state.suedEntity.copyWith(business: value);
      emit(state.copyWith(suedEntity: updatedClient));
    }
  }

  void numberChanged(String? val, {required bool isClient}) {
    var value = val;
    if (val == null) value = '';
    if (isClient) {
      final updatedClient = state.client.copyWith(number: value);
      emit(state.copyWith(client: updatedClient));
    } else {
      final updatedClient = state.suedEntity.copyWith(number: value);
      emit(state.copyWith(suedEntity: updatedClient));
    }
  }

  void addressChanged(String? val, {required bool isClient}) {
    var value = val;
    if (val == null) value = '';
    if (isClient) {
      final updatedClient = state.client.copyWith(address: value);
      emit(state.copyWith(client: updatedClient));
    } else {
      final updatedClient = state.suedEntity.copyWith(address: value);
      emit(state.copyWith(suedEntity: updatedClient));
    }
  }

  void cityChanged(String? val, {required bool isClient}) {
    var value = val;
    if (val == null) value = '';
    if (isClient) {
      final updatedClient = state.client.copyWith(city: value);
      emit(state.copyWith(client: updatedClient));
    } else {
      final updatedClient = state.suedEntity.copyWith(city: value);
      emit(state.copyWith(suedEntity: updatedClient));
    }
  }

  void zipCodeChanged(String? val, {required bool isClient}) {
    var value = val;
    if (val == null) value = '';
    if (isClient) {
      final updatedClient = state.client.copyWith(zipCode: value);
      emit(state.copyWith(client: updatedClient));
    } else {
      final updatedClient = state.suedEntity.copyWith(zipCode: value);
      emit(state.copyWith(suedEntity: updatedClient));
    }
  }

  void proofAdded(Proof proof) => emit(
        state.copyWith(
          proofs: List.from(state.proofs)..add(proof),
        ),
      );
}
