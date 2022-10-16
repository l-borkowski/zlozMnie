// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:lawsuit_repository/models/client_type.dart';

/// {@template entity}
/// Entity object
/// {@endtemplate}
class Entity {
  /// {@macro entity}
  const Entity({
    required this.id,
    this.name,
    this.surname,
    this.business,
    required this.number,
    required this.address,
    required this.city,
    required this.zipCode,
    required this.clientType,
  });

  factory Entity.empty() => const Entity(
        number: '',
        address: '',
        city: '',
        zipCode: '',
        clientType: ClientType.person,
        name: '',
        surname: '',
        business: '',
        id: 9,
      );

  ///
  final int id;

  ///
  final String? name;

  ///
  final String? surname;

  ///
  final String? business;

  ///
  final String number;

  ///
  final String address;

  ///
  final String city;

  ///
  final String zipCode;

  ///
  final ClientType clientType;

  Entity copyWith({
    int? id,
    String? name,
    String? surname,
    String? business,
    String? number,
    String? address,
    String? city,
    String? zipCode,
    ClientType? clientType,
  }) {
    return Entity(
      name: name ?? this.name,
      surname: surname ?? this.surname,
      business: business ?? this.business,
      number: number ?? this.number,
      address: address ?? this.address,
      city: city ?? this.city,
      zipCode: zipCode ?? this.zipCode,
      clientType: clientType ?? this.clientType,
      id: id ?? this.id,
    );
  }
}
