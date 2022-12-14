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

  void mediationAdrSwitched({required bool mediationAdr}) => emit(
        state.copyWith(
          mediationAdr: mediationAdr,
        ),
      );

  void iMadeAnAttemptSwitched({required bool iMadeAnAttempt}) => emit(
        state.copyWith(
          iMadeAnAttempt: iMadeAnAttempt,
        ),
      );

  void attemptResultChanged({required String attemptResult}) => emit(
        state.copyWith(
          attemptResult: attemptResult,
        ),
      );

  void generateDocument() {
    var number = '';

    if (state.client.clientType == ClientType.company) {
      number = 'KRS: ${state.client.number}\n';
    }
    if (state.client.clientType == ClientType.jdg) {
      number = 'NIP: ${state.client.number}\n';
    }
    if (state.client.clientType == ClientType.person) {
      number = 'PESEL: ${state.client.number}\n';
    }

    final contents = [
      /// Pow??d
      {
        'insert': state.client.clientType == ClientType.person
            ? '${state.client.name!} ${state.client.surname!}\n'
            : '${state.client.business!}\n',
        'attributes': {'bold': true}
      },
      {
        'insert':
            '${state.client.address}, ${state.client.zipCode} ${state.client.city}\n',
      },
      {'insert': '$number'},
      {
        'insert': '-Pow??d-\n\n',
        'attributes': {'bold': true}
      },

      /// Pe??nomocnik
      {
        'insert':
            'reprezentowany przez radc?? prawnego Zbigniewa Nowoczesnego\n',
        'attributes': {'bold': true}
      },
      {
        'insert':
            'Kancelaria Radcy Prawnego Zbigniew Nowoczesny\nul. Zb??szy??ska 29, 60-359 Pozna??\nz.nowoczesny@kancelaria.pl\n\n',
      },

      /// Pozwany
      {
        'insert': state.client.clientType == ClientType.person
            ? '${state.suedEntity.name!} ${state.suedEntity.surname!}\n'
            : state.suedEntity.business!,
        'attributes': {'bold': true}
      },
      {
        'insert':
            '${state.suedEntity.address}, ${state.suedEntity.zipCode} ${state.suedEntity.city}\n',
      },
      {'insert': number},
      {
        'insert': '-Pozwany-\n',
        'attributes': {'bold': true}
      },
      {'insert': '\n'},

      /// S??d

      {
        'insert': 'S??d Rejonowy w Ja??le\n',
        'attributes': {
          'bold': true,
        },
      },

      {
        'insert': 'I Wydzia?? Cywilny\n',
        'attributes': {
          'bold': true,
        },
      },

      {
        'insert': 'ul. Armii Krajowej 3\n38-200 Jas??o\n\n',
      },

      /// WPS + OP??ATA
      {
        'insert':
            'WPS: ${state.claimValue} z??\nOp??ata od pozwu: 2.500,00 z??\n\n',
        'attributes': {
          'bold': true,
          'underline': true,
        },
      },

      {
        'insert': 'POZEW\n\n',
        'attributes': {
          'bold': true,
        },
      },

      if (state.reimbursement)
        {
          'insert':
              'zas??dzenie od Pozwanej na rzecz Pow??dki zwrotu koszt??w procesu w ca??o??ci, w tym koszt??w zast??pstwa procesowego oraz op??aty skarbowej od pe??nomocnictwa w kwocie 17,00 z?? wed??ug norm przepisanych wraz z odsetkami ustawowymi za op????nienie od dnia uprawomocnienia si?? orzeczenia,\n\n',
        },

      if (state.mediationAdr)
        {
          'insert':
              'Maj??c na uwadze przepis art 187 ??1 pkt 3 kpc, Pow??dka wskazuje, i?? podejmowa??a pr??by pozas??dowego rozwi??zania sporu\n\n',
        },

      if (state.iMadeAnAttempt)
        {
          'insert':
              'Pow??d ui??ci?? op??at?? od pozwu stosownie do art. 13 ust. 2 ustawy z dnia 28 lipca 2005 r. o kosztach s??dowych w sprawach cywilnych tj. z dnia 7 kwietnia 2022 r. (Dz.U. z 2022 r. poz. 1125)  w kwocie 2.500,00 z??otych.\n\n',
        },
    ];

    emit(state.copyWith(generateDocumentContents: contents));
  }
}
