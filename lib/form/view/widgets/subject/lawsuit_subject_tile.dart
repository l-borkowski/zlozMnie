import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lawsuit_repository/models/lawsuit_subject.dart';
import 'package:time/time.dart';
import 'package:zloz_mnie/form/cubit/form_cubit.dart';

class LawsuitSubjectTile extends StatelessWidget {
  const LawsuitSubjectTile(
    this.lawsuitSubject, {
    required this.isSelected,
    super.key,
  });

  final LawsuitSubject lawsuitSubject;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => context.read<FormCubit>().selectSubject(lawsuitSubject.id),
        child: AnimatedContainer(
          curve: Curves.fastLinearToSlowEaseIn,
          width: double.infinity,
          duration: 600.milliseconds,
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 15,
          ),
          margin: const EdgeInsets.only(bottom: 15),
          foregroundDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            border: isSelected
                ? Border.all(color: const Color(0xFF4971FF), width: 3)
                : Border.all(),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                lawsuitSubject.title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                lawsuitSubject.body,
                style: const TextStyle(
                  fontSize: 12,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
