import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:time/time.dart';
import 'package:zloz_mnie/form/form.dart';

class FormListTile extends StatelessWidget {
  const FormListTile(
    this.text, {
    super.key,
    required this.selected,
  });

  final String text;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: 300.milliseconds,
      curve: Curves.fastLinearToSlowEaseIn,
      alignment: Alignment.topRight,
      constraints: const BoxConstraints(
        minWidth: 200,
        minHeight: 40,
        maxHeight: 40,
      ),
      child: Text(
        text,
        textAlign: TextAlign.end,
        style: TextStyle(
          color: selected ? Colors.white : Colors.white54,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class FormListTileDot extends HookWidget {
  const FormListTileDot(
    this.index, {
    super.key,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    final state = context.watch<FormCubit>().state;
    return ConstrainedBox(
      constraints: const BoxConstraints(minHeight: 40, maxHeight: 40),
      child: Column(
        children: [
          AnimatedContainer(
            duration: 300.milliseconds,
            curve: Curves.fastLinearToSlowEaseIn,
            alignment: Alignment.topRight,
            margin: const EdgeInsets.symmetric(horizontal: 25),
            height: 13,
            width: 13,
            decoration: BoxDecoration(
              color: state.selectedForm >= index
                  ? Colors.white
                  : Colors.transparent,
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(100),
            ),
          ),
          Flexible(
            child: Container(
              width: 1,
              color: index != 9 ? Colors.white : Colors.transparent,
            ),
          ),
        ],
      ),
    );
  }
}
