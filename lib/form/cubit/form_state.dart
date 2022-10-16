// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'form_cubit.dart';

class FormState {
  const FormState({
    required this.pageIndex,
    required this.reverse,
    required this.subjectId,
    required this.claimId,
    required this.claimValue,
    required this.lawsuitSubjects,
    required this.selectedClient,
    required this.client,
    required this.suedEntity,
    this.suedEntitiesList,
    required this.selectedSuedEntity,
    required this.showSuedModal,
  });

  factory FormState.initial() => FormState(
        pageIndex: 0,
        reverse: false,
        subjectId: -1,
        claimId: 0,
        claimValue: 0,
        lawsuitSubjects: [],
        selectedClient: ClientType.person,
        client: Entity.empty(),
        suedEntity: Entity.empty(),
        selectedSuedEntity: 0,
        showSuedModal: false,
      );

  final int pageIndex;
  final bool reverse;
  final int subjectId;
  final int claimId;
  final double? claimValue;

  final List<LawsuitSubject> lawsuitSubjects;
  final ClientType selectedClient;
  final Entity client;
  final Entity suedEntity;
  final List<Entity>? suedEntitiesList;
  final int selectedSuedEntity;
  final bool showSuedModal;

  FormState copyWith({
    int? pageIndex,
    bool? reverse,
    int? subjectId,
    int? claimId,
    double? claimValue,
    List<LawsuitSubject>? lawsuitSubjects,
    int? selectedForm,
    ClientType? selectedClient,
    Entity? client,
    Entity? suedEntity,
    List<Entity>? suedEntitiesList,
    int? selectedSuedEntity,
    bool? showSuedModal,
  }) {
    return FormState(
      pageIndex: pageIndex ?? this.pageIndex,
      reverse: reverse ?? this.reverse,
      subjectId: subjectId ?? this.subjectId,
      claimId: claimId ?? this.claimId,
      claimValue: claimValue ?? this.claimValue,
      lawsuitSubjects: lawsuitSubjects ?? this.lawsuitSubjects,
      selectedClient: selectedClient ?? this.selectedClient,
      client: client ?? this.client,
      suedEntitiesList: suedEntitiesList ?? this.suedEntitiesList,
      selectedSuedEntity: selectedSuedEntity ?? this.selectedSuedEntity,
      showSuedModal: showSuedModal ?? this.showSuedModal,
      suedEntity: suedEntity ?? this.suedEntity,
    );
  }
}
