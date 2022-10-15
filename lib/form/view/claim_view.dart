import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zloz_mnie/form/cubit/form_cubit.dart';
import 'package:zloz_mnie/form/view/widgets/widgets.dart';

class ClaimView extends StatelessWidget {
  const ClaimView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const FormViewAppBar(
        title: 'Wartość przedmiotu sporu',
      ),
      body: Row(
        children: [
          TextButton(
            onPressed: () => context.read<FormCubit>().previousPage(),
            child: const Text('Next'),
          ),
        ],
      ),
    );
  }
}
