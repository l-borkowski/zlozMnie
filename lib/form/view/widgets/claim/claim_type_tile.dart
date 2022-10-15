import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:time/time.dart';
import 'package:zloz_mnie/form/cubit/form_cubit.dart';

class ClaimTypeTile extends StatelessWidget {
  const ClaimTypeTile({
    super.key,
    required this.name,
    required this.id,
  });

  final String name;
  final int id;

  @override
  Widget build(BuildContext context) {
    final state = context.watch<FormCubit>().state;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => context.read<FormCubit>().selectClaimType(id),
        child: AnimatedContainer(
          duration: 600.milliseconds,
          curve: Curves.fastLinearToSlowEaseIn,
          foregroundDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            border: state.claimId == id
                ? Border.all(color: const Color(0xFF4971FF), width: 3)
                : Border.all(),
          ),
          height: 80,
          child: Center(
            child: Text(
              name,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
