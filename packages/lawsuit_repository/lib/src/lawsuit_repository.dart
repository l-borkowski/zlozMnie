// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:lawsuit_repository/models/models.dart';
import 'package:zloz_mnie_api_client/zloz_mnie_api_client.dart';

/// {@template lawsuit_repository}
/// A Very Good Project created by Very Good CLI.
/// {@endtemplate}
class LawsuitRepository {
  /// {@macro lawsuit_repository}
  const LawsuitRepository(
    this._apiClient,
  );

  final ZlozMnieApiClient _apiClient;

  /// Returns lawsuit subjects
  Future<List<LawsuitSubject>> getLawsuitSubjects() async {
    final subjectsJson = await _apiClient.getLawsuitSubjects();

    final subjects = subjectsJson
        .map((json) => LawsuitSubject.fromJson(json as JsonMap))
        .toList();

    return subjects;
  }

  ///
  Future<List<Entity>> getSuedEntities() async {
    final suedList = <Entity>[
      const Entity(
        id: 1,
        name: 'Jakub',
        surname: 'Stefaniak',
        number: '012731030312',
        address: 'ul. Jana Kilińskiego 9/123',
        clientType: ClientType.person,
        city: 'Gdańsk',
        zipCode: '80-452 ',
      ),
      const Entity(
        id: 2,
        business: 'Hurtownia Spożywcza PERKOS',
        number: '123123123',
        address: 'ul. Jana Kilińskiego 9/123',
        city: 'Gdańsk',
        zipCode: '80-452 ',
        clientType: ClientType.company,
      ),
      const Entity(
        id: 3,
        business: 'Usługi Informatyczno-Raperskie Dżejk Stefański',
        number: '012731030312',
        address: 'ul. Jana Kilińskiego 9/123',
        city: 'Gdańsk',
        zipCode: '80-452 ',
        clientType: ClientType.jdg,
      ),
    ];

    return suedList;
  }
}
