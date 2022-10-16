import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:lawsuit_repository/models/models.dart';
import 'package:time/time.dart';
import 'package:zloz_mnie/form/form.dart';

class SuedEntityView extends HookWidget {
  const SuedEntityView({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<FormCubit>();
    final state = context.watch<FormCubit>().state;
    return Scaffold(
      appBar: const FormViewAppBar(
        title: 'Powód',
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Wybierz istniejącego powoda lub dodaj nowego',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 15,
              ),
            ),
            const SizedBox(height: 40),
            SizedBox(
              height: 375,
              child: ListView.builder(
                itemCount: state.suedEntitiesList?.length ?? 0,
                itemBuilder: (context, index) {
                  final suedEntity = state.suedEntitiesList!.elementAt(index);
                  final active = state.selectedSuedEntity == suedEntity.id;
                  return SuedEntityTile(active: active, suedEntity: suedEntity);
                },
              ),
            ),
            const SizedBox(height: 35),
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: cubit.showSuedModal,
                child: Row(
                  children: [
                    Container(
                      height: 22,
                      width: 22,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color(0xFF4971FF),
                        ),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.add,
                          color: Color(0xFF4971FF),
                          size: 15,
                        ),
                      ),
                    ),
                    const SizedBox(width: 15),
                    const Text(
                      'Dodaj nowego powoda',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF4971FF),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.bottomRight,
              child: NextButton(
                onPressed: state.suedEntity != Entity.empty()
                    ? context.read<FormCubit>().nextPage
                    : null,
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}

class SuedEntityTile extends HookWidget {
  const SuedEntityTile({
    super.key,
    required this.active,
    required this.suedEntity,
  });

  final bool active;
  final Entity suedEntity;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => context.read<FormCubit>().changeSuedEntity(suedEntity.id),
        child: AnimatedContainer(
          height: 110,
          width: 730,
          duration: 700.milliseconds,
          curve: Curves.fastLinearToSlowEaseIn,
          margin: const EdgeInsets.only(bottom: 15),
          decoration: BoxDecoration(
            border: Border.all(
              color: active ? const Color(0xFF4971FF) : Colors.black,
              width: active ? 3 : 1,
            ),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      suedEntity.clientType == ClientType.person
                          ? '${suedEntity.name} ${suedEntity.surname}'
                          : suedEntity.business!,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      suedEntity.number,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      suedEntity.address,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      '${suedEntity.city} ${suedEntity.zipCode}',
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  suedEntity.clientType.toName,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
