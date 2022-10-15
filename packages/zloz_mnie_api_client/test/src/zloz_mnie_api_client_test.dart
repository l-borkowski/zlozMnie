// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

// ignore_for_file: prefer_const_constructors
import 'package:test/test.dart';
import 'package:zloz_mnie_api_client/zloz_mnie_api_client.dart';

void main() {
  group('ZlozMnieApiClient', () {
    test('can be instantiated', () {
      expect(ZlozMnieApiClient(), isNotNull);
    });
  });
}
