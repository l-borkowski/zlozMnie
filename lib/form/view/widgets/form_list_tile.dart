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
    return Container(
      alignment: Alignment.topRight,
      constraints: const BoxConstraints(
        minWidth: 240,
        minHeight: 40,
        maxHeight: 40,
      ),
      child: AnimatedOpacity(
        opacity: selected ? 1 : 0.5,
        duration: 500.milliseconds,
        curve: Curves.fastOutSlowIn,
        child: Text(
          text,
          textAlign: TextAlign.end,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
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
            duration: 500.milliseconds,
            curve: Curves.fastOutSlowIn,
            alignment: Alignment.topRight,
            margin: const EdgeInsets.symmetric(horizontal: 25),
            height: 13,
            width: 13,
            decoration: BoxDecoration(
              color: state.pageIndex >= index
                  ? Colors.white
                  : Colors.white.withOpacity(0),
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(100),
            ),
          ),
          Flexible(
            child: Container(
              width: 1,
              color: index != 9 ? Colors.white : Colors.white.withOpacity(0),
            ),
          ),
        ],
      ),
    );
  }
}
