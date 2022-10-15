// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:zloz_mnie/form/form.dart';

class FormPage extends StatelessWidget {
  const FormPage({super.key});

  static Route<FormPage> route() {
    return MaterialPageRoute(
      builder: (context) => const FormPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => FormCubit(),
      child: const FormView(),
    );
  }
}

class FormView extends HookWidget {
  const FormView({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const [
          _ListPart(),
          _FormPart(),
        ],
      ),
    );
  }
}

class _ListPart extends StatelessWidget {
  const _ListPart();

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 3,
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: const Color(0xFF4971FF),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Column(
              children: const [
                Spacer(),
                FormList(),
                Spacer(flex: 2),
              ],
            ),
            Column(
              children: const [
                Spacer(),
                FormListDots(),
                Spacer(flex: 2),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _FormPart extends StatelessWidget {
  const _FormPart();

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 7,
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: LayoutBuilder(builder: builder),
      ),
    );
  }
}