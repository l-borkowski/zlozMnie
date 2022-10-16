import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:lawsuit_repository/models/models.dart';
import 'package:zloz_mnie/form/form.dart';

class ClientDataView extends HookWidget {
  const ClientDataView({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<FormCubit>().state;
    return Scaffold(
      appBar: const FormViewAppBar(
        title: 'Właściwość miejscowa',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),
              ),
              const SizedBox(height: 40),
              Row(
                children: const [
                  ClientTypeButton(
                    'Osoba fizyczna',
                    ClientType.person,
                    isClient: true,
                  ),
                  SizedBox(width: 10),
                  ClientTypeButton(
                    'Firma / Spółka',
                    ClientType.company,
                    isClient: true,
                  ),
                  SizedBox(width: 10),
                  ClientTypeButton(
                    'JDG',
                    ClientType.jdg,
                    isClient: true,
                  ),
                ],
              ),
              const SizedBox(height: 60),
              const EntityInfoForm(isClient: true),
              Align(
                alignment: Alignment.bottomRight,
                child: NextButton(
                  onPressed: state.client != Entity.empty()
                      ? context.read<FormCubit>().nextPage
                      : null,
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
