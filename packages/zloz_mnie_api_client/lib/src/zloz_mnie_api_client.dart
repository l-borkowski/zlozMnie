// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'dart:io';

import 'package:dio/dio.dart';

/// Shorthand of Map<String, dynamic>
typedef JsonMap = Map<String, dynamic>;

/// RequestException
class RequestException implements Exception {
  /// RequestException
  const RequestException(this.statusCode);
  final int statusCode;
}

/// RequestException
class JsonDeserializationException implements Exception {}

/// MyHttpOverrides
class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          ((X509Certificate cert, String host, int port) {
        final isValidHost = ['51.83.172.127'].contains(host);
        return isValidHost;
      });
  }
}

/// {@template zloz_mnie_api_client}
/// A Very Good Project created by Very Good CLI.
/// {@endtemplate}
class ZlozMnieApiClient {
  /// {@macro zloz_mnie_api_client}
  ZlozMnieApiClient() {
    HttpOverrides.global = MyHttpOverrides();
  }

  final _dio = Dio(
    BaseOptions(
      baseUrl: 'http://51.83.172.127',
    ),
  );

  /// Logs user in
  Future<JsonMap> login({
    required String email,
    required String passwordHash,
  }) async {
    try {
      final result = await _dio.post<JsonMap>(
        '/auth/login',
        data: {
          'email': email,
          'passwordHash': passwordHash,
        },
      );

      final accessToken = result.data!['accessToken'] as String;

      _dio.options.headers.addAll({
        'Authorization': 'Bearer $accessToken',
      });

      return result.data!;
    } on DioError catch (e) {
      throw RequestException(e.response!.statusCode!);
    } catch (_) {
      throw JsonDeserializationException();
    }
  }

  /// Fetches lawsuit subjects
  Future<List<dynamic>> getLawsuitSubjects() async {
    try {
      final result = await _dio.get<List<dynamic>>('/lawsuit/subjects');

      return result.data!;
    } on DioError catch (e) {
      throw RequestException(e.response!.statusCode!);
    } catch (e) {
      throw JsonDeserializationException();
    }
  }

  /// Creates new lawsuit
  Future<JsonMap> createLawsuit() async {
    try {
      final result = await _dio.post<JsonMap>('/lawsuit');
      return result.data!;
    } on DioError catch (e) {
      throw RequestException(e.response!.statusCode!);
    } catch (_) {
      throw JsonDeserializationException();
    }
  }

  /// Updates existing lawsuit with id
  Future<JsonMap> updateLawsuit({
    required int lawsuitId,
    int? subjectId,
    int? claimType,
    double? claimValue,
    int? suingEntityType,
    String? suingFirstName,
    String? suingLastName,
    String? suingOrganizationName,
    String? suingOrganizationNumber,
    String? suingAddress,
    String? suingCity,
    String? suingPostCode,
  }) async {
    try {
      final result = await _dio.post<JsonMap>(
        '/lawsuit/$lawsuitId',
        data: {
          'subjectId': subjectId,
          'claimType': claimType,
          'claimValue': claimValue,
          'suingEntityType': suingEntityType,
          'suingFirstName': suingFirstName,
          'suingLastName': suingLastName,
          'suingOrganizationName': suingOrganizationName,
          'suingOrganizationNumber': suingOrganizationNumber,
          'suingAddress': suingAddress,
          'suingCity': suingCity,
          'suingPostCode': suingPostCode,
        },
      );
      return result.data!;
    } on DioError catch (e) {
      print(e.message);
      throw RequestException(e.response!.statusCode!);
    } catch (_) {
      throw JsonDeserializationException();
    }
  }

  /*  Future<List<Rocket>> () async {
    final uri = Uri.https(authority, '/v4/rockets');
    final responseBody = await _get(uri);

    try {
      return responseBody
          .map((dynamic item) => Rocket.fromJson(item as Map<String, dynamic>))
          .toList();
    } catch (_) {
      throw JsonDeserializationException();
    }
  } */
}
