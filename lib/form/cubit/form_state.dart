// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'form_cubit.dart';

class FormState {
  const FormState({
    required this.selectedForm,
    required this.selectedClient,
    this.clientName,
    this.clientSurname,
    this.clientBusiness,
    required this.clientNumber,
    required this.clientAddress,
    required this.clientCity,
    required this.clientZipCode,
  });

  factory FormState.initial() => const FormState(
        selectedForm: 0,
        selectedClient: ClientType.person,
        clientNumber: '',
        clientAddress: '',
        clientCity: '',
        clientZipCode: '',
      );

  final int selectedForm;
  final ClientType selectedClient;
  final String? clientName;
  final String? clientSurname;
  final String? clientBusiness;
  final String clientNumber;
  final String clientAddress;
  final String clientCity;
  final String clientZipCode;

  FormState copyWith({
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
      selectedForm: selectedForm ?? this.selectedForm,
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
