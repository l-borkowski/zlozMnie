// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lawsuit_repository/lawsuit_repository.dart';
import 'package:zloz_mnie/l10n/l10n.dart';
import 'package:zloz_mnie/login/login.dart';
import 'package:zloz_mnie_api_client/zloz_mnie_api_client.dart';

class App extends StatelessWidget {
  App({super.key}) {
    apiClient = ZlozMnieApiClient();
    lawsuitRepostiory = LawsuitRepository(apiClient);
  }

  late final ZlozMnieApiClient apiClient;
  late final LawsuitRepository lawsuitRepostiory;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (_) => lawsuitRepostiory),
      ],
      child: MaterialApp(
        theme: _buildTheme(),
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
        ],
        supportedLocales: AppLocalizations.supportedLocales,
        home: const LoginPage(),
      ),
    );
  }

  ThemeData _buildTheme() {
    final baseTheme = ThemeData(brightness: Brightness.light);

    return baseTheme.copyWith(
      textTheme: GoogleFonts.poppinsTextTheme(baseTheme.textTheme),
      scaffoldBackgroundColor: Colors.white,
    );
  }
}
