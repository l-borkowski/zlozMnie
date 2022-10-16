import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:zloz_mnie/form/form.dart';

class RefundView extends HookWidget {
  const RefundView({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<FormCubit>();
    final state = context.watch<FormCubit>().state;
    return Scaffold(
      appBar: const FormViewAppBar(
        title: 'Zwrot kosztów procesu i odsetki ',
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: SizedBox.expand(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '''Wnoszę o zasądzenie od Pozwanego/Pozwanej zwrotu kosztów procesu w całości, w tym kosztów zastępstwa procesowego oraz opłaty skarbowej od pełnomocnictwa według norm przepisanych wraz z odsetkami ustawowymi za opóźnienie od dnia uprawomocnienia się orzeczenia.''',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),
              ),
              const SizedBox(height: 40),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Checkbox(
                    value: state.reimbursement,
                    onChanged: cubit.changeReimbursement,
                    side: const BorderSide(
                      color: Color(0xFF4971FF),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        SizedBox(height: 3),
                        Text(
                          'Dodaj klauzulę dotyczącą zwrotu kosztów procesu i odsetek.',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                        /* Text(
                          '''sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ''',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                          ),
                        ), */
                      ],
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Align(
                alignment: Alignment.bottomRight,
                child: NextButton(
                  onPressed: () {
                    context.read<FormCubit>()
                      ..nextPage()
                      ..generateDocument();
                  },
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
