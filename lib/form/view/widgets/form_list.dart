import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zloz_mnie/form/form.dart';
import 'package:zloz_mnie/l10n/l10n.dart';

class FormList extends StatelessWidget {
  const FormList({super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 6,
      child: Column(
        children: [
          for (var i = 0; i < 10; i++)
            FormListTile(
              _determineText(context, i),
              i,
            ),
        ],
      ),
    );
  }

  String _determineText(BuildContext context, int i) {
    final l10n = context.l10n;
    switch (i) {
      case 0:
        return l10n.form1;
      case 1:
        return l10n.form2;
      case 2:
        return l10n.form3;
      case 3:
        return l10n.form4;
      case 4:
        return l10n.form5;
      case 5:
        return l10n.form6;
      case 6:
        return l10n.form7;
      case 7:
        return l10n.form8;
      case 8:
        return l10n.form9;
      case 9:
        return l10n.form10;
      default:
        return l10n.form1;
    }
  }
}

class FormListDots extends StatelessWidget {
  const FormListDots({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 6,
      child: Column(
        children: [
          const SizedBox(height: 6),
          for (var i = 0; i < 10; i++) FormListTileDot(i),
        ],
      ),
    );
  }
}
