import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:zloz_mnie/form/cubit/form_cubit.dart';
import 'package:zloz_mnie/form/view/widgets/widgets.dart';

class SubjectView extends HookWidget {
  const SubjectView({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<FormCubit>().state;

    useEffect(
      () {
        context.read<FormCubit>().loadLawsuitSubjects();
      },
      [],
    );

    return Scaffold(
      appBar: const FormViewAppBar(
        title: 'Zwrot kosztów procesu i odsetki',
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Wskaż przedmiot podnoszonego roszczenia i jego rodzaj.',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            if (state.lawsuitSubjects.isEmpty) ...[
              const SizedBox(height: 300),
              const Center(
                child: CircularProgressIndicator(),
              )
            ] else
              ...state.lawsuitSubjects.map(LawsuitSubjectTile.new)
          ],
        ),
      ),
    );
  }
}
