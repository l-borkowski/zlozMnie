import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:time/time.dart';
import 'package:zloz_mnie/form/form.dart';

class FormListTile extends HookWidget {
  const FormListTile(
    this.text,
    this.index, {
    super.key,
  });

  final String text;
  final int index;

  @override
  Widget build(BuildContext context) {
    final state = context.watch<FormCubit>().state;
    return GestureDetector(
      onTap: () {
        if (index == 6) {
          Future.delayed(Duration(milliseconds: 200),
              () => context.read<FormCubit>().generateDocument());
        }
        context.read<FormCubit>().changeView(index);
      },
      child: Container(
        alignment: Alignment.topRight,
        constraints: const BoxConstraints(
          minWidth: 240,
          minHeight: 55,
          maxHeight: 55,
        ),
        child: AnimatedOpacity(
          opacity: state.pageIndex == index ? 1 : 0.5,
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
      constraints: const BoxConstraints(minHeight: 55, maxHeight: 55),
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
