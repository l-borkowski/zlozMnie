import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:zloz_mnie/form/cubit/form_cubit.dart';
import 'package:zloz_mnie/form/view/widgets/claim/claim_type_tile.dart';
import 'package:zloz_mnie/form/view/widgets/widgets.dart';

class ClaimView extends HookWidget {
  const ClaimView({super.key});

  @override
  Widget build(BuildContext context) {
    final tec = useTextEditingController();

    final state = context.watch<FormCubit>().state;

    return Scaffold(
      appBar: const FormViewAppBar(
        title: 'Wartość przedmiotu sporu',
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
                  'Określ kwotę pieniężną stanowiącą wartość przedmiotu sporu',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 30),
                Row(
                  children: const [
                    Expanded(
                      child: ClaimTypeTile(
                        name: 'Roszczenia pieniężne',
                        id: 0,
                      ),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: ClaimTypeTile(
                        name: 'Sprawy majątkowe',
                        id: 1,
                      ),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: ClaimTypeTile(
                        name: 'Nie dotyczy',
                        id: 2,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 60),
                if (state.claimId != 2) ...[
                  const Text(
                    'Kwota pieniężna o którą toczy się spór',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    width: 300,
                    child: TextField(
                      controller: tec,
                      onChanged: context.read<FormCubit>().claimValueChanged,
                      /* inputFormatters: [
                        MoneyInputFormatter(),
                      ], */
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                        suffixIcon: const SizedBox(
                          width: 60,
                          height: 30,
                          child: Center(
                            child: Text(
                              'PLN',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
                const SizedBox(height: 20),
                Align(
                  alignment: Alignment.bottomRight,
                  child: NextButton(
                    onPressed: state.claimValue != 0 || state.claimId == 2
                        ? context.read<FormCubit>().nextPage
                        : null,
                  ),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
