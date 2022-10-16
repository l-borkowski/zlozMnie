import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:zloz_mnie/form/cubit/form_cubit.dart';
import 'package:zloz_mnie/form/view/widgets/content/proof_tile.dart';
import 'package:zloz_mnie/form/view/widgets/content/widgets.dart';
import 'package:zloz_mnie/form/view/widgets/widgets.dart';

class ContentView extends HookWidget {
  const ContentView({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<FormCubit>().state;

    return Scaffold(
      appBar: const FormViewAppBar(
        title: 'Treść',
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
                  'Klauzule mediacyjne',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const ContentEditor(),
                const SizedBox(height: 30),
                if (state.proofs.isNotEmpty) ...[
                  const Text(
                    'Dowody',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 25),
                  ...state.proofs.map((proof) => ProofTile(proof: proof))
                ]
              ],
            ),
          ),
        ),
      ),
    );
  }
}