import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:zloz_mnie/form/form.dart';

class SummaryView extends HookWidget {
  const SummaryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const FormViewAppBar(
        title: 'Podsumowanie',
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: SizedBox.expand(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '''Sprawdź poprawność przygotowanego pozwu pod względem spełnienia wymogów formalnych i kompletności pisma.''',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),
              ),
              const SizedBox(height: 40),
              const SizedBox(
                height: 475,
                width: 700,
                child: Center(
                  child: Text('Tu będzie pdf'),
                ),
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  NextButton(
                    text: 'Wydrukuj',
                    onPressed: () {},
                  ),
                  NextButton(
                    onPressed: context.read<FormCubit>().nextPage,
                  ),
                ],
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
