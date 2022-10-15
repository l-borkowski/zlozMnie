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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Container(
            constraints: const BoxConstraints(
              minWidth: 400,
            ),
            width: 800,
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
                ] else ...[
                  const SizedBox(height: 30),
                  ...state.lawsuitSubjects.map(
                    (subject) => LawsuitSubjectTile(
                      subject,
                      isSelected: state.subjectId == subject.id,
                    ),
                  ),
                ],
                const SizedBox(height: 20),
                Align(
                  alignment: Alignment.bottomRight,
                  child: NextButton(
                    onPressed: state.subjectId != -1
                        ? context.read<FormCubit>().nextPage
                        : null,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
