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
    required this.clientName,
    required this.clientSurname,
    required this.clientBusiness,
    required this.clientNumber,
    required this.clientAddress,
    required this.clientCity,
    required this.clientZipCode,
    this.suedEntitiesList,
    required this.selectedSuedEntity,
  });

  factory FormState.initial() => const FormState(
        pageIndex: 0,
        reverse: false,
        subjectId: -1,
        claimId: 0,
        claimValue: 0,
        lawsuitSubjects: [],
        selectedClient: ClientType.person,
        clientNumber: '',
        clientAddress: '',
        clientCity: '',
        clientZipCode: '',
        clientBusiness: '',
        clientName: '',
        clientSurname: '',
        selectedSuedEntity: 0,
      );

  final int pageIndex;
  final bool reverse;
  final int subjectId;
  final int claimId;
  final double? claimValue;

  final List<LawsuitSubject> lawsuitSubjects;
  final ClientType selectedClient;
  final String? clientName;
  final String? clientSurname;
  final String? clientBusiness;
  final String clientNumber;
  final String clientAddress;
  final String clientCity;
  final String clientZipCode;
  final List<SuedEntity>? suedEntitiesList;
  final int selectedSuedEntity;

  FormState copyWith({
    int? pageIndex,
    bool? reverse,
    int? subjectId,
    int? claimId,
    double? claimValue,
    List<LawsuitSubject>? lawsuitSubjects,
    int? selectedForm,
    ClientType? selectedClient,
    String? clientName,
    String? clientSurname,
    String? clientBusiness,
    String? clientNumber,
    String? clientAddress,
    String? clientCity,
    String? clientZipCode,
    List<SuedEntity>? suedEntitiesList,
    int? selectedSuedEntity,
  }) {
    return FormState(
      pageIndex: pageIndex ?? this.pageIndex,
      reverse: reverse ?? this.reverse,
      subjectId: subjectId ?? this.subjectId,
      claimId: claimId ?? this.claimId,
      claimValue: claimValue ?? this.claimValue,
      lawsuitSubjects: lawsuitSubjects ?? this.lawsuitSubjects,
      selectedClient: selectedClient ?? this.selectedClient,
      clientName: clientName ?? this.clientName,
      clientSurname: clientSurname ?? this.clientSurname,
      clientBusiness: clientBusiness ?? this.clientBusiness,
      clientNumber: clientNumber ?? this.clientNumber,
      clientAddress: clientAddress ?? this.clientAddress,
      clientCity: clientCity ?? this.clientCity,
      clientZipCode: clientZipCode ?? this.clientZipCode,
      suedEntitiesList: suedEntitiesList ?? this.suedEntitiesList,
      selectedSuedEntity: selectedSuedEntity ?? this.selectedSuedEntity,
    );
  }
}
