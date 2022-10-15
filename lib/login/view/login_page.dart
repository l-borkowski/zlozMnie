// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:time/time.dart';
import 'package:zloz_mnie/form/form.dart';
import 'package:zloz_mnie/l10n/l10n.dart';
import 'package:zloz_mnie/login/cubit/login_cubit.dart';
import 'package:zloz_mnie/login/login.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginCubit(),
      child: const LoginView(),
    );
  }
}

class LoginView extends HookWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const [
          _LoginHalf(),
          _WelcomeHalf(),
        ],
      ),
    );
  }
}

class _WelcomeHalf extends StatelessWidget {
  const _WelcomeHalf();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Flexible(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: const Color(0xFF4971FF),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const Spacer(),
              Text(
                l10n.fileMe,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 36,
                  fontWeight: FontWeight.w600,
                ),
              ),
              ConstrainedBox(
                constraints:
                    const BoxConstraints(minHeight: 100, minWidth: 200),
                child: Flexible(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      l10n.fileMeDesc,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),
              const Spacer(flex: 7),
            ],
          ),
        ),
      ),
    );
  }
}

class _LoginHalf extends StatelessWidget {
  const _LoginHalf();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Flexible(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: Column(
          children: [
            const Spacer(),
            Text(
              l10n.login,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 36,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Spacer(flex: 2),
            ConstrainedBox(
              constraints: const BoxConstraints(minHeight: 100, minWidth: 200),
              child: Flexible(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    _TextField(),
                    _TextField(),
                  ],
                ),
              ),
            ),
            const Spacer(flex: 2),
            Flexible(
              child: TextButton(
                onPressed: () => Navigator.of(context).push(FormPage.route()),
                child: const Text('zaloguj'),
              ),
            ),
            const Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}

class _TextField extends HookWidget {
  const _TextField();

  @override
  Widget build(BuildContext context) {
    final controller = useTextEditingController();
    final focusNode = useFocusNode();
    final hasFocus = useState(false);

    useMemoized(() {
      focusNode.addListener(() {
        hasFocus.value = focusNode.hasFocus;
      });
    });

    return GestureDetector(
      onTap: focusNode.requestFocus,
      child: AnimatedContainer(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.only(left: 10),
        margin: const EdgeInsets.symmetric(horizontal: 20),
        duration: 200.milliseconds,
        curve: Curves.fastLinearToSlowEaseIn,
        clipBehavior: Clip.antiAlias,
        width: 300,
        height: 40,
        decoration: BoxDecoration(
          border: Border.all(
            color: hasFocus.value
                ? const Color(0xFF4971FF)
                : const Color(0xFFD3D3D3),
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        child: Expanded(
          child: TextField(
            controller: controller,
            focusNode: focusNode,
            decoration: const InputDecoration(
              isDense: true,
              border: InputBorder.none,
              contentPadding: EdgeInsets.zero,
            ),
          ),
        ),
      ),
    );
  }
}
