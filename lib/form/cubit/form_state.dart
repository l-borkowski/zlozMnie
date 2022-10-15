// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'form_cubit.dart';

class FormState {
  const FormState({
    required this.pageIndex,
    required this.reverse,
    required this.subjectId,
    required this.lawsuitSubjects,
    required this.selectedClient,
    required this.clientName,
    required this.clientSurname,
    required this.clientBusiness,
    required this.clientNumber,
    required this.clientAddress,
    required this.clientCity,
    required this.clientZipCode,
  });

  factory FormState.initial() => const FormState(
        pageIndex: 0,
        reverse: false,
        subjectId: -1,
        lawsuitSubjects: [],
        selectedClient: ClientType.person,
        clientNumber: '',
        clientAddress: '',
        clientCity: '',
        clientZipCode: '',
        clientBusiness: '',
        clientName: '',
        clientSurname: '',
      );

  final int pageIndex;
  final bool reverse;
  final int subjectId;
  final List<LawsuitSubject> lawsuitSubjects;
  final ClientType selectedClient;
  final String? clientName;
  final String? clientSurname;
  final String? clientBusiness;
  final String clientNumber;
  final String clientAddress;
  final String clientCity;
  final String clientZipCode;

  FormState copyWith({
    int? pageIndex,
    bool? reverse,
    int? subjectId,
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
  }) {
    return FormState(
      pageIndex: pageIndex ?? this.pageIndex,
      reverse: reverse ?? this.reverse,
      subjectId: subjectId ?? this.subjectId,
      lawsuitSubjects: lawsuitSubjects ?? this.lawsuitSubjects,
      selectedClient: selectedClient ?? this.selectedClient,
      clientName: clientName ?? this.clientName,
      clientSurname: clientSurname ?? this.clientSurname,
      clientBusiness: clientBusiness ?? this.clientBusiness,
      clientNumber: clientNumber ?? this.clientNumber,
      clientAddress: clientAddress ?? this.clientAddress,
      clientCity: clientCity ?? this.clientCity,
      clientZipCode: clientZipCode ?? this.clientZipCode,
    );
  }
}
