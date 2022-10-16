import 'package:lawsuit_repository/models/models.dart';

/// {@template lawsuit_subject}
/// SuedEntity object
/// {@endtemplate}
class SuedEntity {
  /// {@macro lawsuit_subject}
  const SuedEntity({
    required this.id,
    required this.name,
    required this.number,
    required this.address,
    required this.addressPt2,
    required this.clientType,
  });

  ///
  final int id;

  ///
  final String name;

  ///
  final String number;

  ///
  final String address;

  ///
  final String addressPt2;

  ///
  final ClientType clientType;
}
