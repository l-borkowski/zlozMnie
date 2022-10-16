import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lawsuit_repository/models/models.dart';
import 'package:time/time.dart';
import 'package:zloz_mnie/form/form.dart';

class EntityInfoForm extends StatelessWidget {
  const EntityInfoForm({
    super.key,
    required this.isClient,
  });

  final bool isClient;

  @override
  Widget build(BuildContext context) {
    final type = context.select<FormCubit, ClientType>(
      (cubit) => cubit.state.selectedClient,
    );
    final cubit = context.read<FormCubit>();
    return Column(
      children: [
        SizedBox(
          width: 500,
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppTextField(
                  title: type == ClientType.person ? 'Imię' : 'Nazwa firmy',
                  hint: type == ClientType.person
                      ? 'Jan'
                      : 'Hurtownia spożywcza SP. Z O.O.',
                  onChanged: (val) => type == ClientType.person
                      ? cubit.nameChanged(val, isClient: isClient)
                      : cubit.businessChanged(val, isClient: isClient),
                  height: 50,
                  width: type == ClientType.person ? 215 : 500,
                ),
                if (type == ClientType.person) const SizedBox(width: 35),
                AnimatedOpacity(
                  curve: Curves.easeInExpo,
                  duration: 400.milliseconds,
                  opacity: type == ClientType.person ? 1 : 0,
                  child: AppTextField(
                    title: 'Nazwisko',
                    hint: 'Kowalski',
                    onChanged: (val) =>
                        cubit.surnameChanged(val, isClient: isClient),
                    height: 50,
                    width: type == ClientType.person ? 250 : 0,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),
        AppTextField(
          title: _determineNumberTitle(type),
          hint: '489295723651',
          onChanged: (val) => cubit.numberChanged(val, isClient: isClient),
          height: 50,
          width: 500,
        ),
        const SizedBox(height: 20),
        AppTextField(
          title: 'Ulica',
          hint: 'ul. Marii Knopnickiej 32/5',
          onChanged: (val) => cubit.addressChanged(val, isClient: isClient),
          height: 50,
          width: 500,
        ),
        const SizedBox(height: 20),
        SizedBox(
          width: 500,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppTextField(
                title: 'Miasto',
                hint: 'Gdańsk ',
                onChanged: (val) => cubit.cityChanged(val, isClient: isClient),
                height: 50,
                width: 300,
              ),
              AppTextField(
                title: 'Kod pocztowy',
                hint: '80-452',
                onChanged: (val) =>
                    cubit.zipCodeChanged(val, isClient: isClient),
                height: 50,
                width: 165,
              ),
            ],
          ),
        )
      ],
    );
  }

  String _determineNumberTitle(ClientType type) {
    switch (type) {
      case ClientType.person:
        return 'Numer PESEL';
      case ClientType.jdg:
        return 'Numer NIP';
      case ClientType.company:
        return 'Numer KRS';
    }
  }
}
