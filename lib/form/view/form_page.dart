/* // Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

/// The demo page for [SharedAxisPageTransitionsBuilder].
class FormPage extends StatefulWidget {
  /// Creates the demo page for [SharedAxisPageTransitionsBuilder].
  const FormPage({Key? key}) : super(key: key);

  static Route<FormPage> route() {
    return MaterialPageRoute(
      builder: (context) => const FormPage(),
    );
  }

  @override
  State<FormPage> createState() {
    return _FormPageState();
  }
}

class _FormPageState extends State<FormPage> {
  SharedAxisTransitionType? _transitionType =
      SharedAxisTransitionType.horizontal;
  bool _isLoggedIn = false;

  void _updateTransitionType(SharedAxisTransitionType? newType) {
    setState(() {
      _transitionType = newType;
    });
  }

  void _toggleLoginStatus() {
    setState(() {
      _isLoggedIn = !_isLoggedIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: const Text('Shared axis')),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: PageTransitionSwitcher(
                reverse: !_isLoggedIn,
                transitionBuilder: (
                  Widget child,
                  Animation<double> animation,
                  Animation<double> secondaryAnimation,
                ) {
                  return SharedAxisTransition(
                    animation: animation,
                    secondaryAnimation: secondaryAnimation,
                    transitionType: _transitionType!,
                    child: child,
                  );
                },
                child: _isLoggedIn ? _CoursePage() : _SignInPage(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TextButton(
                    onPressed: _isLoggedIn ? _toggleLoginStatus : null,
                    child: const Text('BACK'),
                  ),
                  ElevatedButton(
                    onPressed: _isLoggedIn ? null : _toggleLoginStatus,
                    child: const Text('NEXT'),
                  ),
                ],
              ),
            ),
            const Divider(thickness: 2.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Radio<SharedAxisTransitionType>(
                  value: SharedAxisTransitionType.horizontal,
                  groupValue: _transitionType,
                  onChanged: (SharedAxisTransitionType? newValue) {
                    _updateTransitionType(newValue);
                  },
                ),
                const Text('X'),
                Radio<SharedAxisTransitionType>(
                  value: SharedAxisTransitionType.vertical,
                  groupValue: _transitionType,
                  onChanged: (SharedAxisTransitionType? newValue) {
                    _updateTransitionType(newValue);
                  },
                ),
                const Text('Y'),
                Radio<SharedAxisTransitionType>(
                  value: SharedAxisTransitionType.scaled,
                  groupValue: _transitionType,
                  onChanged: (SharedAxisTransitionType? newValue) {
                    _updateTransitionType(newValue);
                  },
                ),
                const Text('Z'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _CoursePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        const Padding(padding: EdgeInsets.symmetric(vertical: 8.0)),
        Text(
          'Streamling your courses',
          style: Theme.of(context).textTheme.headlineSmall,
          textAlign: TextAlign.center,
        ),
        const Padding(padding: EdgeInsets.symmetric(vertical: 5.0)),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Text(
            'Bundled categories appear as groups in your feed. '
            'You can always change this later.',
            style: TextStyle(
              fontSize: 12.0,
              color: Colors.grey,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const _CourseSwitch(course: 'Arts & Crafts'),
        const _CourseSwitch(course: 'Business'),
        const _CourseSwitch(course: 'Illustration'),
        const _CourseSwitch(course: 'Design'),
        const _CourseSwitch(course: 'Culinary'),
      ],
    );
  }
}

class _CourseSwitch extends StatefulWidget {
  const _CourseSwitch({
    required this.course,
  });

  final String course;

  @override
  _CourseSwitchState createState() => _CourseSwitchState();
}

class _CourseSwitchState extends State<_CourseSwitch> {
  bool _value = true;

  @override
  Widget build(BuildContext context) {
    final String subtitle = _value ? 'Bundled' : 'Shown Individually';
    return SwitchListTile(
      title: Text(widget.course),
      subtitle: Text(subtitle),
      value: _value,
      onChanged: (bool newValue) {
        setState(() {
          _value = newValue;
        });
      },
    );
  }
}

class _SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final double maxHeight = constraints.maxHeight;
        return Column(
          children: <Widget>[
            Padding(padding: EdgeInsets.symmetric(vertical: maxHeight / 20)),
            Image.asset(
              'assets/avatar_logo.png',
              width: 80,
            ),
            Padding(padding: EdgeInsets.symmetric(vertical: maxHeight / 50)),
            Text(
              'Hi David Park',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            Padding(padding: EdgeInsets.symmetric(vertical: maxHeight / 50)),
            const Text(
              'Sign in with your account',
              style: TextStyle(
                fontSize: 12.0,
                color: Colors.grey,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.only(
                    top: 40.0,
                    left: 15.0,
                    right: 15.0,
                    bottom: 10.0,
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      suffixIcon: Icon(
                        Icons.visibility,
                        size: 20,
                        color: Colors.black54,
                      ),
                      isDense: true,
                      labelText: 'Email or phone number',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: TextButton(
                    onPressed: () {},
                    child: const Text('FORGOT EMAIL?'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: TextButton(
                    onPressed: () {},
                    child: const Text('CREATE ACCOUNT'),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}


 */

// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:flutter/material.dart' hide FormState;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:lawsuit_repository/lawsuit_repository.dart';
import 'package:zloz_mnie/form/form.dart';
import 'package:zloz_mnie/form/view/claim_view.dart';
import 'package:zloz_mnie/form/view/subject_view.dart';
import 'package:zloz_mnie/form/view/widgets/shared_axis_switcher.dart';

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
      create: (_) => FormCubit(
        context.read<LawsuitRepository>(),
      ),
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

class _FormPart extends StatefulWidget {
  const _FormPart();

  @override
  State<_FormPart> createState() => _FormPartState();
}

class _FormPartState extends State<_FormPart> {
  @override
  Widget build(BuildContext context) {
    final state = context.watch<FormCubit>().state;

    return Flexible(
      flex: 7,
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: Column(
          children: [
            Expanded(
              child: SharedAxisSwitcher(
                reverse: state.reverse,
                child: const [
                  SubjectView(),
                  ClaimView(),
                ][state.pageIndex],
              ),
            ),
            /* Row(
                children: [
                  TextButton(
                    child: const Text("Next child"),
                    onPressed: () {
                      setState(() {
                        index--;
                      });
                    },
                  ),
                  TextButton(
                    child: const Text("Next child"),
                    onPressed: () {
                      setState(() {
                        index++;
                      });
                    },
                  ),
                ],
              ), */
          ],
        ),
      ),
    );
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({
    super.key,
    required this.color,
    required this.onBack,
    required this.onNext,
  });

  final Color color;
  final VoidCallback onBack;
  final VoidCallback onNext;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      color: color,
      child: Row(
        children: [
          TextButton(
            onPressed: onBack,
            child: const Text('back'),
          ),
          const Spacer(),
          TextButton(
            onPressed: onNext,
            child: const Text('next'),
          ),
        ],
      ),
    );
  }
}
