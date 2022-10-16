import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lawsuit_repository/models/models.dart';
import 'package:zloz_mnie/form/form.dart';

class ClientTypeButton extends StatelessWidget {
  const ClientTypeButton(
    this.text,
    this.type, {
    super.key,
    this.height = 80,
    this.width = 160,
    required this.isClient,
  });

  final ClientType type;
  final String text;
  final double height;
  final double width;
  final bool isClient;

  @override
  Widget build(BuildContext context) {
    final state = context.watch<FormCubit>().state;
    final active = state.selectedClient == type;
    return GestureDetector(
      onTap: () => context.read<FormCubit>().changeClientType(
            type,
            isClient: isClient,
          ),
      child: Container(
        width: width,
        height: height,
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
