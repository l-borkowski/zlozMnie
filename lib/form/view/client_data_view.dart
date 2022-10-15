import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:time/time.dart';
import 'package:zloz_mnie/form/form.dart';

class ClientDataPage extends HookWidget {
  const ClientDataPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<FormCubit>();
    final type = context.select<FormCubit, ClientType>(
      (cubit) => cubit.state.selectedClient,
    );
    return Material(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
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
                  _ClientType(
                    'Osoba fizyczna',
                    ClientType.person,
                  ),
                  SizedBox(width: 10),
                  _ClientType(
                    'Firma / Spółka',
                    ClientType.company,
                  ),
                  SizedBox(width: 10),
                  _ClientType(
                    'JDG',
                    ClientType.jdg,
                  ),
                ],
              ),
              const SizedBox(height: 60),
              Column(
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
                            title: type == ClientType.person
                                ? 'Imię'
                                : 'Nazwa firmy',
                            hint: type == ClientType.person
                                ? 'Jan'
                                : 'Hurtownia spożywcza SP. Z O.O.',
                            onChanged: type == ClientType.person
                                ? cubit.nameChanged
                                : cubit.businessChanged,
                            height: 50,
                            width: type == ClientType.person ? 215 : 500,
                          ),
                          if (type == ClientType.person)
                            const SizedBox(width: 35),
                          AnimatedOpacity(
                            curve: Curves.easeInExpo,
                            duration: 400.milliseconds,
                            opacity: type == ClientType.person ? 1 : 0,
                            child: AppTextField(
                              title: 'Nazwisko',
                              hint: 'Kowalski',
                              onChanged: cubit.surnameChanged,
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
                    onChanged: cubit.numberChanged,
                    height: 50,
                    width: 500,
                  ),
                  const SizedBox(height: 20),
                  AppTextField(
                    title: 'Ulica',
                    hint: 'ul. Marii Knopnickiej 32/5',
                    onChanged: cubit.addressChanged,
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
                          onChanged: cubit.cityChanged,
                          height: 50,
                          width: 300,
                        ),
                        AppTextField(
                          title: 'Kod pocztowy',
                          hint: '80-452',
                          onChanged: cubit.zipCodeChanged,
                          height: 50,
                          width: 165,
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
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

class _ClientType extends StatelessWidget {
  const _ClientType(
    this.text,
    this.type,
  );

  final ClientType type;
  final String text;

  @override
  Widget build(BuildContext context) {
    final state = context.watch<FormCubit>().state;
    final active = state.selectedClient == type;
    return GestureDetector(
      onTap: () => context.read<FormCubit>().changeClientType(type),
      child: Container(
        width: 160,
        height: 80,
        decoration: BoxDecoration(
          border: Border.all(
            color: active ? const Color(0xFF4971FF) : Colors.black,
            width: active ? 3 : 1,
          ),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}

class AppTextField extends HookWidget {
  const AppTextField({
    super.key,
    required this.title,
    required this.hint,
    required this.onChanged,
    required this.height,
    required this.width,
  });

  final String title;
  final String hint;
  final void Function(String?) onChanged;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    final controller = useTextEditingController();
    final focusNode = useFocusNode();
    final hasFocus = useState(false);

    useMemoized(() {
      focusNode.addListener(() {
        hasFocus.value = focusNode.hasFocus;
      });
    });

    if (width == 0) return const SizedBox();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 5),
        GestureDetector(
          onTap: focusNode.requestFocus,
          child: AnimatedContainer(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(left: 10),
            duration: 700.milliseconds,
            curve: Curves.fastLinearToSlowEaseIn,
            clipBehavior: Clip.antiAlias,
            width: width,
            height: height,
            decoration: BoxDecoration(
              border: Border.all(
                color: hasFocus.value
                    ? const Color(0xFF4971FF)
                    : const Color(0xFFD3D3D3),
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(8),
              ),
            ),
            child: Expanded(
              child: TextField(
                controller: controller,
                focusNode: focusNode,
                onChanged: onChanged,
                decoration: InputDecoration(
                  isDense: true,
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.zero,
                  hintText: hint,
                  hintStyle: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
